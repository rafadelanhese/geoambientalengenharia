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
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Documento implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idDocumento;

    private String nomeArquivo;
    private String caminhoArquivo;

    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate dataUpload;

    private Long tamanhoArquivo;

    public Documento() {
    }

    public Documento(Long idDocumento, String nomeArquivo, String caminhoArquivo, LocalDate dataUpload, Long tamanhoArquivo) {
        this.idDocumento = idDocumento;
        this.nomeArquivo = nomeArquivo;
        this.caminhoArquivo = caminhoArquivo;
        this.dataUpload = dataUpload;
        this.tamanhoArquivo = tamanhoArquivo;
    }

    public Documento(String nomeArquivo, String caminhoArquivo, LocalDate dataUpload, Long tamanhoArquivo) {
        this.nomeArquivo = nomeArquivo;
        this.caminhoArquivo = caminhoArquivo;
        this.dataUpload = dataUpload;
        this.tamanhoArquivo = tamanhoArquivo;
    }

    public Long getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(Long idDocumento) {
        this.idDocumento = idDocumento;
    }

    public String getNomeArquivo() {
        String[] split = nomeArquivo.split("@");
        return split[1];
    }

    public void setNomeArquivo(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

    public String getCaminhoArquivo() {
        return caminhoArquivo;
    }

    public void setCaminhoArquivo(String caminhoArquivo) {
        this.caminhoArquivo = caminhoArquivo;
    }

    public LocalDate getDataUpload() {
        return dataUpload;
    }

    public void setDataUpload(LocalDate dataUpload) {
        this.dataUpload = dataUpload;
    }

    public Long getTamanhoArquivo() {
        return tamanhoArquivo;
    }

    public void setTamanhoArquivo(Long tamanhoArquivo) {
        this.tamanhoArquivo = tamanhoArquivo;
    }

    public String getTamArq() {
        double tam = tamanhoArquivo / 1024;
        String retorno = null;

        if (tam < 1024) {
            retorno = String.format("%.2f KB", tam);
        } else {
            tam /= 1024;
            retorno = String.format("%.2f MB", tam);
        }
        return retorno;
    }
}
