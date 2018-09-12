package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Endereco;
import br.com.geoambientalengenharia.Model.Setor;
import br.com.geoambientalengenharia.Model.Telefone;
import br.com.geoambientalengenharia.Model.TipoUsuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-12T17:48:56")
@StaticMetamodel(Pessoa.class)
public class Pessoa_ { 

    public static volatile SingularAttribute<Pessoa, Long> idPessoa;
    public static volatile SingularAttribute<Pessoa, String> senha;
    public static volatile SingularAttribute<Pessoa, Setor> setor;
    public static volatile ListAttribute<Pessoa, Telefone> telefone;
    public static volatile ListAttribute<Pessoa, TipoUsuario> tipousuario;
    public static volatile SingularAttribute<Pessoa, Endereco> endereco;
    public static volatile SingularAttribute<Pessoa, String> nome;
    public static volatile SingularAttribute<Pessoa, String> email;

}