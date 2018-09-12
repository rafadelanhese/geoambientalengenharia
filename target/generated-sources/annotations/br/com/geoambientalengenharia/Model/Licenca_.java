package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Renovacao;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-12T17:48:56")
@StaticMetamodel(Licenca.class)
public class Licenca_ extends Atividade_ {

    public static volatile SingularAttribute<Licenca, String> cnae;
    public static volatile ListAttribute<Licenca, Renovacao> renovacao;
    public static volatile SingularAttribute<Licenca, String> numeroProcesso;
    public static volatile SingularAttribute<Licenca, String> orgao;
    public static volatile SingularAttribute<Licenca, String> numeroLicenca;
    public static volatile SingularAttribute<Licenca, String> versao;

}