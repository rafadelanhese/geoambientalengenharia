/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Initialize;

import br.com.caelum.vraptor.events.VRaptorInitialized;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import javax.enterprise.context.Dependent;
import javax.enterprise.event.Observes;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@Dependent
public class Initialize {        
    
    
    public void inicializar(@Observes VRaptorInitialized event){
        System.out.println("E-AMBIENTAL FOI INICIADO");
    }    
}
