/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.Atividade;
import br.com.geoambientalengenharia.Model.Licenca;
import br.com.geoambientalengenharia.Model.Projeto;
import br.com.geoambientalengenharia.Model.Servico;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(Atividade.class)
public class AtividadeConverter implements Converter<Atividade> {

    @Override
    public Atividade convert(String value, Class<? extends Atividade> type) {
        if (value.equals("LICENCA")) {
            return new Licenca();
        } else if (value.equals("PROJETO")) {
            return new Projeto();
        } else if(value.equals("SERVICO")){
            return new Servico();
        }
        return new Atividade();
    }
}
