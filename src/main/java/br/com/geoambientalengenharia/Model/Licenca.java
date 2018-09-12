/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
@PrimaryKeyJoinColumn(name = "idAtividade")
public class Licenca extends Atividade implements Serializable {

    @Column(length = 10)
    @Size(max = 10, message = "{tamanho.maximo}")
    @NotNull(message = "{licenca.cnae.vazio}")
    private String cnae;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{licenca.numeroProcesso.vazio}")
    private String numeroProcesso;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{licenca.numeroLicenca.vazio}")
    private String numeroLicenca;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{licenca.versao.vazio}")
    private String versao;

    @Column(length = 150)
    @Size(max = 150, message = "{tamanho.maximo}")
    @NotNull(message = "{licenca.orgao.vazio}")
    private String orgao;

    @OneToMany(mappedBy = "licenca", targetEntity = Renovacao.class, fetch = FetchType.EAGER, cascade = {CascadeType.REMOVE})
    @Fetch(FetchMode.SUBSELECT)
    private List<Renovacao> renovacao;

    public Licenca() {
    }

    public Licenca(Long idAtividade) {
        super(idAtividade);
    }

    public Licenca(String cnae, String numeroProcesso, String numeroLicenca, String versao, String orgao, List<Renovacao> renovacao, Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        super(idAtividade, dataInicio, dataFinal, dataPrevistaFim, descricao, status, pessoa, setor, endereco, orcamento, pessoaLogada, contasReceber, documentos, atividadeItem);
        this.cnae = cnae;
        this.numeroProcesso = numeroProcesso;
        this.numeroLicenca = numeroLicenca;
        this.versao = versao;
        this.orgao = orgao;
        this.renovacao = renovacao;
    }

    public Licenca(String cnae, String numeroProcesso, String numeroLicenca, String versao, String orgao, List<Renovacao> renovacao, LocalDate dataInicio, LocalDate dataFinal, LocalDate dataPrevistaFim, String descricao, boolean status, Pessoa pessoa, Setor setor, Endereco endereco, Orcamento orcamento, Pessoa pessoaLogada, List<ContasReceber> contasReceber, List<Documento> documentos, List<AtividadeItem> atividadeItem) {
        super(dataInicio, dataFinal, dataPrevistaFim, descricao, status, pessoa, setor, endereco, orcamento, pessoaLogada, contasReceber, documentos, atividadeItem);
        this.cnae = cnae;
        this.numeroProcesso = numeroProcesso;
        this.numeroLicenca = numeroLicenca;
        this.versao = versao;
        this.orgao = orgao;
        this.renovacao = renovacao;
    }

    public Licenca(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal, boolean status, Pessoa pessoa, Setor setor, Endereco endereco) {
        super(idAtividade, dataInicio, dataFinal, status, pessoa, setor, endereco);
    }

    public String getCnae() {
        return cnae;
    }

    public void setCnae(String cnae) {
        this.cnae = cnae;
    }

    public String getNumeroProcesso() {
        return numeroProcesso;
    }

    public void setNumeroProcesso(String numeroProcesso) {
        this.numeroProcesso = numeroProcesso;
    }

    public String getNumeroLicenca() {
        return numeroLicenca;
    }

    public void setNumeroLicenca(String numeroLicenca) {
        this.numeroLicenca = numeroLicenca;
    }

    public String getVersao() {
        return versao;
    }

    public void setVersao(String versao) {
        this.versao = versao;
    }

    public String getOrgao() {
        return orgao;
    }

    public void setOrgao(String orgao) {
        this.orgao = orgao;
    }

    public List<Renovacao> getRenovacao() {
        return renovacao;
    }

    public void setRenovacao(List<Renovacao> renovacao) {
        this.renovacao = renovacao;
    }

}
