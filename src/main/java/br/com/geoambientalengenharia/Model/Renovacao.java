/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Renovacao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idRenovacao;

    @NotNull(message = "Data Inicial não pode ser nula")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate dataInicial;

    @NotNull(message = "Data Vencimento não pode ser nula")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate dataVencimento;

    @ManyToOne
    @JoinColumn(name = "idAtividade")
    private Licenca licenca;

    public Renovacao() {
    }

    public Renovacao(Long idRenovacao, LocalDate dataInicial, LocalDate dataVencimento, Licenca licenca) {
        this.idRenovacao = idRenovacao;
        this.dataInicial = dataInicial;
        this.dataVencimento = dataVencimento;
        this.licenca = licenca;
    }

    public Renovacao(LocalDate dataInicial, LocalDate dataVencimento, Licenca licenca) {
        this.dataInicial = dataInicial;
        this.dataVencimento = dataVencimento;
        this.licenca = licenca;
    }   
    
    public Long getIdRenovacao() {
        return idRenovacao;
    }

    public void setIdRenovacao(Long idRenovacao) {
        this.idRenovacao = idRenovacao;
    }

    public LocalDate getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(LocalDate dataInicial) {
        this.dataInicial = dataInicial;
    }

    public LocalDate getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(LocalDate dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    public Licenca getLicenca() {
        return licenca;
    }

    public void setLicenca(Licenca licenca) {
        this.licenca = licenca;
    }
   
}
