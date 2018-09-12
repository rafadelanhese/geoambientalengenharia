/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.geoambientalengenharia.DAO.CidadeDAO;
import br.com.geoambientalengenharia.DAO.EnderecoDAO;
import br.com.geoambientalengenharia.DAO.EstadoDAO;
import br.com.geoambientalengenharia.DAO.PessoaDAO;
import br.com.geoambientalengenharia.DAO.PessoaFisicaDAO;
import br.com.geoambientalengenharia.DAO.PessoaJuridicaDAO;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import br.com.geoambientalengenharia.DAO.TipoUsuarioDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.Cidade;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.PessoaFisica;
import br.com.geoambientalengenharia.Model.PessoaJuridica;
import br.com.geoambientalengenharia.Utils.SafePass;
import br.com.geoambientalengenharia.Validation.LoginAvailable;
import static com.google.common.base.Strings.isNullOrEmpty;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.validation.Valid;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/pessoa")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class PessoaController {

    private PessoaDAO pessoaDao;
    private PessoaFisicaDAO pessoaFisicaDao;
    private PessoaJuridicaDAO pessoaJuridicaDao;
    private TipoUsuarioDAO tipoUsuarioDao;
    private SetorDAO setorDao;
    private CidadeDAO cidadeDao;
    private EstadoDAO estadoDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public PessoaController() {
        this(null, null, null, null, null, null, null, null, null);
    }

    @Inject
    public PessoaController(PessoaDAO pessoaDao, PessoaFisicaDAO pessoaFisicaDao, PessoaJuridicaDAO pessoaJuridicaDao, TipoUsuarioDAO tipoUsuarioDao, SetorDAO setorDao, CidadeDAO cidadeDao, EstadoDAO estadoDao, Result result, Validator validation) {
        this.pessoaDao = pessoaDao;
        this.pessoaFisicaDao = pessoaFisicaDao;
        this.pessoaJuridicaDao = pessoaJuridicaDao;
        this.tipoUsuarioDao = tipoUsuarioDao;
        this.setorDao = setorDao;
        this.cidadeDao = cidadeDao;
        this.estadoDao = estadoDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/cadastro")
    public void cadastro(Pessoa pessoa) {
        if (pessoa.getIdPessoa() != null) {
            if (pessoa.getClass() == PessoaFisica.class) {
                pessoaFisicaDao.refresh((PessoaFisica) pessoa);
                result.include("pessoafisica", pessoa);
            } else if (pessoa.getClass() == PessoaJuridica.class) {
                pessoaJuridicaDao.refresh((PessoaJuridica) pessoa);
                result.include("pessoajuridica", pessoa);
            }
        }
        result.include("pessoa", pessoa);
        result.include("tipoList", tipoUsuarioDao.listAll());
        result.include("setorList", setorDao.listAll());
        result.include("estadoList", estadoDao.listAll());
    }

    @Post("/adiciona")
    public void adiciona(@Valid @LoginAvailable Pessoa pessoa, List<Long> tipo_usuario) {
        validation.addIf(tipo_usuario == null || tipo_usuario.isEmpty(), new SimpleMessage("pessoa.tipousuario", "Nenhum checkbox de tipo de usuário foi checado"));
        validation.addIf(pessoa.getSetor().getIdSetor() == null, new SimpleMessage("pessoa.setor.idSetor", "Nenhum setor foi selecionado"));
        validation.addIf(pessoa.getClass() != PessoaFisica.class && pessoa.getClass() != PessoaJuridica.class, new SimpleMessage("tipoUsuario", "Selecione um tipo de usuário"));
        validation.onErrorRedirectTo(this).cadastro(pessoa);

        /*
        NO VALIDATION JÁ VERIFICA SE O tipo_usuario É NULO, CASO NÃO FOR ELE FAZ O FOR,
        CASO ELE ESTIVER NULO É REDIRECIONADO PARA A PÁGINA DE CADASTRO
         */
        for (int i = 0; i < tipo_usuario.size(); i++) {
            pessoa.setTipousuario(tipoUsuarioDao.findById(tipo_usuario.get(i)));
        }

        //SETA ATIVIDADE NO TELEFONE
        for (int i = 0; i < pessoa.getTelefone().size(); i++) {
            pessoa.getTelefone().get(i).setPessoa(pessoa);
        }

        //VERIFICA SE É UM NOVO USUÁRIO E ENCRIPTA A SENHA
        if (pessoa.getIdPessoa() == null) {
            try {
                /*
            ENCRIPTA A SENHA DIGITADA PELO USUÁRIO
                 */
                String senhaEncriptada = SafePass.crypPass(pessoa.getSenha());
                pessoa.setSenha(senhaEncriptada);

            } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
                Logger.getLogger(PessoaController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (pessoa.getClass() == PessoaFisica.class) {
            pessoaFisicaDao.saveOrUpdate((PessoaFisica) pessoa);
            result.include("sucesso", "Usuário: " + pessoa.getNome() + ", adicionado com sucesso");
            result.redirectTo(this).lista();
        } else {
            if (pessoa.getClass() == PessoaJuridica.class) {
                pessoaJuridicaDao.saveOrUpdate((PessoaJuridica) pessoa);
                result.include("sucesso", "Usuário: " + pessoa.getNome() + ", adicionado com sucesso");
                result.redirectTo(this).lista();
            }
        }
    }

    @Get
    @Path("/lista")
    public void lista() {
        result.include("pessoaList", pessoaDao.listAll());
    }

    @Path("/visualizar/{classe}/{idPessoa}")
    public void visualizar(String classe, Long idPessoa) {
        switch (classe) {
            case "PessoaFisica":
                result.include("pessoa", pessoaFisicaDao.findById(idPessoa));
                break;
            case "PessoaJuridica":
                result.include("pessoa", pessoaJuridicaDao.findById(idPessoa));               
                break;
        }                
    }
    
    @Path("/remove/{classe}/{idPessoa}")
    public void remove(String classe, Long idPessoa) {
        switch (classe) {
            case "PessoaFisica":
                pessoaFisicaDao.delete(pessoaFisicaDao.findById(idPessoa));
                break;
            case "PessoaJuridica":
                pessoaJuridicaDao.delete(pessoaJuridicaDao.findById(idPessoa));               
                break;
        }        
        result.on(ConstraintViolationException.class)
                .include("validacao", "O registro escolhido está vinculado em outras partes do sistema, não é possível excluir")
                .redirectTo(this)
                .lista();
        result.redirectTo(this).lista();
    }

    @Path("/edita/{tipoEdicao}/{idPessoa}")
    public void edita(String tipoEdicao, Long idPessoa) {
        switch (tipoEdicao) {
            case "Edita":
                result.redirectTo(this).cadastro(pessoaDao.findById(idPessoa));
                break;
            case "Senha":
                result.redirectTo(this).senha(pessoaDao.findPessoa(idPessoa));
                break;
        }

    }

    @Path("/visualiza/{idPessoa}")
    public void visualiza(Long idPessoa) {
        result.use(Results.json()).withoutRoot().from(pessoaDao.findById(idPessoa)).include("endereco").serialize();
    }

    @Path("/senha")
    public void senha(Pessoa pessoa) {
        result.include("pessoa", pessoa);
    }

    @Post("/alteraSenha")
    public void alteraSenha(Pessoa pessoa, String senha) {
        validation.addIf(senha.length() < 6, new SimpleMessage("Senha", "Senha deve conter no minímo 6 caracteres"));
        validation.addIf(senha == null || senha.isEmpty(), new SimpleMessage("Senha", "Senha não pode estar vazia"));
        validation.onErrorRedirectTo(this).senha(pessoa);
        try {
            pessoaDao.alteraSenha(pessoa, SafePass.crypPass(senha));
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            Logger.getLogger(PessoaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        result.redirectTo(this).lista();
    }

    @Get("/buscaCidades/{idEstado}")
    public void getCidades(Long idEstado) {
        List<Cidade> cidades = cidadeDao.cidadeByEstado(idEstado);
        result.use(Results.json()).withoutRoot().from(cidades).serialize();
    }

    @Get("/buscaCidadePorNome/{nomeCidade}")
    public void buscaCidadePorNome(String nomeCidade) {
        result.use(Results.json()).withoutRoot().from(cidadeDao.cidadeByNome(nomeCidade)).include("estado").serialize();
    }
}
