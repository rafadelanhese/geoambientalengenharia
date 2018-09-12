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
import br.com.geoambientalengenharia.DAO.ServicoDAO;
import br.com.geoambientalengenharia.File.Arquivo;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.ClienteLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/servico")
public class ServicoController {

    private UsuarioLogado userLogado;
    private ServicoDAO servicoDao;
    private Arquivo duBusiness;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public ServicoController() {
        this(null, null, null, null, null);
    }

    @Inject 
    public ServicoController(UsuarioLogado userLogado, ServicoDAO servicoDao, Arquivo duBusiness, Result result, Validator validation) {
        this.userLogado = userLogado;
        this.servicoDao = servicoDao;
        this.duBusiness = duBusiness;
        this.result = result;
        this.validation = validation;
    }

    
    @Get("/lista")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void listaAdmin() {
        result.include("listServico", servicoDao.listAllByAdmin(userLogado.getUserLogado().getIdPessoa()));
    }

    @Get("/listaCliente")
    @CustomBrutauthRules({LogadoRule.class, ClienteLogado.class})
    public void listaCliente() {        
        result.include("listServico", servicoDao.listaTodosCliente(userLogado.getUserLogado().getIdPessoa()));
    }       
    
    @Get("/visualizar/{idServico}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void visualizar(Long idServico) {       
        result.include("servico", servicoDao.findById(idServico));
    }
 
    @Get("/visualizarCliente/{idServico}")
    @CustomBrutauthRules({LogadoRule.class, ClienteLogado.class})
    public void visualizarCliente(Long idServico) {      
        result.include("servico", servicoDao.findById(idServico));
    }
    
    @Path("/relatorio/{idServico}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void relatorio(Long idServico) {
        result.include("servico", servicoDao.findById(idServico));
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
    public Download download(Long idAtividade, Long idDocumento) {
        return duBusiness.download(idAtividade, idDocumento);
    }

    @Path("/removeDocumento/{idAtividade}/{idDocumento}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void removeDocumento(Long idAtividade, Long idDocumento) {
        duBusiness.excluirArquivo(idAtividade, idDocumento);
        result.redirectTo(this).visualizar(idAtividade);
    }
}
