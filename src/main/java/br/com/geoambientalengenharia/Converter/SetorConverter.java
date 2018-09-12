/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.Setor;
import static com.google.common.base.Strings.isNullOrEmpty;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(Setor.class)
public class SetorConverter implements Converter<Setor> {
   
    @Override
    public Setor convert(String value, Class<? extends Setor> type) {
       Setor setor = new Setor();
        if (!isNullOrEmpty(value)) {
            setor.setIdSetor(Long.parseLong(value));            
        }
        return setor;
    }
}
