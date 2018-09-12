/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.DAO.CidadeDAO;
import br.com.geoambientalengenharia.Model.Cidade;
import static com.google.common.base.Strings.isNullOrEmpty;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(Cidade.class)
public class CidadeConverter implements Converter<Cidade> {

    @Override
    public Cidade convert(String value, Class<? extends Cidade> type) {
        Cidade cidade = new Cidade();
        if (!isNullOrEmpty(value)) {
            cidade.setIdCidade(Long.parseLong(value));            
        }
        return cidade;
    }
}
