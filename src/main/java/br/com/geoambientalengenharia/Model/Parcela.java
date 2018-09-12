/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Parcela implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idParcela;

    @Column(precision = 9, scale = 2, updatable = false)
    private BigDecimal valor;

    @Column(length = 5)
    private String qtdeParcelas;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate datavencimento;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate datapagamento;

    private BigDecimal valorpago;

    @ManyToOne
    @JoinColumn(name = "idContasPagar", nullable = false)
    private ContasPagar contasPagar;

    public Parcela() {
    }

    public Parcela(Long idParcela, BigDecimal valor, String qtdeParcelas, LocalDate datavencimento, LocalDate datapagamento, BigDecimal valorpago, ContasPagar contasPagar) {
        this.idParcela = idParcela;
        this.valor = valor;
        this.qtdeParcelas = qtdeParcelas;
        this.datavencimento = datavencimento;
        this.datapagamento = datapagamento;
        this.valorpago = valorpago;
        this.contasPagar = contasPagar;
    }

    public Parcela(BigDecimal valor, String qtdeParcelas, LocalDate datavencimento, LocalDate datapagamento, BigDecimal valorpago, ContasPagar contasPagar) {
        this.valor = valor;
        this.qtdeParcelas = qtdeParcelas;
        this.datavencimento = datavencimento;
        this.datapagamento = datapagamento;
        this.valorpago = valorpago;
        this.contasPagar = contasPagar;
    }

    public Long getIdParcela() {
        return idParcela;
    }

    public void setIdParcela(Long idParcela) {
        this.idParcela = idParcela;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public String getQtdeParcelas() {
        return qtdeParcelas;
    }

    public void setQtdeParcelas(String qtdeParcelas) {
        this.qtdeParcelas = qtdeParcelas;
    }

    public LocalDate getDatavencimento() {
        return datavencimento;
    }

    public void setDatavencimento(LocalDate datavencimento) {
        this.datavencimento = datavencimento;
    }

    public LocalDate getDatapagamento() {
        return datapagamento;
    }

    public void setDatapagamento(LocalDate datapagamento) {
        this.datapagamento = datapagamento;
    }

    public BigDecimal getValorpago() {
        return valorpago;
    }

    public void setValorpago(BigDecimal valorpago) {
        this.valorpago = valorpago;
    }

    public ContasPagar getContasPagar() {
        return contasPagar;
    }

    public void setContasPagar(ContasPagar contasPagar) {
        this.contasPagar = contasPagar;
    }

}
