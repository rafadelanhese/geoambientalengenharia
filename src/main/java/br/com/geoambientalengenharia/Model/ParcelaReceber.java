/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class ParcelaReceber implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idParcelaReceber;

    @NotNull(message = "{parcelareceber.valorrecebido.vazio}")
    @DecimalMin("0.01")
    private BigDecimal valorRecebido;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull(message = "{parcelareceber.datarecebido.vazio}")
    private LocalDate dataRecebido;

    @ManyToOne
    @JoinColumn(name = "idContasReceber")
    @NotNull(message = "{parcelareceber.contasreceber.vazio}")
    private ContasReceber contasReceber;

    public ParcelaReceber() {
    }

    public ParcelaReceber(Long idParcelaReceber, BigDecimal valorRecebido, LocalDate dataRecebido, ContasReceber contasReceber) {
        this.idParcelaReceber = idParcelaReceber;
        this.valorRecebido = valorRecebido;
        this.dataRecebido = dataRecebido;
        this.contasReceber = contasReceber;
    }

    public ParcelaReceber(BigDecimal valorRecebido, LocalDate dataRecebido, ContasReceber contasReceber) {
        this.valorRecebido = valorRecebido;
        this.dataRecebido = dataRecebido;
        this.contasReceber = contasReceber;
    }

    public Long getIdParcelaReceber() {
        return idParcelaReceber;
    }

    public void setIdParcelaReceber(Long idParcelaReceber) {
        this.idParcelaReceber = idParcelaReceber;
    }

    public BigDecimal getValorRecebido() {        
        return valorRecebido;
    }

    public void setValorRecebido(BigDecimal valorRecebido) {
        this.valorRecebido = valorRecebido;
    }

    public LocalDate getDataRecebido() {
        return dataRecebido;
    }

    public void setDataRecebido(LocalDate dataRecebido) {
        this.dataRecebido = dataRecebido;
    }

    public ContasReceber getContasReceber() {
        return contasReceber;
    }

    public void setContasReceber(ContasReceber contasReceber) {
        this.contasReceber = contasReceber;
    }        
}
