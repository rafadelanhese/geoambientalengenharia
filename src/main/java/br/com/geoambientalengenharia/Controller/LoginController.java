package br.com.geoambientalengenharia.Controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.geoambientalengenharia.DAO.ParametroDAO;
import br.com.geoambientalengenharia.DAO.PessoaDAO;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import br.com.geoambientalengenharia.Model.Parametro;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Sessao.AtividadeItemSessao;
import br.com.geoambientalengenharia.Sessao.ItensSessao;
import br.com.geoambientalengenharia.Utils.SafePass;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/login")
public class LoginController {

    private PessoaDAO pessoaDao;
    private ParametroDAO paramDao;
    private UsuarioLogado userLogado;
    private AtividadeItemSessao aiSessao;
    private ItensSessao itensSessao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public LoginController() {
        this(null, null, null, null, null, null, null);
    }

    @Inject
    public LoginController(PessoaDAO pessoaDao, ParametroDAO paramDao, UsuarioLogado userLogado, AtividadeItemSessao aiSessao, ItensSessao itensSessao, Result result, Validator validation) {
        this.pessoaDao = pessoaDao;
        this.paramDao = paramDao;
        this.userLogado = userLogado;
        this.aiSessao = aiSessao;
        this.itensSessao = itensSessao;
        this.result = result;
        this.validation = validation;
    }

    @Path("/index")
    public void index() {
    }

    @Path("/registrar")
    public void registrar() {

    }

    @Post("/autentica")
    public void autentica(String email, String senha) {
        validation.addIf(email == null || senha == null, new SimpleMessage("erro", "Email e/ou Senha não pode ser nulo")).onErrorRedirectTo(this).index();

        Pessoa usuario = pessoaDao.login(email);
        String senhaEncriptada = null;
        try {
            senhaEncriptada = SafePass.crypPass(senha);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (usuario != null && usuario.getSenha().equals(senhaEncriptada)) {

            //SETANDO UM USUÁRIO DE PESSOAFISICA PARA TESTE            
            Pessoa pessoa = new Pessoa(usuario.getIdPessoa(), usuario.getNome(), usuario.getSetor(), usuario.getTelefone(), usuario.getTipousuario());
            userLogado.logar(pessoa);

            //request.setAttribute("PessoaLogada", userLogado.getUserLogado());
            if (userLogado.isAdministrador()) {
                /*
                VERIFICA SE O SISTEMA JÁ ESTÁ PARAMETRIZADO
                 */
                if (paramDao.isEmpty()) {
                    result.redirectTo(ParametroController.class).cadastro(new Parametro());
                } else {
                    result.redirectTo(PainelControleController.class).index();
                }
            } else {
                if (userLogado.isCliente()) {
                    //SE O USUARIO LOGADO NÃO FOR ADMINISTRADOR REDIRECIONAR PARA A PÁGINA DELE               
                    result.redirectTo(ProjetoController.class).listaCliente();
                } else {
                    //SE O USUÁRIO NÃO FOR CLIENTE NEM ADMINISTRADOR É REDIRECIONADO PARA OUTRA PÁGINA
                    result.include("erro", "* Você não tem permissão de acesso a área restrita.");
                    result.redirectTo(LoginController.class).index();
                }
            }
        } else {
            result.include("erro", "* E-mail eou senha não confere ou não está cadastrado.");
            result.redirectTo(LoginController.class).index();
        }
    }

    @Post("/logoff")
    public void logoff() {
        aiSessao.fecharSessao();
        itensSessao.fecharSessao();
        userLogado.deslogar();
        result.redirectTo(LoginController.class).index();
    }
}
