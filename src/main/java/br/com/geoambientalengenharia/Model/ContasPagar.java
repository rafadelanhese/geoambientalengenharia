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
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class ContasPagar implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idContasPagar;

    @Size(min = 3, max = 80, message = "{contaspagar.observacao.tamanho}")
    private String observacao;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate datalancamento;

    @ManyToOne
    @JoinColumn(name = "idTipoDespesa")
    @NotNull(message = "{contaspagar.tipodespesa.vazio}")
    private TipoDespesa tipoDespesa;

    @ManyToOne
    @JoinColumn(name = "idPessoa")
    @NotNull(message = "{contaspagar.pessoa.vazio}")
    private Pessoa pessoa;

    @OneToMany(mappedBy = "contasPagar", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Parcela> parcelas;

    public ContasPagar() {
    }

    public ContasPagar(Long idContasPagar, String observacao, LocalDate datalancamento, TipoDespesa tipoDespesa, Pessoa pessoa, List<Parcela> parcelas) {
        this.idContasPagar = idContasPagar;
        this.observacao = observacao;
        this.datalancamento = datalancamento;
        this.tipoDespesa = tipoDespesa;
        this.pessoa = pessoa;
        this.parcelas = parcelas;
    }

    public ContasPagar(String observacao, LocalDate datalancamento, TipoDespesa tipoDespesa, Pessoa pessoa, List<Parcela> parcelas) {
        this.observacao = observacao;
        this.datalancamento = datalancamento;
        this.tipoDespesa = tipoDespesa;
        this.pessoa = pessoa;
        this.parcelas = parcelas;
    }

    public Long getIdContasPagar() {
        return idContasPagar;
    }

    public void setIdContasPagar(Long idContasPagar) {
        this.idContasPagar = idContasPagar;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public LocalDate getDatalancamento() {
        return datalancamento;
    }

    public void setDatalancamento(LocalDate datalancamento) {
        this.datalancamento = datalancamento;
    }

    public TipoDespesa getTipoDespesa() {
        return tipoDespesa;
    }

    public void setTipoDespesa(TipoDespesa tipoDespesa) {
        this.tipoDespesa = tipoDespesa;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public List<Parcela> getParcelas() {
        return parcelas;
    }

    public void setParcelas(List<Parcela> parcelas) {
        this.parcelas = parcelas;
    }

    public void addParcelas(Parcela parcela) {
        if (this.parcelas == null) {
            this.parcelas = new ArrayList<>();
        }

        this.parcelas.add(parcela);
    }

    public String valorTotal() {
        BigDecimal total = BigDecimal.ZERO;
        if (parcelas != null) {
            for (int i = 0; i < parcelas.size(); i++) {
                total = total.add(parcelas.get(i).getValor());                
            }
        }
        return total.toString();
    }

    public boolean status() {
        boolean flag = false;
        if (parcelas != null) {
            for (int i = 0; i < parcelas.size(); i++) {
                if(parcelas.get(i).getValorpago() == null)
                    flag = true;
            }
        }        
        return flag;
    }
}
