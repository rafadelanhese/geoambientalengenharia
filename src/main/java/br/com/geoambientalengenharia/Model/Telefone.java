/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
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
public class Telefone implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTelefone;

    private String telefone;
    private String descricao;

    @ManyToOne
    @JoinColumn(name = "idPessoa", nullable = false)
    private Pessoa pessoa;

    public Telefone() {
    }

    public Telefone(Long idTelefone, String telefone, String descricao, Pessoa pessoa) {
        this.idTelefone = idTelefone;
        this.telefone = telefone;
        this.descricao = descricao;
        this.pessoa = pessoa;
    }

    public Telefone(String telefone, String descricao, Pessoa pessoa) {
        this.telefone = telefone;
        this.descricao = descricao;
        this.pessoa = pessoa;
    }

    public Long getIdTelefone() {
        return idTelefone;
    }

    public void setIdTelefone(Long idTelefone) {
        this.idTelefone = idTelefone;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
}
