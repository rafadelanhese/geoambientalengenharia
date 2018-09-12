/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.TipoOrcamento;
import static com.google.common.base.Strings.isNullOrEmpty;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(TipoOrcamento.class)
public class TipoOrcamentoConverter implements Converter<TipoOrcamento>{    

    @Override
    public TipoOrcamento convert(String value, Class<? extends TipoOrcamento> type) {
        TipoOrcamento tipoOrc = new TipoOrcamento();
        if (!isNullOrEmpty(value)) {
            tipoOrc.setIdTipoOrcamento(Long.parseLong(value));            
        }
        return tipoOrc;
    }      
}
