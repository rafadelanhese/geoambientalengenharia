package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Atividade;
import br.com.geoambientalengenharia.Model.ParcelaReceber;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-23T19:16:57")
@StaticMetamodel(ContasReceber.class)
public class ContasReceber_ { 

    public static volatile SingularAttribute<ContasReceber, Atividade> atividade;
    public static volatile SingularAttribute<ContasReceber, String> observacoes;
    public static volatile SingularAttribute<ContasReceber, Long> idContasReceber;
    public static volatile SingularAttribute<ContasReceber, BigDecimal> valor;
    public static volatile SingularAttribute<ContasReceber, LocalDate> dataReceber;
    public static volatile ListAttribute<ContasReceber, ParcelaReceber> parcelaReceber;

}