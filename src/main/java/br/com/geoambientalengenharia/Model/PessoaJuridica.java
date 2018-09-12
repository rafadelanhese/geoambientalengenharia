/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.br.CNPJ;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
@PrimaryKeyJoinColumn(name = "idPessoa")
public class PessoaJuridica extends Pessoa implements Serializable {

    @Column(length = 18)
    @NotNull(message = "{pessoa.juridica.cnpj.vazio}")
    @Size(min = 18, message = "{pessoa.juridica.cnpj.tamanho}")
    @CNPJ
    private String cnpj;
    
    @Column(length = 15)   
    @Size(min = 15, message = "{pessoa.juridica.ie.tamanho}")
    private String ie;

    public PessoaJuridica() {
    }

    public PessoaJuridica(String cnpj, String ie, Long idPessoa, String nome, String email, String senha, Endereco endereco, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        super(idPessoa, nome, email, senha, endereco, setor, telefone, tipousuario);
        this.cnpj = cnpj;
        this.ie = ie;
    }

    public PessoaJuridica(String cnpj, String ie, String nome, String email, String senha, Endereco endereco, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        super(nome, email, senha, endereco, setor, telefone, tipousuario);
        this.cnpj = cnpj;
        this.ie = ie;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getIe() {
        return ie;
    }

    public void setIe(String ie) {
        this.ie = ie;
    }
}
