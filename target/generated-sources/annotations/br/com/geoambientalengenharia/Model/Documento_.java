package br.com.geoambientalengenharia.Model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-23T19:16:57")
@StaticMetamodel(Documento.class)
public class Documento_ { 

    public static volatile SingularAttribute<Documento, Long> tamanhoArquivo;
    public static volatile SingularAttribute<Documento, Long> idDocumento;
    public static volatile SingularAttribute<Documento, String> nomeArquivo;
    public static volatile SingularAttribute<Documento, String> caminhoArquivo;
    public static volatile SingularAttribute<Documento, LocalDate> dataUpload;

}