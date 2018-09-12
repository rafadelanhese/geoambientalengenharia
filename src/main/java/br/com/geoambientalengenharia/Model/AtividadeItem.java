/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class AtividadeItem implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAtividadeItem;
    
    @ManyToOne
    @JoinColumn(name = "idAtividade")
    private Atividade atividade;
    
    @ManyToOne
    @JoinColumn(name = "idItem")
    private Item item;
    
    private int quantidade;
    
    private BigDecimal valor;

    public AtividadeItem() {
    }

    public AtividadeItem(Long idAtividadeItem, Atividade atividade, Item item, int quantidade, BigDecimal valor) {
        this.idAtividadeItem = idAtividadeItem;
        this.atividade = atividade;
        this.item = item;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public AtividadeItem(Atividade atividade, Item item, int quantidade, BigDecimal valor) {
        this.atividade = atividade;
        this.item = item;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public AtividadeItem(Item item, int quantidade, BigDecimal valor) {
        this.item = item;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    
    public Long getIdAtividadeItem() {
        return idAtividadeItem;
    }

    public void setIdAtividadeItem(Long idAtividadeItem) {
        this.idAtividadeItem = idAtividadeItem;
    }

    public Atividade getAtividade() {
        return atividade;
    }

    public void setAtividade(Atividade atividade) {
        this.atividade = atividade;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }
           
}
