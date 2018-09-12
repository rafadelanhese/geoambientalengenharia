/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Login;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;
import br.com.caelum.vraptor.Controller;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
public class ClienteLogado implements CustomBrutauthRule{
     private UsuarioLogado userLogado;

    /**
     * @deprecated CDI eyes only
     */
    public ClienteLogado() {
        this(null);
    }

    @Inject
    public ClienteLogado(UsuarioLogado userLogado) {
        this.userLogado = userLogado;
    }
    
    public boolean isAllowed() {
        boolean flag = false;
        for (int i = 0; i < userLogado.getUserLogado().getTipousuario().size(); i++) {
            if(userLogado.getUserLogado().getTipousuario().get(i).getDescricao().equals("Cliente"))
                flag = true;
        }
        return flag;
    }
}
