package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Cidade;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T20:11:39")
@StaticMetamodel(Endereco.class)
public class Endereco_ { 

    public static volatile SingularAttribute<Endereco, Cidade> cidade;
    public static volatile SingularAttribute<Endereco, String> complemento;
    public static volatile SingularAttribute<Endereco, String> numero;
    public static volatile SingularAttribute<Endereco, Long> idEndereco;
    public static volatile SingularAttribute<Endereco, String> bairro;
    public static volatile SingularAttribute<Endereco, String> rua;
    public static volatile SingularAttribute<Endereco, String> cep;

}