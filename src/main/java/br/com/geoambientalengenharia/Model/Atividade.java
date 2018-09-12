package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Atividade implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAtividade;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull(message = "{atividade.dataInicio.vazio}")
    private LocalDate dataInicio;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull(message = "{atividade.dataFinal.vazio}")
    private LocalDate dataFinal;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate dataPrevistaFim;

    @Column(length = 150)
    @Size(min = 3, max = 150, message = "{atividade.descricao.tamanho}")
    private String descricao;

    private boolean status;

    @ManyToOne
    @JoinColumn(name = "idPessoa")
    @NotNull(message = "{atividade.pessoa.vazio}")
    private Pessoa pessoa;

    @ManyToOne
    @JoinColumn(name = "idSetor")
    @NotNull(message = "{atividade.setor.vazio}")
    private Setor setor;

    @Valid
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idEndereco")
    private Endereco endereco;

    @ManyToOne
    @JoinColumn(name = "idOrcamento", referencedColumnName = "idOrcamento", nullable = true)
    private Orcamento orcamento;

    @ManyToOne
    @JoinColumn(name = "idPessoaLogada")
    private Pessoa pessoaLogada;

    @Valid
    @OneToMany(mappedBy = "atividade", targetEntity = ContasReceber.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<ContasReceber> contasReceber;

    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    @JoinTable(name = "atividade_documento", joinColumns
            = {
                @JoinColumn(name = "idAtividade")}, inverseJoinColumns
            = {
                @JoinColumn(name = "idDocumento")})
    private List<Documento> documentos;

    @OneToMany(mappedBy = "atividade", targetEntity = AtividadeItem.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    private List<AtividadeItem> atividadeItem;

    public Atividade() {
    }

    public Atividade(Long idAtividade) {
        this.idAtividade = idAtividade;
    }

    public Atividade(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        this.idAtividade = idAtividade;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.dataPrevistaFim = dataPrevistaFim;
        this.descricao = descricao;
        this.status = status;
        this.pessoa = pessoa;
        this.setor = setor;
        this.endereco = endereco;
        this.orcamento = orcamento;
        this.pessoaLogada = pessoaLogada;
        this.contasReceber = contasReceber;
        this.documentos = documentos;
        this.atividadeItem = atividadeItem;
    }

    public Atividade(LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.dataPrevistaFim = dataPrevistaFim;
        this.descricao = descricao;
        this.status = status;
        this.pessoa = pessoa;
        this.setor = setor;
        this.endereco = endereco;
        this.orcamento = orcamento;
        this.pessoaLogada = pessoaLogada;
        this.contasReceber = contasReceber;
        this.documentos = documentos;
        this.atividadeItem = atividadeItem;
    }

    public Atividade(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor) {
        this.idAtividade = idAtividade;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.dataPrevistaFim = dataPrevistaFim;
        this.descricao = descricao;
        this.status = status;
        this.pessoa = pessoa;
        this.setor = setor;
    }

    public Atividade(Long idAtividade, String descricao, boolean status, Pessoa pessoa) {
        this.idAtividade = idAtividade;
        this.descricao = descricao;
        this.status = status;
        this.pessoa = pessoa;
    }

    public Atividade(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, boolean status, Pessoa pessoa, Setor setor, Endereco endereco) {
        this.idAtividade = idAtividade;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.status = status;
        this.pessoa = pessoa;
        this.setor = setor;
        this.endereco = endereco;
    }

    public Atividade(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, boolean status, Pessoa pessoa) {
        this.idAtividade = idAtividade;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.status = status;
        this.pessoa = pessoa;
    }

    public Atividade(Long idAtividade, List<Documento> documentos) {
        this.idAtividade = idAtividade;
        this.documentos = documentos;
    }

    public Long getIdAtividade() {
        return idAtividade;
    }

    public void setIdAtividade(Long idAtividade) {
        this.idAtividade = idAtividade;
    }

    public LocalDate getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(LocalDate dataInicio) {
        this.dataInicio = dataInicio;
    }

    public LocalDate getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(LocalDate dataFinal) {
        this.dataFinal = dataFinal;
    }

    public LocalDate getDataPrevistaFim() {
        return dataPrevistaFim;
    }

    public void setDataPrevistaFim(LocalDate dataPrevistaFim) {
        this.dataPrevistaFim = dataPrevistaFim;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Orcamento getOrcamento() {
        return orcamento;
    }

    public void setOrcamento(Orcamento orcamento) {
        this.orcamento = orcamento;
    }

    public Pessoa getPessoaLogada() {
        return pessoaLogada;
    }

    public void setPessoaLogada(Pessoa pessoaLogada) {
        this.pessoaLogada = pessoaLogada;
    }

    public List<ContasReceber> getContasReceber() {
        return contasReceber;
    }

    public void setContasReceber(List<ContasReceber> contasReceber) {
        this.contasReceber = contasReceber;
    }

    public List<Documento> getDocumentos() {
        return documentos;
    }

    public void setDocumentos(List<Documento> documentos) {
        this.documentos = documentos;
    }

    public List<AtividadeItem> getAtividadeItem() {
        return atividadeItem;
    }

    public void setAtividadeItem(List<AtividadeItem> atividadeItem) {
        this.atividadeItem = atividadeItem;
    }

    public void addDocumentos(Documento documento) {
        if (this.documentos == null) {
            this.documentos = new ArrayList<>();
        }

        this.documentos.add(documento);
    }

    public void removeDocumento(int posicao) {
        this.documentos.remove(posicao);
    }

    public void addItens(AtividadeItem atividadeItem) {
        if (this.atividadeItem == null) {
            this.atividadeItem = new ArrayList<>();
        }
        this.atividadeItem.add(atividadeItem);
    }

    public void removeItens(int posicao) {
        this.atividadeItem.remove(posicao);
    }
}
