/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.Endereco;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(Endereco.class)
public class EnderecoConverter implements Converter<Endereco>{

    @Override
    public Endereco convert(String value, Class<? extends Endereco> type) {
        return new Endereco();
    }
    
}
