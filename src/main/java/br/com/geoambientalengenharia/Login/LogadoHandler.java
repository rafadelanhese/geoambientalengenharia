/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Login;

import br.com.caelum.brutauth.auth.handlers.RuleHandler;
import br.com.caelum.vraptor.Result;
import br.com.geoambientalengenharia.Controller.LoginController;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
public class LogadoHandler implements RuleHandler {

    private Result result;

    /**
     * @deprecated CDI eyes only
     */
    public LogadoHandler() {
        this(null);
    }

    @Inject
    public LogadoHandler(Result result) {
        this.result = result;
    }

    @Override
    public void handle() {
        result.include("erro", " * Você precisa estar identificado para acessar está área.");
        result.redirectTo(LoginController.class).index();
    }

}
