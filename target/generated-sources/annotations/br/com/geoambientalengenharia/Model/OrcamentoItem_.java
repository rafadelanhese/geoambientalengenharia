package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Item;
import br.com.geoambientalengenharia.Model.Orcamento;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T20:11:39")
@StaticMetamodel(OrcamentoItem.class)
public class OrcamentoItem_ { 

    public static volatile SingularAttribute<OrcamentoItem, Orcamento> orcamento;
    public static volatile SingularAttribute<OrcamentoItem, Long> idOrcamentoItem;
    public static volatile SingularAttribute<OrcamentoItem, Item> item;
    public static volatile SingularAttribute<OrcamentoItem, BigDecimal> valor;
    public static volatile SingularAttribute<OrcamentoItem, Integer> quantidade;

}