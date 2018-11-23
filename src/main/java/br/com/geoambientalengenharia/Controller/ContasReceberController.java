package br.com.geoambientalengenharia.Controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.simplemail.Mailer;
import br.com.caelum.vraptor.validator.Severity;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.geoambientalengenharia.DAO.AtividadeDAO;
import br.com.geoambientalengenharia.DAO.ContasReceberDAO;
import br.com.geoambientalengenharia.DAO.ParcelaReceberDAO;
import br.com.geoambientalengenharia.DAO.PessoaFisicaDAO;
import br.com.geoambientalengenharia.DAO.PessoaJuridicaDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import br.com.geoambientalengenharia.Model.ContasReceber;
import br.com.geoambientalengenharia.Model.ParcelaReceber;
import java.math.BigDecimal;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/contasreceber")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class ContasReceberController {

    private ContasReceberDAO crDao;
    private ParcelaReceberDAO prDao;
    private PessoaFisicaDAO pfDao;
    private PessoaJuridicaDAO pjDao;
    private AtividadeDAO atividadeDao;
    private UsuarioLogado userLogado;
    private final Mailer mailer;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public ContasReceberController() {
        this(null, null, null, null, null, null, null, null, null);
    }

    @Inject
    public ContasReceberController(ContasReceberDAO crDao, ParcelaReceberDAO prDao, PessoaFisicaDAO pfDao, PessoaJuridicaDAO pjDao, AtividadeDAO atividadeDao, UsuarioLogado userLogado, Mailer mailer, Result result, Validator validation) {
        this.crDao = crDao;
        this.prDao = prDao;
        this.pfDao = pfDao;
        this.pjDao = pjDao;
        this.atividadeDao = atividadeDao;
        this.userLogado = userLogado;
        this.mailer = mailer;
        this.result = result;
        this.validation = validation;
    }

    @Get("/gerar")
    public void gerar(ContasReceber contasReceber) {
        result.include("contasReceber", contasReceber);
    }

    @Get("/listaParcelasRecebidas")
    public void listaParcelasRecebidas() {
        result.include("listParcelaRecebidas", prDao.listaParcelasPorUsuarioLogado(userLogado.getUserLogado().getIdPessoa()));
    }

    @Get("/listaContas")
    public void listaContas() {
        result.include("listContas", crDao.listaContasPorUsuarioLogado(userLogado.getUserLogado().getIdPessoa()));
    }

    @Get("/lancarRecebimento")
    public void lancarRecebimento(ParcelaReceber parcelaReceber) {
        result.include("parcelaReceber", parcelaReceber);
    }

    @Post("/adiciona")
    public void adiciona(@NotNull @Valid ContasReceber contasReceber, Long idAtividade) {
        validation.addIf(idAtividade == null, new SimpleMessage("atividade", "Nenhuma atividade selecionada"));
        validation.onErrorRedirectTo(this).gerar(contasReceber);
        
        contasReceber.setAtividade(atividadeDao.findById(idAtividade));
        crDao.saveOrUpdate(contasReceber);

        //APÓS REDIRECIONAR PARA EMISSÃO DE UM RECIBO
        result.redirectTo(ProjetoController.class).listaAdmin();
    }

    @Post("/adicionaParcelaRecebida")
    public void adicionaParcelaRecebida(@NotNull @Valid ParcelaReceber parcelaReceber) {
        validation.addIf(parcelaReceber.getContasReceber().getIdContasReceber() == null, new SimpleMessage("parcelaReceber.contasReceber.idContasReceber", "Selecione uma conta"));
        validation.onErrorRedirectTo(this).lancarRecebimento(parcelaReceber);
        validation.addIf(parcelaReceber.getValorRecebido().compareTo(BigDecimal.ZERO) <= 0, new SimpleMessage("parcelaReceber.valorRecebido", "O valor não pode ser igual ou menor que zero"));
        validation.onErrorRedirectTo(this).lancarRecebimento(parcelaReceber);

        prDao.saveOrUpdate(parcelaReceber);

        //APÓS REDIRECIONAR PARA EMISSÃO DE UM RECIBO
        result.redirectTo(this).listaParcelasRecebidas();
    }  

    @Path("/visualizar/{idContasReceber}")
    public void visualizar(Long idContasReceber) {
        result.include("contaReceber", crDao.findById(idContasReceber));
        result.include("dataAtual", LocalDate.now());
    }

    @Path("/relatorio/{idContasReceber}")
    public void relatorio(Long idContasReceber) {
        result.include("contaReceber", crDao.findById(idContasReceber));
    }

    @Path("/recibo/{idParcela}")
    public void recibo(Long idParcela) {
        result.include("parcela", prDao.findById(idParcela));
        result.include("dataAtual", LocalDate.now());
    }

    @Path("/editaContaReceber/{idContasReceber}")
    public void editaContaReceber(Long idContasReceber) {
        result.redirectTo(this).gerar(crDao.findById(idContasReceber));
    }

    @Path("/removeContaReceber/{idContasReceber}")
    public void removeContaReceber(Long idContasReceber) {
        validation.addIf(crDao.validaExclusao(idContasReceber), new SimpleMessage("ContasReceber", "Esta conta possui parcelas lançadas de recebimento"));
        validation.onErrorRedirectTo(this).listaContas();
        crDao.exclui(idContasReceber);
        result.redirectTo(this).listaContas();
    }

    @Path("/editaParcelaRecebida/{idParcelaReceber}")
    public void editaParcelaRecebida(Long idParcelaReceber) {
        result.redirectTo(this).lancarRecebimento(prDao.findById(idParcelaReceber));
    }

    @Path("/removeParcelaRecebida/{idParcelaReceber}")
    public void removeParcelaRecebida(Long idParcelaReceber) {        
        prDao.exclui(idParcelaReceber);
        result.redirectTo(this).listaParcelasRecebidas();
    }

    @Get("/buscaPessoa/{tpPessoa}")
    public void buscaPessoa(String tpPessoa) {
        if (tpPessoa.equals("PessoaFisica")) {
            result.use(Results.json()).withoutRoot().from(pfDao.listAll()).serialize();
        } else {
            result.use(Results.json()).withoutRoot().from(pjDao.listAll()).serialize();
        }
    }

    @Get("/buscaAtividade/{idPessoa}")
    public void buscaAtividade(Long idPessoa) {
        result.use(Results.json()).withoutRoot().from(atividadeDao.listAtividadeByPessoa(idPessoa)).serialize();
    }

    @Get("/buscaContaReceber/{idContasReceber}")
    public void buscaContaReceber(Long idContasReceber) {
        result.use(Results.json()).withoutRoot().from(crDao.listFindByIdAtividade(idContasReceber)).serialize();
    }

    @Path("/emailCobranca/{emailCliente}")
    public void emailCobranca(String emailCliente) {
        try {
            Email email = new SimpleEmail();
            email.setSubject("Pagamento Pendente");
            email.addTo(emailCliente);
            email.setMsg("Olá, \nPor favor entre em contato conosco para quitar sua pendência financeira pelo telefone: (18) 3203-3759 \n\nAtt\nGeoambiental Engenharia");
            mailer.send(email); // Hostname, port and security settings are made by the Mailer
            result.include("email", "sucesso");
            result.redirectTo(this).listaContas();
        } catch (EmailException e) {
            System.out.println(e.toString());
        }
    }
}
