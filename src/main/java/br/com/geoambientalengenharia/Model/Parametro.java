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
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.br.CNPJ;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Parametro implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idParametro;

    @Column(length = 150)
    @NotNull(message = "{parametro.nome.vazio}")
    @Size(min = 3, max = 150, message = "{parametro.nome.tamanho}")
    private String nome;

    @Column(length = 18)
    @NotNull(message = "{parametro.cnpj.vazio}")
    @Size(min = 18, message = "{parametro.cnpj.tamanho}")
    @CNPJ
    private String cnpj;

    @Column(length = 14)
    @NotNull(message = "{parametro.telefone.vazio}")
    @Size(min = 14, message = "{parametro.telefone.tamanho}")
    private String telefone;

    @Email
    @Column(length = 150)
    @NotNull(message = "{parametro.email.vazio}")
    @Size(min = 1, max = 150, message = "{parametro.email.tamanho}")
    private String email;

    @Column(length = 80)
    @Size(max = 80, message = "{parametro.site.tamanho}")
    private String site;

    @NotNull(message = "{parametro.endereco.vazio}")
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idEndereco")
    private Endereco endereco;

    public Parametro() {
    }

    public Parametro(Long idParametro, String nome, String cnpj, String telefone, String email, String site, Endereco endereco) {
        this.idParametro = idParametro;
        this.nome = nome;
        this.cnpj = cnpj;
        this.telefone = telefone;
        this.email = email;
        this.site = site;
        this.endereco = endereco;
    }

    public Parametro(String nome, String cnpj, String telefone, String email, String site, Endereco endereco) {
        this.nome = nome;
        this.cnpj = cnpj;
        this.telefone = telefone;
        this.email = email;
        this.site = site;
        this.endereco = endereco;
    }

    public Long getIdParametro() {
        return idParametro;
    }

    public void setIdParametro(Long idParametro) {
        this.idParametro = idParametro;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }  
    
    public String getCabecalhoEsquedo(){
        return String.format("%s\nCNPJ: %s\n%s\n%s", nome,cnpj,site,email);
    }
    
    public String getCabecalhoDireito(String telefoneUsuario){
        return String.format("%s - %s\n%s, %s\n%s - %s\n%s | %s", 
                endereco.getCidade().getNome(), 
                endereco.getCidade().getEstado().getSigla(),
                endereco.getRua(),
                endereco.getNumero(),
                endereco.getBairro(),
                endereco.getCep(),
                telefone, telefoneUsuario);
    }
}
