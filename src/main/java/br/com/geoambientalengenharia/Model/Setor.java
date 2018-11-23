/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Setor implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idSetor;   
    
    @Column(length = 80)
    @NotNull (message="{campo.descricao.vazio}")
    @Size(min=3, max=80,message = "{campo.descricao.tamanho}")
    private String descricao;

    public Setor() {
    }

    public Setor(Long idSetor) {
        this.idSetor = idSetor;
    }   
    
    public Setor(Long idSetor, String descricao) {
        this.idSetor = idSetor;
        this.descricao = descricao;
    }

    public Setor(String descricao) {
        this.descricao = descricao;
    }

    public Long getIdSetor() {
        return idSetor;
    }

    public void setIdSetor(Long idSetor) {
        this.idSetor = idSetor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
}
