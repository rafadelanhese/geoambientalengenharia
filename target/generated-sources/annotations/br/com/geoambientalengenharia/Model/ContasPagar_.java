package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Parcela;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.TipoDespesa;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-12T17:48:56")
@StaticMetamodel(ContasPagar.class)
public class ContasPagar_ { 

    public static volatile ListAttribute<ContasPagar, Parcela> parcelas;
    public static volatile SingularAttribute<ContasPagar, String> observacao;
    public static volatile SingularAttribute<ContasPagar, Pessoa> pessoa;
    public static volatile SingularAttribute<ContasPagar, Long> idContasPagar;
    public static volatile SingularAttribute<ContasPagar, LocalDate> datalancamento;
    public static volatile SingularAttribute<ContasPagar, TipoDespesa> tipoDespesa;

}