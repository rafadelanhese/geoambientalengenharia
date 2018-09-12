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
import br.com.geoambientalengenharia.DAO.ProjetoDAO;
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
@Path("/projeto")
public class ProjetoController {

    private Arquivo duBusiness;
    private UsuarioLogado userLogado;
    private ProjetoDAO projetoDao;  
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public ProjetoController() {
        this(null, null, null, null, null);
    }

    @Inject
    public ProjetoController(Arquivo duBusiness, UsuarioLogado userLogado, ProjetoDAO projetoDao, Result result, Validator validation) {
        this.duBusiness = duBusiness;
        this.userLogado = userLogado;
        this.projetoDao = projetoDao;
        this.result = result;
        this.validation = validation;
    }

    
    @Get("/lista")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void listaAdmin() {
        result.include("listProjeto", projetoDao.listAllByAdmin(userLogado.getUserLogado().getIdPessoa()));
    }

    @Get("/listaCliente")
    @CustomBrutauthRules({LogadoRule.class, ClienteLogado.class})
    public void listaCliente() {        
        result.include("listProjeto", projetoDao.listaTodosCliente(userLogado.getUserLogado().getIdPessoa()));
    }  

    @Get("/visualizar/{idProjeto}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void visualizar(Long idProjeto) {      
        result.include("projeto", projetoDao.findById(idProjeto));
    }
    
    @Get("/visualizarCliente/{idProjeto}")
    @CustomBrutauthRules({LogadoRule.class, ClienteLogado.class})
    public void visualizarCliente(Long idProjeto) {       
        result.include("projeto", projetoDao.findById(idProjeto));
    }

    @Path("/relatorio/{idProjeto}")
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
    public void relatorio(Long idProjeto) {
        result.include("projeto", projetoDao.findById(idProjeto));
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
    @CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
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
