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
import br.com.geoambientalengenharia.DAO.TipoOrcamentoDAO;
import br.com.geoambientalengenharia.Interfaces.IFuncaoBasica;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.TipoOrcamento;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/tipoorcamento")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class TipoOrcamentoController implements IFuncaoBasica{

    private TipoOrcamentoDAO tipoorcamentoDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public TipoOrcamentoController() {
        this(null, null, null);
    }

    @Inject
    public TipoOrcamentoController(TipoOrcamentoDAO tipoorcamentoDao, Result result, Validator validation) {
        this.tipoorcamentoDao = tipoorcamentoDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/cadastro")
    public void cadastro(TipoOrcamento tipoorcamento) {
        if (tipoorcamento.getIdTipoOrcamento() != null) {
            tipoorcamentoDao.refresh(tipoorcamento);
        }
        result.include("tipoorcamento", tipoorcamento);
    }

    @Post
    @Path("/salvar")
    public void salvar(@NotNull @Valid TipoOrcamento tipoorcamento) {
        validation.onErrorRedirectTo(TipoOrcamentoController.class).cadastro(tipoorcamento);
        tipoorcamentoDao.saveOrUpdate(tipoorcamento);
        result.redirectTo(this).lista();
    }

    @Override
    @Get("/lista")
    public void lista() {
        result.include("tipoorcamentoList", tipoorcamentoDao.listAll());
    }

    @Override
    @Path("/remover/{idTipoOrcamento}")
    public void remover(Long idTipoOrcamento) {
        tipoorcamentoDao.delete(tipoorcamentoDao.findById(idTipoOrcamento));
        result.on(ConstraintViolationException.class)
                .include("validacao", "O registro escolhido está vinculado em outras partes do sistema, não é possível excluir")
                .redirectTo(this)
                .lista();
        result.redirectTo(this).lista();
    }

    @Override
    @Path("/editar/{idTipoOrcamento}")
    public void editar(Long idTipoOrcamento) {                
        result.redirectTo(this).cadastro(tipoorcamentoDao.findById(idTipoOrcamento));
    }

    @Override
    @Get("/visualizar/{idTipoOrcamento}")
    public void visualizar(Long idTipoOrcamento) {
        result.use(Results.json()).withoutRoot().from(tipoorcamentoDao.findById(idTipoOrcamento)).serialize();
    }
}
