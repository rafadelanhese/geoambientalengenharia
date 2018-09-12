/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.ContasReceber;
import static com.google.common.base.Strings.isNullOrEmpty;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(ContasReceber.class)
public class ContasReceberConverter implements Converter<ContasReceber> {

    @Override
    public ContasReceber convert(String value, Class<? extends ContasReceber> type) {        
        ContasReceber contasReceber = new ContasReceber();
        if (!isNullOrEmpty(value)) {
            contasReceber.setIdContasReceber(Long.parseLong(value));
        }
        return contasReceber;
    }

}
