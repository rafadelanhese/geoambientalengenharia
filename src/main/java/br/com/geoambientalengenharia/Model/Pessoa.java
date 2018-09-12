/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.Email;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Pessoa implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idPessoa;

    @Column(length = 100)
    @NotNull(message = "{pessoa.nome.vazio}")
    @Size(min = 3, max = 100, message = "{pessoa.nome.tamanho}")
    private String nome;

    @Email
    @Column(length = 150)
    @NotNull(message = "{pessoa.email.vazio}")
    @Size(min = 1, max = 150, message = "{pessoa.email.tamanho}")
    private String email;

    @NotNull(message = "{pessoa.senha.vazio}")
    @Size(min = 6, max = 255, message = "{pessoa.senha.tamanho}")
    private String senha;

    @Valid
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idEndereco")
    private Endereco endereco;

    @ManyToOne
    @JoinColumn(name = "idSetor")
    @NotNull(message = "{pessoa.setor.vazio}")
    private Setor setor;

    @OneToMany(mappedBy = "pessoa", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Telefone> telefone;

    @ManyToMany(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    @JoinTable(name = "pessoatipo", joinColumns
            = {
                @JoinColumn(name = "idPessoa")}, inverseJoinColumns
            = {
                @JoinColumn(name = "idTipoUsuario")})
    private List<TipoUsuario> tipousuario;

    public Pessoa() {
    }

    public Pessoa(Long idPessoa) {
        this.idPessoa = idPessoa;
    }

    public Pessoa(Long idPessoa, String nome, String email, String senha, Endereco endereco, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        this.idPessoa = idPessoa;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.endereco = endereco;
        this.setor = setor;
        this.telefone = telefone;
        this.tipousuario = tipousuario;
    }

    public Pessoa(String nome, String email, String senha, Endereco endereco, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.endereco = endereco;
        this.setor = setor;
        this.telefone = telefone;
        this.tipousuario = tipousuario;
    }

    public Pessoa(Long idPessoa, String nome, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        this.idPessoa = idPessoa;
        this.nome = nome;
        this.setor = setor;
        if (this.telefone == null) {
            this.telefone = new ArrayList<>();
        }
        this.telefone = telefone;

        if (this.tipousuario == null) {
            this.tipousuario = new ArrayList<>();
        }

        this.tipousuario = tipousuario;
    }

    public Pessoa(Long idPessoa, String nome, Endereco endereco, Setor setor) {
        this.idPessoa = idPessoa;
        this.nome = nome;
        this.endereco = endereco;
        this.setor = setor;
    }

    public Pessoa(Long idPessoa, String nome) {
        this.idPessoa = idPessoa;
        this.nome = nome;
    }

    public Long getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Long idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

    public List<Telefone> getTelefone() {
        return telefone;
    }

    public void setTelefone(List<Telefone> telefone) {
        this.telefone = telefone;
    }

    public List<TipoUsuario> getTipousuario() {
        return tipousuario;
    }

    public void setTipousuario(TipoUsuario tipousuario) {
        if (this.tipousuario == null) {
            this.tipousuario = new ArrayList<>();
        }
        this.tipousuario.add(tipousuario);
    }

    public String getPrimeiroNome() {
        String[] primeiroNome = nome.split(" ");
        return primeiroNome[0];
    }

    public String getNomeAbreviado() {
        String[] splitNome = nome.split(" ");
        String nomeAbreviado = null;
        nomeAbreviado = splitNome[0];

        for (int i = 1; i < splitNome.length - 1; i++) {
            nomeAbreviado += " " + splitNome[i].charAt(0) + ".";
        }
        nomeAbreviado += " " + splitNome[splitNome.length - 1];
        return nomeAbreviado;
    }
}
