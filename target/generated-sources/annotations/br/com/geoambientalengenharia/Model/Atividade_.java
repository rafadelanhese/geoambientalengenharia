package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Model.AtividadeItem;
import br.com.geoambientalengenharia.Model.ContasReceber;
import br.com.geoambientalengenharia.Model.Documento;
import br.com.geoambientalengenharia.Model.Endereco;
import br.com.geoambientalengenharia.Model.Orcamento;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Model.Setor;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.LocalDate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T20:11:39")
@StaticMetamodel(Atividade.class)
public class Atividade_ { 

    public static volatile SingularAttribute<Atividade, Orcamento> orcamento;
    public static volatile SingularAttribute<Atividade, Setor> setor;
    public static volatile SingularAttribute<Atividade, Pessoa> pessoa;
    public static volatile SingularAttribute<Atividade, Endereco> endereco;
    public static volatile SingularAttribute<Atividade, LocalDate> dataPrevistaFim;
    public static volatile SingularAttribute<Atividade, Long> idAtividade;
    public static volatile SingularAttribute<Atividade, Pessoa> pessoaLogada;
    public static volatile SingularAttribute<Atividade, String> descricao;
    public static volatile ListAttribute<Atividade, Documento> documentos;
    public static volatile ListAttribute<Atividade, ContasReceber> contasReceber;
    public static volatile SingularAttribute<Atividade, LocalDate> dataInicio;
    public static volatile ListAttribute<Atividade, AtividadeItem> atividadeItem;
    public static volatile SingularAttribute<Atividade, LocalDate> dataFinal;
    public static volatile SingularAttribute<Atividade, Boolean> status;

}