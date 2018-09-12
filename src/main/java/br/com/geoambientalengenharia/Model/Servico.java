/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import br.com.geoambientalengenharia.Login.UsuarioLogado;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
@PrimaryKeyJoinColumn(name="idAtividade")
public class Servico extends Atividade implements Serializable{
    
    @Column(length = 150)
    @Size(min = 3, max=150,message = "{servico.tipo.tamanho}")
    @NotNull(message = "{servico.tipo.vazio}")
    private String tipo;
    
    @Column(length = 150)
    @Size(min = 3, max=150,message = "{servico.observacoes.tamanho}")
    @NotNull(message = "{servico.observacoes.vazio}")
    private String observacoes;
  

    public Servico() {
    }

    public Servico(String tipo, String observacoes, Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        super(idAtividade, dataInicio, dataFinal, dataPrevistaFim, descricao, status, pessoa, setor, endereco, orcamento, pessoaLogada, contasReceber, documentos, atividadeItem);
        this.tipo = tipo;
        this.observacoes = observacoes;
    }

    public Servico(String tipo, String observacoes, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        super(dataInicio, dataFinal, dataPrevistaFim, descricao, status, pessoa, setor, endereco, orcamento, pessoaLogada, contasReceber, documentos, atividadeItem);
        this.tipo = tipo;
        this.observacoes = observacoes;
    }   

    public Servico(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, boolean status, Pessoa pessoa, Setor setor, Endereco endereco) {
        super(idAtividade, dataInicio, dataFinal, status, pessoa, setor, endereco);
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }   
}
