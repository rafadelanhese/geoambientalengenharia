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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Item implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idItem;

    @Column(length = 80)
    @NotNull(message = "{campo.descricao.vazio}")
    @Size(min = 3, max = 80, message = "{campo.descricao.tamanho}")
    private String descricao;
    
    @DecimalMin("0.01")
    @NotNull(message = "{item.valor.vazio}")
    private BigDecimal valor;

    @ManyToOne
    @JoinColumn(name = "idSetor")
    @NotNull(message = "{item.setor.vazio}")
    private Setor setor;  

    public Item() {
    }   

    public Item(Long idItem, String descricao, BigDecimal valor, Setor setor) {
        this.idItem = idItem;
        this.descricao = descricao;
        this.valor = valor;
        this.setor = setor;
    }
    
    public Item(String descricao, BigDecimal valor, Setor setor) {
        this.descricao = descricao;
        this.valor = valor;
        this.setor = setor;
    } 

    public Long getIdItem() {
        return idItem;
    }

    public void setIdItem(Long idItem) {
        this.idItem = idItem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }
}
