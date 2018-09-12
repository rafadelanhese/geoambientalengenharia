/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Login;

import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.PessoaFisica;
import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Rafael Delanhese
 */
@SessionScoped
@Named("userLogado")
public class UsuarioLogado implements Serializable {

    private Pessoa userLogado;
   
     /**
     * @deprecated CDI eyes only
     */
    public UsuarioLogado() {
       this(null);
    }  

    public UsuarioLogado(Pessoa userLogado) {
        this.userLogado = userLogado;
    }

    public Pessoa getUserLogado() {
        return userLogado;
    }

    public void setUserLogado(Pessoa userLogado) {
        this.userLogado = userLogado;
    }   

    public void logar(Pessoa usuario) {
        this.userLogado = usuario;

    }

    public boolean isLogado() {
        return this.userLogado != null;
    }

    public void deslogar() {
        this.userLogado = null;
    }

    public boolean isAdministrador() {
        boolean flag = false;
        for (int i = 0; i < userLogado.getTipousuario().size(); i++) {
            if (userLogado.getTipousuario().get(i).getDescricao().equals("Administrador")) {
                flag = true;
            }
        }
        return flag;
    }

    public boolean isCliente() {
        boolean flag = false;
        for (int i = 0; i < userLogado.getTipousuario().size(); i++) {
            if (userLogado.getTipousuario().get(i).getDescricao().equals("Cliente")) {
                flag = true;
            }
        }
        return flag;
    }
}
