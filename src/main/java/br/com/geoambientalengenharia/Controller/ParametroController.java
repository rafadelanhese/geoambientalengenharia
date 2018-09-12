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
import br.com.geoambientalengenharia.DAO.ParametroDAO;
import br.com.geoambientalengenharia.Interfaces.IFuncaoBasica;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Model.Cidade;
import br.com.geoambientalengenharia.Model.Parametro;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/parametro")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class ParametroController implements IFuncaoBasica {

    private ParametroDAO paramDao;
    private CidadeDAO cidadeDao;
    private EstadoDAO estadoDao;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public ParametroController() {
        this(null, null, null, null, null);
    }

    @Inject
    public ParametroController(ParametroDAO paramDao, CidadeDAO cidadeDao, EstadoDAO estadoDao, Result result, Validator validation) {
        this.paramDao = paramDao;
        this.cidadeDao = cidadeDao;
        this.estadoDao = estadoDao;
        this.result = result;
        this.validation = validation;
    }

    @Get("/cadastro")
    public void cadastro(Parametro parametro) {
        if (parametro.getIdParametro() != null) {
            paramDao.refresh(parametro);
        }
        result.include("parametro", parametro);
        result.include("estadoList", estadoDao.listAll());
    }

    @Post("/salvar")
    public void salvar(@NotNull @Valid Parametro parametro) {
        validation.addIf(parametro.getEndereco().getCidade().getIdCidade() == null, new SimpleMessage("atividade.endereco.cidade.idCidade", "Selecione uma cidade"));
        validation.onErrorRedirectTo(ParametroController.class).cadastro(parametro);
        paramDao.saveOrUpdate(parametro);
        result.redirectTo(ParametroController.class).lista();
    }

    @Override
    @Get("/lista")
    public void lista() {
        result.include("parametroList", paramDao.listAll());
    }

    @Override
    @Path("/remover/{idParametro}")
    public void remover(Long idParametro) {

    }

    @Override
    @Path("/editar/{idParametro}")
    public void editar(Long idParametro) {
        result.redirectTo(this).cadastro(paramDao.findById(idParametro));
    }

    @Override
    @Get("/visualizar/{idParametro}")
    public void visualizar(Long idParametro) {
        result.use(Results.json()).withoutRoot().from(paramDao.findById(idParametro)).recursive().serialize();
    }

    @Get("/buscaCidades/{idEstado}")
    public void buscaCidades(Long idEstado) {
        List<Cidade> cidades = cidadeDao.cidadeByEstado(idEstado);
        result.use(Results.json()).withoutRoot().from(cidades).serialize();
    }
    
    @Get("/buscaCidadePorNome/{nomeCidade}")
    public void buscaCidadePorNome(String nomeCidade) {
        result.use(Results.json()).withoutRoot().from(cidadeDao.cidadeByNome(nomeCidade)).include("estado").serialize();
    }
}
