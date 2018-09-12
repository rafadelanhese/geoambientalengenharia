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
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.geoambientalengenharia.File.Arquivo;
import br.com.geoambientalengenharia.DAO.ContasReceberDAO;
import br.com.geoambientalengenharia.DAO.DocumentoDAO;
import br.com.geoambientalengenharia.DAO.LicencaDAO;
import br.com.geoambientalengenharia.DAO.RenovacaoDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.ClienteLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import br.com.geoambientalengenharia.Model.ContasReceber;
import br.com.geoambientalengenharia.Model.Licenca;
import br.com.geoambientalengenharia.Model.Renovacao;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/licenca")
public class LicencaController {

    private UsuarioLogado userLogado;
    private LicencaDAO licencaDao;
    private RenovacaoDAO renovacaoDao;
    private ContasReceberDAO contasReceberDao;
    private Arquivo duBusiness;
    private Result result;
    private final Validator validation;
    private HttpSession session;

    /**
     * @deprecated CDI eyes only
     */
    public LicencaController() {
        this(null, null, null, null, null, null, null, null);
    }

    @Inject
    public LicencaController(UsuarioLogado userLogado, LicencaDAO licencaDao, RenovacaoDAO renovacaoDao, ContasReceberDAO contasReceberDao, Arquivo duBusiness, Result result, Validator validation, HttpSession session) {
        this.userLogado = userLogado;
        this.licencaDao = licencaDao;
        this.renovacaoDao = renovacaoDao;
        this.contasReceberDao = contasReceberDao;
        this.duBusiness = duBusiness;
        this.result = result;
        this.validation = validation;
        this.session = session;
    }

    @Get("/lista")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void listaAdmin() {
        result.include("listLicenca", licencaDao.listAllByAdmin(userLogado.getUserLogado().getIdPessoa()));
    }

    @Get("/listaCliente")
    @CustomBrutauthRules({LogadoRule.class, ClienteLogado.class})
    public void listaCliente() {
        result.include("listLicenca", licencaDao.listaTodosCliente(userLogado.getUserLogado().getIdPessoa()));
    }   

    @Get("/visualizar/{idLicenca}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void visualizar(Long idLicenca) {   
        result.include("licenca", licencaDao.findById(idLicenca));
    }

    @Get("/visualizarCliente/{idLicenca}")
    @CustomBrutauthRules({LogadoRule.class, ClienteLogado.class})
    public void visualizarCliente(Long idLicenca) {
        result.include("licenca", licencaDao.findById(idLicenca));
    }

    @Path("/relatorio/{idLicenca}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void relatorio(Long idLicenca) {
        result.include("licenca", licencaDao.findById(idLicenca));
    }

    @Path("/visualizarOrcamento/{idOrcamento}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void visualizarOrcamento(Long idOrcamento) {
        //VEREFICAR SE NÃO FOR ADMIN
        validation.addIf(idOrcamento == null, new SimpleMessage("Orçamento", "Nenhum orçamento foi selecionado")).onErrorRedirectTo(this).listaAdmin();
        result.redirectTo(OrcamentoController.class).visualizar(idOrcamento);
    }

    @Post("/uploadArquivos")
    @UploadSizeLimit(sizeLimit = 40 * 1024 * 1024, fileSizeLimit = 40 * 1024 * 1024)
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void uploadArquivos(@Valid Long idAtividade, List<UploadedFile> files) {
        duBusiness.uploadArquivos(idAtividade, files);
        result.redirectTo(this).visualizar(idAtividade);
    }

    @Get("/download/{idAtividade}/{idDocumento}")
    @CustomBrutauthRules({LogadoRule.class})
    public Download download(Long idAtividade, Long idDocumento) {
        return duBusiness.download(idAtividade, idDocumento);
    }

    @Path("/removeDocumento/{idAtividade}/{idDocumento}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void removeDocumento(Long idAtividade, Long idDocumento) {
        duBusiness.excluirArquivo(idAtividade, idDocumento);
        result.redirectTo(this).visualizar(idAtividade);
    }

    @Post
    @Path("/cadastraRenovacao")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void cadastraRenovacao(@NotNull @Valid Long idAtividade, Renovacao renovacao, ContasReceber contasReceber) {
        validation.addIf(renovacao.getDataInicial() == null, new SimpleMessage("renovacção", "Renovação - Data Inicial não pode ser nula"));
        validation.addIf(renovacao.getDataVencimento() == null, new SimpleMessage("renovacção", "Renovação - Data Vencimento não pode ser nula"));
        validation.addIf(contasReceber.getDataReceber() == null, new SimpleMessage("contas receber", "Renovação - Data de recebimento não pode ser nula"));
        validation.addIf(contasReceber.getValor() == null, new SimpleMessage("contas receber", "Renovação - Valor de recimento não pode ser nulo"));
        validation.onErrorRedirectTo(this).visualizar(idAtividade);
        validation.addIf(renovacao.getDataVencimento().isBefore(renovacao.getDataInicial()), new SimpleMessage("renovacão", "Data Final não pode antes da Data Inicial"));
        validation.onErrorRedirectTo(this).visualizar(idAtividade);
        Licenca licenca = licencaDao.findById(idAtividade);

        renovacao.setLicenca(licenca);
        contasReceber.setAtividade(licenca);

        renovacaoDao.saveOrUpdate(renovacao);
        contasReceberDao.saveOrUpdate(contasReceber);
        licencaDao.atualizaLicenca(idAtividade, renovacao.getDataInicial(), renovacao.getDataVencimento());

        result.redirectTo(this).visualizar(idAtividade);
    }

    @Path("/removeRenovacao/{idAtividade}/{idRenovacao}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void removeRenovacao(Long idAtividade, Long idRenovacao) {
        renovacaoDao.delete(renovacaoDao.findById(idRenovacao));
        result.redirectTo(this).visualizar(idAtividade);
    }
}
