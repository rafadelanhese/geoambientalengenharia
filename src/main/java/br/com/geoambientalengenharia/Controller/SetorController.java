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
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import static br.com.caelum.vraptor.view.Results.json;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import br.com.geoambientalengenharia.Interfaces.IFuncaoBasica;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.Setor;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/setor")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class SetorController implements IFuncaoBasica {

    private SetorDAO setorDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public SetorController() {
        this(null, null, null);
    }

    @Inject
    public SetorController(SetorDAO setorDao, Result result, Validator validation) {
        this.setorDao = setorDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/cadastro")
    public void cadastro(Setor setor) {
        if (setor.getIdSetor() != null) {
            setorDao.refresh(setor);
        }
        result.include("setor", setor);
    }

    @Post("/salvar")
    public void salvar(@NotNull @Valid Setor setor) {
        validation.onErrorRedirectTo(SetorController.class).cadastro(setor);
        setorDao.saveOrUpdate(setor);
        result.redirectTo(SetorController.class).lista();
    }

    @Override
    @Get("/lista")
    public void lista() {
        result.include("setorList", setorDao.listAll());
    }

    @Override
    @Path("/remover/{idSetor}")
    public void remover(Long idSetor) {
        setorDao.delete(setorDao.findById(idSetor));
        result.on(ConstraintViolationException.class)
                .include("validacao", "O registro escolhido está vinculado em outras partes do sistema, não é possível excluir")
                .redirectTo(this)
                .lista();
        result.redirectTo(this).lista();
    }

    @Override
    @Path("/editar/{idSetor}")
    public void editar(Long idSetor) {
        result.redirectTo(this).cadastro(setorDao.findById(idSetor));
    }

    @Override
    @Get("/visualizar/{idSetor}")
    public void visualizar(Long idSetor) {
        result.use(Results.json()).withoutRoot().from(setorDao.findById(idSetor)).serialize();
    }

}
