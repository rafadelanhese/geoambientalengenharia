/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;
import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.Orcamento;
import static com.google.common.base.Strings.isNullOrEmpty;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(Orcamento.class)
public class OrcamentoConverter implements Converter<Orcamento>{
    @Override
    public Orcamento convert(String value, Class<? extends Orcamento> type) {
       Orcamento orcamento = new Orcamento();
        if (!isNullOrEmpty(value)) {
            orcamento.setIdOrcamento(Long.parseLong(value));            
        }
        return orcamento;
    }
}
