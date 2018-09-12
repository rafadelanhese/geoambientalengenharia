/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.geoambientalengenharia.DAO.LicencaDAO;
import br.com.geoambientalengenharia.DAO.ParcelaDAO;
import br.com.geoambientalengenharia.DAO.ParcelaReceberDAO;
import br.com.geoambientalengenharia.DAO.PessoaDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import java.time.LocalDate;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/painelcontrole")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class PainelControleController {

    private ParcelaDAO parcelaDao;
    private ParcelaReceberDAO prDao;
    private PessoaDAO pessoaDao;
    private LicencaDAO licencaDao;
    private UsuarioLogado usuarioLogado;
    private Result result;

    /**
     * @deprecated CDI eyes only
     */
    public PainelControleController() {
        this(null, null, null, null, null, null);
    }

    @Inject
    public PainelControleController(ParcelaDAO parcelaDao, ParcelaReceberDAO prDao, PessoaDAO pessoaDao, LicencaDAO licencaDao, UsuarioLogado usuarioLogado, Result result) {
        this.parcelaDao = parcelaDao;
        this.prDao = prDao;
        this.pessoaDao = pessoaDao;
        this.licencaDao = licencaDao;
        this.usuarioLogado = usuarioLogado;
        this.result = result;
    }
    
    

    @Path("/index")
    public void index() {
        result.include("qtdePessoas", pessoaDao.quantidadePessoas());
        result.include("listParcelaReceber", prDao.ultimosLancamentos(usuarioLogado.getUserLogado().getIdPessoa()));
        result.include("listParcela", parcelaDao.listParcelasAtrasadas());
        result.include("listLicenca", licencaDao.listaLicencaValidadeProxima());
        result.include("totalPagoMesAtual", parcelaDao.totalPagoMesAtual());
        result.include("totalRecebidoMesAtual", prDao.totalRecebidoMesAtual(usuarioLogado.getUserLogado().getIdPessoa()));
        result.include("dataAtual", LocalDate.now());       
    }
}
