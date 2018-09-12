/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.math.BigDecimal;
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
public class ContasReceber implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idContasReceber;

    @NotNull(message = "{contasreceber.valor.vazio}")
    @DecimalMin("0.01")
    private BigDecimal valor;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull(message = "{contasreceber.dataReceber.vazio}")
    private LocalDate dataReceber;

    @Column(length = 150)
    @NotNull(message = "{contasreceber.observacoes.vazio}")
    @Size(min = 3, max = 150, message = "{contasreceber.observacoes.tamanho}")
    private String observacoes;

    @ManyToOne
    @JoinColumn(name = "idAtividade")
    private Atividade atividade;

    @OneToMany(mappedBy = "contasReceber", fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    @Fetch(FetchMode.SUBSELECT)
    private List<ParcelaReceber> parcelaReceber;

    public ContasReceber() {        
    }

    public ContasReceber(Long idContasReceber, BigDecimal valor, LocalDate dataReceber, String observacoes, Atividade atividade, List<ParcelaReceber> parcelaReceber) {
        this.idContasReceber = idContasReceber;
        this.valor = valor;
        this.dataReceber = dataReceber;
        this.observacoes = observacoes;
        this.atividade = atividade;
        this.parcelaReceber = parcelaReceber;
    }

    public ContasReceber(BigDecimal valor, LocalDate dataReceber, String observacoes, Atividade atividade, List<ParcelaReceber> parcelaReceber) {
        this.valor = valor;
        this.dataReceber = dataReceber;
        this.observacoes = observacoes;
        this.atividade = atividade;
        this.parcelaReceber = parcelaReceber;
    }

    public Long getIdContasReceber() {
        return idContasReceber;
    }

    public void setIdContasReceber(Long idContasReceber) {
        this.idContasReceber = idContasReceber;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public LocalDate getDataReceber() {
        return dataReceber;
    }

    public void setDataReceber(LocalDate dataReceber) {
        this.dataReceber = dataReceber;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public Atividade getAtividade() {
        return atividade;
    }

    public void setAtividade(Atividade atividade) {
        this.atividade = atividade;
    }

    public List<ParcelaReceber> getParcelaReceber() {
        return parcelaReceber;
    }

    public void setParcelaReceber(List<ParcelaReceber> parcelaReceber) {
        this.parcelaReceber = parcelaReceber;
    }
}
