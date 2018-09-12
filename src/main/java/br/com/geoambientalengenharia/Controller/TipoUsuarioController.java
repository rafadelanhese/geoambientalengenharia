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
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.geoambientalengenharia.DAO.TipoUsuarioDAO;
import br.com.geoambientalengenharia.Interfaces.IFuncaoBasica;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.TipoUsuario;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/tipousuario")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class TipoUsuarioController implements IFuncaoBasica{
    private TipoUsuarioDAO tipoUsuarioDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public TipoUsuarioController() {
        this(null, null, null);
    }

    @Inject
    public TipoUsuarioController(TipoUsuarioDAO tipoUsuarioDao, Result result, Validator validation) {
        this.tipoUsuarioDao = tipoUsuarioDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/cadastro")
    public void cadastro(TipoUsuario tipoUsuario) {
        if (tipoUsuario.getIdTipoUsuario() != null) {
            tipoUsuarioDao.refresh(tipoUsuario);
        }
        result.include("tipoUsuario", tipoUsuario);
    }

    

    @Post
    @Path("/salvar")
    public void salvar(@NotNull @Valid TipoUsuario tipoUsuario) {
        validation.onErrorRedirectTo(TipoUsuarioController.class).cadastro(tipoUsuario);
        tipoUsuarioDao.saveOrUpdate(tipoUsuario);
        result.redirectTo(this).lista();
    }

    @Override
    @Get("/lista")
    public void lista() {
        result.include("tipoUsuarioList", tipoUsuarioDao.listAll());
    }
   
    @Override
    @Path("/remover/{idTipoUsuario}")
    public void remover(Long idTipoUsuario) {
        tipoUsuarioDao.delete(tipoUsuarioDao.findById(idTipoUsuario));
        result.on(ConstraintViolationException.class)
                .include("validacao", "O registro escolhido está vinculado em outras partes do sistema, não é possível excluir")
                .redirectTo(this)
                .lista();
        result.redirectTo(this).lista();
    }

    @Override
    @Path("/editar/{idTipoUsuario}")
    public void editar(Long idTipoUsuario) {                
        result.redirectTo(this).cadastro(tipoUsuarioDao.findById(idTipoUsuario));
    }

    @Override
    @Get("/visualizar/{idTipoUsuario}")
    public void visualizar(Long idTipoUsuario) {          
        result.use(Results.json()).withoutRoot().from(tipoUsuarioDao.findById(idTipoUsuario)).serialize();      
    }
}
