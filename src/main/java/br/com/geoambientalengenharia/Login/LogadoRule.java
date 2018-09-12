/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Login;

import br.com.caelum.brutauth.auth.annotations.HandledBy;
import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@HandledBy(LogadoHandler.class)
public class LogadoRule implements CustomBrutauthRule{
    
    private UsuarioLogado userLogado;    
    
    /**
     * @deprecated CDI eyes only
     */
    public LogadoRule() {
        this(null);
    }

    @Inject
    public LogadoRule(UsuarioLogado userLogado) {
        this.userLogado = userLogado;
    }
    
    public boolean isAllowed(){
        return userLogado.isLogado();
    }
}
