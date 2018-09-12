/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Orcamento implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idOrcamento;

    @NotNull(message = "{orcamento.data.vazio}")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate dataorc;

    @Column(columnDefinition = "TEXT")
    private String objetivo;

    @Column(columnDefinition = "TEXT")
    private String proposta;

    @Column(columnDefinition = "TEXT")
    private String formapagamento;

    @Column(columnDefinition = "TEXT")
    private String taxaseemolumentos;

    @Column(columnDefinition = "TEXT")
    private String inicioatividades;

    @Column(columnDefinition = "TEXT")
    private String validadeproposta;

    private boolean status;

    @NotNull(message = "{orcamento.valor.vazio}")
    @DecimalMin("0.01")
    private BigDecimal total;

    private BigDecimal desconto;

    @NotNull(message = "Campo Tipo Orçamento: Não pode ser nulo")
    @ManyToOne
    @JoinColumn(name = "idTipoOrcamento")
    private TipoOrcamento tipoOrcamento;

    @NotNull(message = "Campo Pessoa: Não pode ser nulo")
    @ManyToOne
    @JoinColumn(name = "idPessoa")
    private Pessoa pessoa;

    @OneToMany(mappedBy = "orcamento", cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = OrcamentoItem.class)
    @Fetch(FetchMode.SUBSELECT)
    private List<OrcamentoItem> orcamentoItem;

    public Orcamento() {
    }

    public Orcamento(Long idOrcamento, LocalDate dataorc, String objetivo, String proposta, String formapagamento, String taxaseemolumentos, String inicioatividades, String validadeproposta, boolean status, BigDecimal total, BigDecimal desconto, TipoOrcamento tipoOrcamento, Pessoa pessoa, List<OrcamentoItem> orcamentoItem) {
        this.idOrcamento = idOrcamento;
        this.dataorc = dataorc;
        this.objetivo = objetivo;
        this.proposta = proposta;
        this.formapagamento = formapagamento;
        this.taxaseemolumentos = taxaseemolumentos;
        this.inicioatividades = inicioatividades;
        this.validadeproposta = validadeproposta;
        this.status = status;
        this.total = total;
        this.desconto = desconto;
        this.tipoOrcamento = tipoOrcamento;
        this.pessoa = pessoa;
        this.orcamentoItem = orcamentoItem;
    }

    public Orcamento(LocalDate dataorc, String objetivo, String proposta, String formapagamento, String taxaseemolumentos, String inicioatividades, String validadeproposta, boolean status, BigDecimal total, BigDecimal desconto, TipoOrcamento tipoOrcamento, Pessoa pessoa, List<OrcamentoItem> orcamentoItem) {
        this.dataorc = dataorc;
        this.objetivo = objetivo;
        this.proposta = proposta;
        this.formapagamento = formapagamento;
        this.taxaseemolumentos = taxaseemolumentos;
        this.inicioatividades = inicioatividades;
        this.validadeproposta = validadeproposta;
        this.status = status;
        this.total = total;
        this.desconto = desconto;
        this.tipoOrcamento = tipoOrcamento;
        this.pessoa = pessoa;
        this.orcamentoItem = orcamentoItem;
    }

    public Orcamento(Long idOrcamento, String objetivo, String proposta, Pessoa pessoa) {
        this.idOrcamento = idOrcamento;
        this.objetivo = objetivo;
        this.proposta = proposta;
        this.pessoa = pessoa;
    }

    public Orcamento(Long idOrcamento, LocalDate dataorc, boolean status, BigDecimal total, BigDecimal desconto, TipoOrcamento tipoOrcamento, Pessoa pessoa) {
        this.idOrcamento = idOrcamento;
        this.dataorc = dataorc;
        this.status = status;
        this.total = total;
        this.desconto = desconto;
        this.tipoOrcamento = tipoOrcamento;
        this.pessoa = pessoa;
    }

    public Long getIdOrcamento() {
        return idOrcamento;
    }

    public void setIdOrcamento(Long idOrcamento) {
        this.idOrcamento = idOrcamento;
    }

    public LocalDate getDataorc() {
        return dataorc;
    }

    public void setDataorc(LocalDate dataorc) {
        this.dataorc = dataorc;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getProposta() {
        return proposta;
    }

    public void setProposta(String proposta) {
        this.proposta = proposta;
    }

    public String getFormapagamento() {
        return formapagamento;
    }

    public void setFormapagamento(String formapagamento) {
        this.formapagamento = formapagamento;
    }

    public String getTaxaseemolumentos() {
        return taxaseemolumentos;
    }

    public void setTaxaseemolumentos(String taxaseemolumentos) {
        this.taxaseemolumentos = taxaseemolumentos;
    }

    public String getInicioatividades() {
        return inicioatividades;
    }

    public void setInicioatividades(String inicioatividades) {
        this.inicioatividades = inicioatividades;
    }

    public String getValidadeproposta() {
        return validadeproposta;
    }

    public void setValidadeproposta(String validadeproposta) {
        this.validadeproposta = validadeproposta;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public TipoOrcamento getTipoOrcamento() {
        return tipoOrcamento;
    }

    public void setTipoOrcamento(TipoOrcamento tipoOrcamento) {
        this.tipoOrcamento = tipoOrcamento;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public List<OrcamentoItem> getOrcamentoItem() {
        return orcamentoItem;
    }

    public void setOrcamentoItem(List<OrcamentoItem> orcamentoItem) {
        this.orcamentoItem = orcamentoItem;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getDesconto() {
        return desconto;
    }

    public void setDesconto(BigDecimal desconto) {
        this.desconto = desconto;
    }

    public void adicionaItemLista(OrcamentoItem item) {
        if (this.orcamentoItem == null) {
            this.orcamentoItem = new ArrayList<>();
        }
        this.orcamentoItem.add(item);
    }

    public void removeItemLista(int posicao) {
        this.orcamentoItem.remove(posicao);
    }

    public void removeTodosItensLista() {
        if (orcamentoItem != null) {
            for (int i = 0; i < orcamentoItem.size(); i++) {
                orcamentoItem.remove(i);
            }
        }
    }
}
