/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Rafael Delanhese
 */
@Convert(UploadedFile.class)
public class UploadedFileConverter implements Converter<UploadedFile> {

    private final HttpServletRequest request;

    public UploadedFileConverter(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public UploadedFile convert(String value, Class<? extends UploadedFile> type) {
        Object upload = request.getAttribute(value);
        return upload == null ? null : type.cast(upload);
    }
}
