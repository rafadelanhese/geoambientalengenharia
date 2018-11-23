/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.simplemail.Mailer;
import javax.inject.Inject;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
public class IndexController {
    
    private final Mailer mailer;
    private Result result;

    /**
     * @deprecated CDI eyes only
     */
    public IndexController() {
        this(null, null);
    }

    @Inject      
    public IndexController(Mailer mailer, Result result) {
        this.mailer = mailer;
        this.result = result;
    }
    
    
    @Path("/")
    public void index(){        
    }
    
    @Post("/emailContato")
    public void emailContato(String nome, String emailCliente, String telefone, String mensagem) {
        try {
            Email email = new SimpleEmail();
            email.setSubject("Contato Site");
            email.addTo("contato@geoambientalengenharia.com.br");
            email.setMsg("Nome: "+nome+"\nE-mail: "+emailCliente+"\nTelefone: "+telefone+"\nMensagem: "+mensagem);
            mailer.send(email);
            result.include("email", "sucesso");
            result.redirectTo(this).index();
        } catch (EmailException e) {
            System.out.println(e.toString());
        }
    }
}
