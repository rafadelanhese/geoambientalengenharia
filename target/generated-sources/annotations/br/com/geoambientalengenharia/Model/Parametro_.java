package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Endereco;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-14T14:07:45")
@StaticMetamodel(Parametro.class)
public class Parametro_ { 

    public static volatile SingularAttribute<Parametro, Long> idParametro;
    public static volatile SingularAttribute<Parametro, String> telefone;
    public static volatile SingularAttribute<Parametro, String> site;
    public static volatile SingularAttribute<Parametro, Endereco> endereco;
    public static volatile SingularAttribute<Parametro, String> nome;
    public static volatile SingularAttribute<Parametro, String> cnpj;
    public static volatile SingularAttribute<Parametro, String> email;

}