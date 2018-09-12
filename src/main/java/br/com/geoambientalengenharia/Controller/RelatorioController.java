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
import br.com.geoambientalengenharia.DAO.EstadoDAO;
import br.com.geoambientalengenharia.DAO.LicencaDAO;
import br.com.geoambientalengenharia.DAO.OrcamentoDAO;
import br.com.geoambientalengenharia.DAO.ParcelaDAO;
import br.com.geoambientalengenharia.DAO.ParcelaReceberDAO;
import br.com.geoambientalengenharia.DAO.PessoaDAO;
import br.com.geoambientalengenharia.DAO.ProjetoDAO;
import br.com.geoambientalengenharia.DAO.ServicoDAO;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import br.com.geoambientalengenharia.DAO.TipoOrcamentoDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.Cidade;
import br.com.geoambientalengenharia.Model.Licenca;
import br.com.geoambientalengenharia.Model.Orcamento;
import br.com.geoambientalengenharia.Model.Parcela;
import br.com.geoambientalengenharia.Model.ParcelaReceber;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.Projeto;
import br.com.geoambientalengenharia.Model.Servico;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/relatorio")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class RelatorioController {

    private PessoaDAO pessoaDao;   
    private SetorDAO setorDao;
    private TipoOrcamentoDAO tipoorcamentoDao;
    private ProjetoDAO projetoDao;
    private ServicoDAO servicoDao;
    private LicencaDAO licencaDao;
    private OrcamentoDAO orcamentoDao;
    private ParcelaDAO parcelaDao;
    private ParcelaReceberDAO prDao;
    private CidadeDAO cidadeDao;
    private EstadoDAO estadoDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public RelatorioController() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    @Inject 
    public RelatorioController(PessoaDAO pessoaDao, SetorDAO setorDao, TipoOrcamentoDAO tipoorcamentoDao, ProjetoDAO projetoDao, ServicoDAO servicoDao, LicencaDAO licencaDao, OrcamentoDAO orcamentoDao, ParcelaDAO parcelaDao, ParcelaReceberDAO prDao, CidadeDAO cidadeDao, EstadoDAO estadoDao, Result result, Validator validation) {
        this.pessoaDao = pessoaDao;
        this.setorDao = setorDao;
        this.tipoorcamentoDao = tipoorcamentoDao;
        this.projetoDao = projetoDao;
        this.servicoDao = servicoDao;
        this.licencaDao = licencaDao;
        this.orcamentoDao = orcamentoDao;
        this.parcelaDao = parcelaDao;
        this.prDao = prDao;
        this.cidadeDao = cidadeDao;
        this.estadoDao = estadoDao;
        this.result = result;
        this.validation = validation;
    }

    
    @Path("/index")
    public void index() {
        result.include("setorList", setorDao.listAll());
        result.include("estadoList", estadoDao.listAll());
        result.include("pessoaList", pessoaDao.listaTodos());
        result.include("tipoOrcamentoList", tipoorcamentoDao.listAll());
    }

    @Get("/buscaCidades/{idEstado}")
    public void buscaCidades(Long idEstado) {
        List<Cidade> cidades = cidadeDao.cidadeByEstado(idEstado);
        result.use(Results.json()).withoutRoot().from(cidades).serialize();
    }

    //RELATÓRIOS     
    @Post("/relatorioPorCidade")
    public void relatorioPorCidade(String tipoRelatorio, Long idChave) {
        validation.addIf(tipoRelatorio == null, new SimpleMessage("Tipo", "Nenhum Tipo de Relatório selecionado"));
        validation.addIf(idChave == null, new SimpleMessage("Chave", "Chave de busca não enviada"));
        validation.onErrorRedirectTo(this).index();

        if (tipoRelatorio.equals("Projeto")) {
            result.redirectTo(this).relatorioProjeto(projetoDao.listaPorCidade(idChave));
        }

        if (tipoRelatorio.equals("Servico")) {
            result.redirectTo(this).relatorioServico(servicoDao.listaPorCidade(idChave));
        }

        if (tipoRelatorio.equals("Licenca")) {
            result.redirectTo(this).relatorioLicenca(licencaDao.listaPorCidade(idChave));
        }

        if (tipoRelatorio.equals("Orcamento")) {
            result.redirectTo(this).relatorioOrcamento(orcamentoDao.listaPorCidade(idChave));
        }

        if (tipoRelatorio.equals("Cliente")) {
            result.redirectTo(this).relatorioCliente(pessoaDao.listaPorCidade(idChave));
        }

    }

    @Post("/relatorioPorSetor")
    public void relatorioPorSetor(String tipoRelatorio, Long idChave) {
        validation.addIf(tipoRelatorio == null, new SimpleMessage("Tipo", "Nenhum Tipo de Relatório selecionado"));
        validation.addIf(idChave == null, new SimpleMessage("Chave", "Chave de busca não enviada"));
        validation.onErrorRedirectTo(this).index();

        if (tipoRelatorio.equals("Cliente")) {
            result.redirectTo(this).relatorioCliente(pessoaDao.listaPorSetor(idChave));
        }
    }

    @Post("/relatorioPorCliente")
    public void relatorioPorCliente(String tipoRelatorio, Long idChave) {
        validation.addIf(tipoRelatorio == null, new SimpleMessage("Tipo", "Nenhum Tipo de Relatório selecionado"));
        validation.onErrorRedirectTo(this).index();

        if (tipoRelatorio.equals("Projeto")) {
            result.redirectTo(this).relatorioProjeto(projetoDao.listaPorPessoa(idChave));
        }

        if (tipoRelatorio.equals("Servico")) {
            result.redirectTo(this).relatorioServico(servicoDao.listaPorPessoa(idChave));
        }

        if (tipoRelatorio.equals("Licenca")) {
            result.redirectTo(this).relatorioLicenca(licencaDao.listaPorPessoa(idChave));
        }

        if (tipoRelatorio.equals("Orcamento")) {
            result.redirectTo(this).relatorioOrcamento(orcamentoDao.listaPorPessoa(idChave));
        }
        
        if (tipoRelatorio.equals("CP")) {
            result.redirectTo(this).relatorioContasPagar(parcelaDao.listaPorPessoa(idChave));
        }
        
        if (tipoRelatorio.equals("CR")) {
            result.redirectTo(this).relatorioContasReceber(prDao.listaPorPessoa(idChave));
        }
    }

    @Post("/relatorioFaixaData")
    public void relatorioFaixaData(String tipoRelatorio, Date dataInicio, Date dataFinal) {
        validation.addIf(tipoRelatorio == null, new SimpleMessage("Tipo", "Nenhum Tipo de Relatório selecionado"));
        validation.addIf(dataInicio == null, new SimpleMessage("Chave", "Data Início vazio"));
        validation.addIf(dataFinal == null, new SimpleMessage("Chave", "Data Final vazio"));
        validation.onErrorRedirectTo(this).index();

        if (tipoRelatorio.equals("Projeto")) {
            result.redirectTo(this).relatorioProjeto(projetoDao.listaPorData(dataInicio, dataFinal));
        }

        if (tipoRelatorio.equals("Servico")) {
            result.redirectTo(this).relatorioServico(servicoDao.listaPorData(dataInicio, dataFinal));
        }

        if (tipoRelatorio.equals("Licenca")) {
            result.redirectTo(this).relatorioLicenca(licencaDao.listaPorData(dataInicio, dataFinal));
        }

        if (tipoRelatorio.equals("Orcamento")) {
            result.redirectTo(this).relatorioOrcamento(orcamentoDao.listaPorData(dataInicio, dataFinal));
        }
        
        if (tipoRelatorio.equals("CP")) {
            result.redirectTo(this).relatorioContasPagar(parcelaDao.listaPorData(dataInicio, dataFinal));
        }
        
        if (tipoRelatorio.equals("CR")) {
            result.redirectTo(this).relatorioContasReceber(prDao.listaPorData(dataInicio, dataFinal));
        }
    }

    @Path("/relatorioProjeto")
    public void relatorioProjeto(List<Projeto> listaProjeto) {
        result.include("projetoList", listaProjeto);
    }

    @Path("/relatorioLicenca")
    public void relatorioLicenca(List<Licenca> listaLicenca) {
        result.include("licencaList", listaLicenca);
    }

    @Path("/relatorioServico")
    public void relatorioServico(List<Servico> listaServico) {
        result.include("servicoList", listaServico);
    }

    @Path("/relatorioOrcamento")
    public void relatorioOrcamento(List<Orcamento> listaOrcamento) {
        result.include("orcamentoList", listaOrcamento);
    }

    @Path("/relatorioCliente")
    public void relatorioCliente(List<Pessoa> listaPessoas) {
        result.include("pessoaList", listaPessoas);
    }
    
    @Path("/relatorioContasPagar")
    public void relatorioContasPagar(List<Parcela> listaParcelas) {
        result.include("parcelaList", listaParcelas);
    }

    @Path("/relatorioContasReceber")
    public void relatorioContasReceber(List<ParcelaReceber> listaParcelas) {
        result.include("parcelaReceberList", listaParcelas);
    }
}
