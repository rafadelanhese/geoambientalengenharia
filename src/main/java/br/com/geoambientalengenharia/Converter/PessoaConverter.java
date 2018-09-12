/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.PessoaFisica;
import br.com.geoambientalengenharia.Model.PessoaJuridica;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(Pessoa.class)
public class PessoaConverter implements Converter<Pessoa> {


    @Override
    public Pessoa convert(String value, Class<? extends Pessoa> type) {

        try {
            if (value.equals("PessoaFisica")) {
                return new PessoaFisica();
            } else if (value.equals("PessoaJuridica")) {
                return new PessoaJuridica();
            } else {
                throw new RuntimeException("Tipo nao pode ser diferente de Pessoa Física ou Pessoa Jurídica");
            }
        } catch (Exception e) {
            System.out.println("PessoaConverter: " + e.toString());
        }
        return new Pessoa();
    }

}
