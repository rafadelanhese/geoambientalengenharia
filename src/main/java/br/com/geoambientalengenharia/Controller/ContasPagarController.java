/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.serialization.gson.WithoutRoot;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.geoambientalengenharia.DAO.ContasPagarDAO;
import br.com.geoambientalengenharia.DAO.ParcelaDAO;
import br.com.geoambientalengenharia.DAO.PessoaFisicaDAO;
import br.com.geoambientalengenharia.DAO.PessoaJuridicaDAO;
import br.com.geoambientalengenharia.DAO.TipoDespesaDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.ContasPagar;
import br.com.geoambientalengenharia.Model.Parcela;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/contaspagar")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class ContasPagarController {

    private PessoaFisicaDAO pfDao;
    private PessoaJuridicaDAO pjDao;
    private ContasPagarDAO cpDao;
    private TipoDespesaDAO tipoDespesaDao;
    private ParcelaDAO parcelaDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public ContasPagarController() {
        this(null, null, null, null, null, null, null);
    }

    @Inject
    public ContasPagarController(PessoaFisicaDAO pfDao, PessoaJuridicaDAO pjDao, ContasPagarDAO cpDao, TipoDespesaDAO tipoDespesaDao, ParcelaDAO parcelaDao, Result result, Validator validation) {
        this.pfDao = pfDao;
        this.pjDao = pjDao;
        this.cpDao = cpDao;
        this.tipoDespesaDao = tipoDespesaDao;
        this.parcelaDao = parcelaDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/gerar")
    public void gerar(ContasPagar contasPagar) {
        if (contasPagar.getIdContasPagar() != null) {            
            result.include("valor", contasPagar.valorTotal());
        }
        result.include("contasPagar", contasPagar);
        result.include("tipoDespesaList", tipoDespesaDao.listAll());
    }

    @Post("/adiciona")
    public void adiciona(@NotNull @Valid ContasPagar contasPagar, BigDecimal valor, BigDecimal qtdeParcelas, LocalDate lancarParcelas) {
        validation.addIf(valor == null || valor.signum() <= 0, new SimpleMessage("valor", "Valor inválido"));
        validation.addIf(qtdeParcelas == null, new SimpleMessage("qtdeParcelas", "Insira a quantidade de parcelas"));
        validation.addIf(lancarParcelas == null, new SimpleMessage("lancarParcelas", "Data não pode estar em branco"));
        validation.addIf(contasPagar.getTipoDespesa().getIdTipoDespesa() == null, new SimpleMessage("contasPagar.tipoDespesa.idTipoDespesa", "Selecione um tipo de despesa"));
        validation.addIf(contasPagar.getPessoa().getIdPessoa() == null, new SimpleMessage("contasPagar.pessoa.idPessoa", "Selecione um fornecedor"));
        validation.onErrorRedirectTo(this).gerar(contasPagar);
        validation.addIf(lancarParcelas.isBefore(LocalDate.now()), new SimpleMessage("lancarParcelas", "Data para lançamento de parcelas não pode ser menor que a data atual"));
        validation.addIf(valor.compareTo(BigDecimal.ZERO) < 0, new SimpleMessage("valor", "Insira um valor maior que zero"));
        validation.onErrorRedirectTo(this).gerar(contasPagar);

        contasPagar.setDatalancamento(LocalDate.now());

        if (contasPagar.getIdContasPagar() != null) {
            parcelaDao.deletaTodosPorIdContasPagar(contasPagar.getIdContasPagar());
        }
        //VALOR DA PARCELA
        BigDecimal valorParcela = valor.divide(qtdeParcelas, MathContext.DECIMAL128).setScale(2, RoundingMode.HALF_EVEN);
        BigDecimal total = BigDecimal.ZERO;
        for (int i = 1; i <= qtdeParcelas.intValue(); i++) {
            contasPagar.addParcelas(new Parcela(valorParcela, i + "/" + qtdeParcelas, lancarParcelas, null, null, contasPagar));
            total = total.add(valorParcela);
            lancarParcelas = lancarParcelas.plusMonths(1);
        }

        BigDecimal diferenca = valor.subtract(total);
        if (diferenca.compareTo(BigDecimal.ZERO) > 0) {
            valorParcela = contasPagar.getParcelas().get(contasPagar.getParcelas().size() - 1).getValor();
            contasPagar.getParcelas().get(contasPagar.getParcelas().size() - 1).setValor(valorParcela.add(diferenca));
        }

        cpDao.saveOrUpdate(contasPagar);
        result.redirectTo(this).lista();
    }

    @Get
    @Path("/lista")
    public void lista() {
        result.include("contaspagarList", cpDao.listAll());
    }

    @Get
    @Path("/listaparcelas")
    public void listaParcelas() {
        result.include("parcelaList", parcelaDao.listParcelasMes());
    }

    @Get("/listaParcelasPagas")
    public void listaParcelasPagas() {
        result.include("parcelaList", parcelaDao.listaParcelasPagas());
    }

    @Path("/remove/{idContasPagar}")
    public void remove(Long idContasPagar) {
        validation.addIf(idContasPagar == null, new SimpleMessage("conta", "ID Conta a pagar é nulo")).onErrorRedirectTo(this).lista();
        cpDao.delete(cpDao.findById(idContasPagar));
        result.redirectTo(this).lista();
    }

    @Path("/edita/{idContasPagar}")
    public void edita(Long idContasPagar) {
        result.redirectTo(this).gerar(cpDao.findById(idContasPagar));
    }

    @Path("/visualizar/{idContasPagar}")
    public void visualizar(Long idContasPagar) {
        result.include("contaPagar", cpDao.findById(idContasPagar));
    }

    @Get("/buscaPessoa/{tpPessoa}")
    public void getPessoa(String tpPessoa) {
        if (tpPessoa.equals("PessoaFisica")) {
            result.use(Results.json()).withoutRoot().from(pfDao.listAll()).serialize();
        } else {
            result.use(Results.json()).withoutRoot().from(pjDao.listAll()).serialize();
        }
    }

    @Get("/visualiza/{idContasPagar}")
    public void getVisualiza(Long idContasPagar) {
        result.use(Results.json()).withoutRoot().from(cpDao.findById(idContasPagar)).include("pessoa").include("parcelas").include("datalancamento").serialize();
    }

    @Get("/parcela/{idParcela}")
    public void parcela(Long idParcela) {
        result.include("pcl", parcelaDao.findById(idParcela));
        result.include("proximasParcelasList", parcelaDao.listParcelaByIdConta(parcelaDao.findById(idParcela).getContasPagar().getIdContasPagar()));
    }

    @Post("/lancaPagamentoParcela")
    public void lancaPagamentoParcela(@NotNull @Valid Parcela pcl) {
        validation.addIf(pcl.getDatapagamento() == null, new SimpleMessage("parcela", "Data do pagamento  não pode ser nula")).onErrorRedirectTo(this).parcela(pcl.getIdParcela());
        validation.addIf(pcl.getValorpago() == null || pcl.getValorpago().signum() <= 0, new SimpleMessage("parcela", "Valor a ser pago inválido")).onErrorRedirectTo(this).parcela(pcl.getIdParcela());
        parcelaDao.saveOrUpdate(pcl);
        result.redirectTo(this).listaParcelas();
    }
}
