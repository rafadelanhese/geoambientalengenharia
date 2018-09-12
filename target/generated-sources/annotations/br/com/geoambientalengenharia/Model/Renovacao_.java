package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Licenca;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-12T17:48:56")
@StaticMetamodel(Renovacao.class)
public class Renovacao_ { 

    public static volatile SingularAttribute<Renovacao, Long> idRenovacao;
    public static volatile SingularAttribute<Renovacao, LocalDate> dataVencimento;
    public static volatile SingularAttribute<Renovacao, LocalDate> dataInicial;
    public static volatile SingularAttribute<Renovacao, Licenca> licenca;

}