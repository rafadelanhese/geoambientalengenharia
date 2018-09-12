/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.geoambientalengenharia.DAO.TipoUsuarioDAO;
import br.com.geoambientalengenharia.Model.TipoUsuario;
import static com.google.common.base.Strings.isNullOrEmpty;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
@Convert(TipoUsuario.class)
public class TipoUsuarioConverter implements Converter<TipoUsuario> {

    @Override
    public TipoUsuario convert(String value, Class<? extends TipoUsuario> type) {
        TipoUsuario tipoUsuario = new TipoUsuario();
        if (!isNullOrEmpty(value)) {
            tipoUsuario.setIdTipoUsuario(Long.parseLong(value));
        }
        return tipoUsuario;
    }
}
