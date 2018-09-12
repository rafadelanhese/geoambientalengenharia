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
import br.com.geoambientalengenharia.DAO.TipoDespesaDAO;
import br.com.geoambientalengenharia.Interfaces.IFuncaoBasica;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.TipoDespesa;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/tipodespesa")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class TipoDespesaController implements IFuncaoBasica{

    private TipoDespesaDAO tipodespesaDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public TipoDespesaController() {
        this(null, null, null);
    }

    @Inject
    public TipoDespesaController(TipoDespesaDAO tipodespesaDao, Result result, Validator validation) {
        this.tipodespesaDao = tipodespesaDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/cadastro")
    public void cadastro(TipoDespesa tipodespesa) {
        if (tipodespesa.getIdTipoDespesa() != null) {
            tipodespesaDao.refresh(tipodespesa);
        }
        result.include("tipodespesa", tipodespesa);
    }
    
    @Post("/salvar")
    public void salvar(@NotNull @Valid TipoDespesa tipodespesa) {
        validation.onErrorRedirectTo(this).cadastro(tipodespesa);
        tipodespesaDao.saveOrUpdate(tipodespesa);
        result.redirectTo(this).lista();
    }
    
    @Get("/lista")
    public void lista() {
        result.include("tipodespesaList", tipodespesaDao.listAll());
    }

    @Override
    @Path("/remover/{idTipoDespesa}")
    public void remover(Long idTipoDespesa) {
        tipodespesaDao.delete(tipodespesaDao.findById(idTipoDespesa));
        result.on(ConstraintViolationException.class)
                .include("validacao", "O registro escolhido está vinculado em outras partes do sistema, não é possível excluir")
                .redirectTo(this)
                .lista();
        result.redirectTo(this).lista();
    }

    @Override
    @Path("/editar/{idTipoDespesa}")
    public void editar(Long idTipoDespesa) {
        result.redirectTo(this).cadastro(tipodespesaDao.findById(idTipoDespesa));
    }

    @Override
    @Get("/visualizar/{idTipoDespesa}")
    public void visualizar(Long idTipoDespesa) {
        result.use(Results.json()).withoutRoot().from(tipodespesaDao.findById(idTipoDespesa)).serialize();
    }
}
