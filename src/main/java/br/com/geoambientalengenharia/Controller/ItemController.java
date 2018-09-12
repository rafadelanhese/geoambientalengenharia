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
import br.com.geoambientalengenharia.DAO.ItemDAO;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import br.com.geoambientalengenharia.Interfaces.IFuncaoBasica;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.Item;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/item")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class ItemController implements IFuncaoBasica {

    private ItemDAO itemDao;
    private SetorDAO setorDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public ItemController() {
        this(null, null, null, null);
    }

    @Inject
    public ItemController(ItemDAO itemDao, SetorDAO setorDao, Result result, Validator validation) {
        this.itemDao = itemDao;
        this.setorDao = setorDao;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/cadastro")
    public void cadastro(Item item) {
        result.include("item", item);
        result.include("setorList", setorDao.listAll());
    }

    @Post("/salvar")
    public void salvar(@NotNull @Valid Item item) {
        validation.addIf(item.getSetor().getIdSetor() == null, new SimpleMessage("item.setor.idSetor", "Selecione um setor"));        
        validation.onErrorRedirectTo(this).cadastro(item);
        itemDao.saveOrUpdate(item);
        result.redirectTo(this).lista();
    }

    @Override
    @Get("/lista")
    public void lista() {
        result.include("itemList", itemDao.listAll());
    }

    @Override
    @Path("/remover/{idItem}")
    public void remover(Long idItem) {
        itemDao.delete(itemDao.findById(idItem));
        result.on(ConstraintViolationException.class)
                .include("validacao", "O registro escolhido está vinculado em outras partes do sistema, não é possível excluir")
                .redirectTo(this)
                .lista();
        result.redirectTo(this).lista();
    }

    @Override
    @Path("/editar/{idItem}")
    public void editar(Long idItem) {
        result.redirectTo(this).cadastro(itemDao.findById(idItem));
    }

    @Override
    @Get("/visualizar/{idItem}")
    public void visualizar(Long idItem) {
        result.use(Results.json()).withoutRoot().from(itemDao.findById(idItem)).serialize();
    }
}
