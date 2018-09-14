package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.Setor;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-14T14:07:45")
@StaticMetamodel(Item.class)
public class Item_ { 

    public static volatile SingularAttribute<Item, Setor> setor;
    public static volatile SingularAttribute<Item, BigDecimal> valor;
    public static volatile SingularAttribute<Item, Long> idItem;
    public static volatile SingularAttribute<Item, String> descricao;

}