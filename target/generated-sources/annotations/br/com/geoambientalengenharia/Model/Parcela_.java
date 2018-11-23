package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.ContasPagar;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-23T19:16:57")
@StaticMetamodel(Parcela.class)
public class Parcela_ { 

    public static volatile SingularAttribute<Parcela, LocalDate> datapagamento;
    public static volatile SingularAttribute<Parcela, ContasPagar> contasPagar;
    public static volatile SingularAttribute<Parcela, BigDecimal> valor;
    public static volatile SingularAttribute<Parcela, Long> idParcela;
    public static volatile SingularAttribute<Parcela, LocalDate> datavencimento;
    public static volatile SingularAttribute<Parcela, String> qtdeParcelas;
    public static volatile SingularAttribute<Parcela, BigDecimal> valorpago;

}