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
public class TipoOrcamento implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTipoOrcamento;

    @Column(length = 80)
    @NotNull(message = "{campo.descricao.vazio}")
    @Size(min = 3, max = 80, message = "{campo.descricao.tamanho}")
    private String descricao;

    public TipoOrcamento() {
    }

    public TipoOrcamento(Long idTipoOrcamento, String descricao) {
        this.idTipoOrcamento = idTipoOrcamento;
        this.descricao = descricao;
    }

    public TipoOrcamento(String descricao) {
        this.descricao = descricao;
    }

    public Long getIdTipoOrcamento() {
        return idTipoOrcamento;
    }

    public void setIdTipoOrcamento(Long idTipoOrcamento) {
        this.idTipoOrcamento = idTipoOrcamento;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

}
