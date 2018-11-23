package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.ContasReceber;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-23T19:16:57")
@StaticMetamodel(ParcelaReceber.class)
public class ParcelaReceber_ { 

    public static volatile SingularAttribute<ParcelaReceber, LocalDate> dataRecebido;
    public static volatile SingularAttribute<ParcelaReceber, ContasReceber> contasReceber;
    public static volatile SingularAttribute<ParcelaReceber, Long> idParcelaReceber;
    public static volatile SingularAttribute<ParcelaReceber, BigDecimal> valorRecebido;

}