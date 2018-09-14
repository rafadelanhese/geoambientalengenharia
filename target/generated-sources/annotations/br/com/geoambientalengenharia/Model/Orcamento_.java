package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.OrcamentoItem;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.TipoOrcamento;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-14T14:07:45")
@StaticMetamodel(Orcamento.class)
public class Orcamento_ { 

    public static volatile SingularAttribute<Orcamento, String> inicioatividades;
    public static volatile SingularAttribute<Orcamento, Pessoa> pessoa;
    public static volatile SingularAttribute<Orcamento, BigDecimal> desconto;
    public static volatile SingularAttribute<Orcamento, String> proposta;
    public static volatile SingularAttribute<Orcamento, String> validadeproposta;
    public static volatile ListAttribute<Orcamento, OrcamentoItem> orcamentoItem;
    public static volatile SingularAttribute<Orcamento, String> objetivo;
    public static volatile SingularAttribute<Orcamento, String> taxaseemolumentos;
    public static volatile SingularAttribute<Orcamento, BigDecimal> total;
    public static volatile SingularAttribute<Orcamento, LocalDate> dataorc;
    public static volatile SingularAttribute<Orcamento, Long> idOrcamento;
    public static volatile SingularAttribute<Orcamento, TipoOrcamento> tipoOrcamento;
    public static volatile SingularAttribute<Orcamento, String> formapagamento;
    public static volatile SingularAttribute<Orcamento, Boolean> status;

}