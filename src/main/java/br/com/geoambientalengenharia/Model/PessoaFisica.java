/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

/**
 *
 * @author Rafael Delanhese
 */
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.br.CPF;

@Entity
@PrimaryKeyJoinColumn(name = "idPessoa")
public class PessoaFisica extends Pessoa implements Serializable {

    @Column(length = 14)
    @NotNull(message = "{pessoa.fisica.cpf.vazio}")
    @Size(min = 14, message = "{pessoa.fisica.cpf.tamanho}")
    @CPF
    private String cpf;

    @Column(length = 12)
    @NotNull(message = "{pessoa.fisica.rg.vazio}")
    @Size(min = 12, message = "{pessoa.fisica.rg.tamanho}")
    private String rg;

    public PessoaFisica() {
    }

    public PessoaFisica(String cpf, String rg, Long idPessoa, String nome, String email, String senha, Endereco endereco, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        super(idPessoa, nome, email, senha, endereco, setor, telefone, tipousuario);
        this.cpf = cpf;
        this.rg = rg;
    }

    public PessoaFisica(String cpf, String rg, String nome, String email, String senha, Endereco endereco, Setor setor, List<Telefone> telefone, List<TipoUsuario> tipousuario) {
        super(nome, email, senha, endereco, setor, telefone, tipousuario);
        this.cpf = cpf;
        this.rg = rg;
    }
  
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

}
