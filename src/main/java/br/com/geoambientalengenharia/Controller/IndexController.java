/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
public class IndexController {
     
    private Result result;

    /**
     * @deprecated CDI eyes only
     */
    public IndexController() {
        this(null);
    }

    @Inject  
    public IndexController(Result result) {
        this.result = result;
    }
    
    
    @Path("/")
    public void index(){        
    }
}
