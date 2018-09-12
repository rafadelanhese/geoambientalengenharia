/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Endereco implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idEndereco;

    @Column(length = 100)
    @Size(min = 3, max = 100, message = "{endereco.rua.tamanho}")
    private String rua;

    @Column(length = 10)
    @Size(max = 10, message = "{endereco.numero.tamanho}")
    private String numero;

    @Column(length = 50)
    @Size(min = 3, max = 50, message = "{endereco.bairro.tamanho}")
    private String bairro;

    @Column(length = 50)
    @Size(max = 50, message = "{endereco.complemento.tamanho}")
    private String complemento;

    @Column(length = 9)
    @Size(min = 9, max = 9, message = "{endereco.cep.tamanho}")
    private String cep;

    @NotNull(message = "{endereco.cidade.vazio}")
    @ManyToOne
    @JoinColumn(name = "idCidade")
    private Cidade cidade;

    public Endereco() {
    }

    public Endereco(Long idEndereco, String rua, String numero, String bairro, String complemento, String cep, Cidade cidade) {
        this.idEndereco = idEndereco;
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.complemento = complemento;
        this.cep = cep;
        this.cidade = cidade;
    }

    public Endereco(String rua, String numero, String bairro, String complemento, String cep, Cidade cidade) {
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.complemento = complemento;
        this.cep = cep;
        this.cidade = cidade;
    }

    public Long getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(Long idEndereco) {
        this.idEndereco = idEndereco;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

}
