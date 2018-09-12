/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.geoambientalengenharia.DAO.ContasPagarDAO;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */

//CONTROLLER NÃO DEU CERTO ARRUMAR
@Controller
@Path("/layout")
public class LayoutController {

    private ContasPagarDAO cpDao;
    private UsuarioLogado usuarioLogado;
    private Result result;

    /**
     * @deprecated CDI eyes only
     */
    public LayoutController() {
        this(null, null, null);
    }

    @Inject
    public LayoutController(ContasPagarDAO cpDao, UsuarioLogado usuarioLogado, Result result) {
        this.cpDao = cpDao;
        this.usuarioLogado = usuarioLogado;
        this.result = result;
    }

    @Path("/admin")
    public void admin() {        
    }
}
