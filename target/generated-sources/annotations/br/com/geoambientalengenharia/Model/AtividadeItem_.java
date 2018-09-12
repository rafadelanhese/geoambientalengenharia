package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Atividade;
import br.com.geoambientalengenharia.Model.Item;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-12T17:48:56")
@StaticMetamodel(AtividadeItem.class)
public class AtividadeItem_ { 

    public static volatile SingularAttribute<AtividadeItem, Atividade> atividade;
    public static volatile SingularAttribute<AtividadeItem, Item> item;
    public static volatile SingularAttribute<AtividadeItem, BigDecimal> valor;
    public static volatile SingularAttribute<AtividadeItem, Long> idAtividadeItem;
    public static volatile SingularAttribute<AtividadeItem, Integer> quantidade;

}