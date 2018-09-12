/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.enterprise.context.SessionScoped;
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
public class OrcamentoItem implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idOrcamentoItem;
    
    @ManyToOne
    @JoinColumn(name = "idOrcamento")
    private Orcamento orcamento;
    
    @ManyToOne
    @JoinColumn(name = "idItem")
    private Item item;
    
    private int quantidade;
    private BigDecimal valor;

    public OrcamentoItem() {
    }

    public OrcamentoItem(Long idOrcamentoItem, Orcamento orcamento, Item item, int quantidade, BigDecimal valor) {
        this.idOrcamentoItem = idOrcamentoItem;
        this.orcamento = orcamento;
        this.item = item;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public OrcamentoItem(Orcamento orcamento, Item item, int quantidade, BigDecimal valor) {
        this.orcamento = orcamento;
        this.item = item;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public OrcamentoItem(Item item, int quantidade, BigDecimal valor) {
        this.item = item;
        this.quantidade = quantidade;
        this.valor = valor;
    }
    
    public Long getIdOrcamentoItem() {
        return idOrcamentoItem;
    }

    public void setIdOrcamentoItem(Long idOrcamentoItem) {
        this.idOrcamentoItem = idOrcamentoItem;
    }

    public Orcamento getOrcamento() {
        return orcamento;
    }

    public void setOrcamento(Orcamento orcamento) {
        this.orcamento = orcamento;
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
