/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
@PrimaryKeyJoinColumn(name = "idAtividade")
public class Projeto extends Atividade implements Serializable {

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.art.vazio}")
    private String art;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.areaTotal.vazio}")
    private String areaTotal;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.areaTerreno.vazio}")
    private String areaTerreno;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.referenciaCadastral.vazio}")
    private String referenciaCadastral;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.cadastroAnterior.vazio}")
    private String cadastroAnterior;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.zoneamento.vazio}")
    private String zoneamento;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.numeroMatricula.vazio}")
    private String numeroMatricula;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{projeto.loteQuadra.vazio}")
    private String loteQuadra;

    public Projeto() {
    }

    public Projeto(String art, String areaTotal, String areaTerreno, String referenciaCadastral, String cadastroAnterior, String zoneamento, String numeroMatricula, String loteQuadra, Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        super(idAtividade, dataInicio, dataFinal, dataPrevistaFim, descricao, status, pessoa, setor, endereco, orcamento, pessoaLogada, contasReceber, documentos, atividadeItem);
        this.art = art;
        this.areaTotal = areaTotal;
        this.areaTerreno = areaTerreno;
        this.referenciaCadastral = referenciaCadastral;
        this.cadastroAnterior = cadastroAnterior;
        this.zoneamento = zoneamento;
        this.numeroMatricula = numeroMatricula;
        this.loteQuadra = loteQuadra;
    }

    public Projeto(String art, String areaTotal, String areaTerreno, String referenciaCadastral, String cadastroAnterior, String zoneamento, String numeroMatricula, String loteQuadra, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        super(dataInicio, dataFinal, dataPrevistaFim, descricao, status, pessoa, setor, endereco, orcamento, pessoaLogada, contasReceber, documentos, atividadeItem);
        this.art = art;
        this.areaTotal = areaTotal;
        this.areaTerreno = areaTerreno;
        this.referenciaCadastral = referenciaCadastral;
        this.cadastroAnterior = cadastroAnterior;
        this.zoneamento = zoneamento;
        this.numeroMatricula = numeroMatricula;
        this.loteQuadra = loteQuadra;
    }

    public Projeto(String art, String areaTotal, String areaTerreno, String referenciaCadastral, String cadastroAnterior, String zoneamento, String numeroMatricula, String loteQuadra, Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, boolean status, Pessoa pessoa) {
        super(idAtividade, dataInicio, dataFinal, status, pessoa);
        this.art = art;
        this.areaTotal = areaTotal;
        this.areaTerreno = areaTerreno;
        this.referenciaCadastral = referenciaCadastral;
        this.cadastroAnterior = cadastroAnterior;
        this.zoneamento = zoneamento;
        this.numeroMatricula = numeroMatricula;
        this.loteQuadra = loteQuadra;
    }

    public Projeto(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, boolean status, Pessoa pessoa, Setor setor, Endereco endereco) {
        super(idAtividade, dataInicio, dataFinal, status, pessoa, setor, endereco);
    }

    public String getArt() {
        return art;
    }

    public void setArt(String art) {
        this.art = art;
    }

    public String getAreaTotal() {
        return areaTotal;
    }

    public void setAreaTotal(String areaTotal) {
        this.areaTotal = areaTotal;
    }

    public String getAreaTerreno() {
        return areaTerreno;
    }

    public void setAreaTerreno(String areaTerreno) {
        this.areaTerreno = areaTerreno;
    }

    public String getReferenciaCadastral() {
        return referenciaCadastral;
    }

    public void setReferenciaCadastral(String referenciaCadastral) {
        this.referenciaCadastral = referenciaCadastral;
    }

    public String getCadastroAnterior() {
        return cadastroAnterior;
    }

    public void setCadastroAnterior(String cadastroAnterior) {
        this.cadastroAnterior = cadastroAnterior;
    }

    public String getZoneamento() {
        return zoneamento;
    }

    public void setZoneamento(String zoneamento) {
        this.zoneamento = zoneamento;
    }

    public String getNumeroMatricula() {
        return numeroMatricula;
    }

    public void setNumeroMatricula(String numeroMatricula) {
        this.numeroMatricula = numeroMatricula;
    }

    public String getLoteQuadra() {
        return loteQuadra;
    }

    public void setLoteQuadra(String loteQuadra) {
        this.loteQuadra = loteQuadra;
    }
}
