/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Rafael Delanhese
 */
@Entity
public class Estado implements Serializable {

    @Id
    private Long idEstado;
    private String nome;
    @Column(length = 2)
    private String sigla;

    public Estado() {
    }

    public Estado(Long idEstado) {
        this.idEstado = idEstado;
    }
    
    public Estado(Long idEstado, String nome, String sigla) {
        this.idEstado = idEstado;
        this.nome = nome;
        this.sigla = sigla;
    }

    public Estado(String nome, String sigla) {
        this.nome = nome;
        this.sigla = sigla;
    }

    public Long getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Long idEstado) {
        this.idEstado = idEstado;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public List<Estado> listaEstados() {
        List<Estado> listaEstados = new ArrayList<>();

        listaEstados.add(new Estado(11L, "Rondônia", "RO"));
        listaEstados.add(new Estado(12L, "Acre", "AC"));
        listaEstados.add(new Estado(13L, "Amazonas", "AM"));
        listaEstados.add(new Estado(14L, "Roraima", "RR"));
        listaEstados.add(new Estado(15L, "Pará", "PA"));
        listaEstados.add(new Estado(16L, "Amapá", "AP"));
        listaEstados.add(new Estado(17L, "Tocantins", "TO"));
        listaEstados.add(new Estado(21L, "Maranhão", "MA"));
        listaEstados.add(new Estado(22L, "Piauí", "PI"));
        listaEstados.add(new Estado(23L, "Ceará", "CE"));
        listaEstados.add(new Estado(24L, "Rio Grande do Norte", "RN"));
        listaEstados.add(new Estado(25L, "Paraíba", "PB"));
        listaEstados.add(new Estado(26L, "Pernambuco", "PE"));
        listaEstados.add(new Estado(27L, "Alagoas", "AL"));
        listaEstados.add(new Estado(28L, "Sergipe", "SE"));
        listaEstados.add(new Estado(29L, "Bahia", "BA"));
        listaEstados.add(new Estado(31L, "Minas Gerais", "MG"));
        listaEstados.add(new Estado(32L, "Espírito Santo", "ES"));
        listaEstados.add(new Estado(33L, "Rio de Janeiro", "RJ"));
        listaEstados.add(new Estado(35L, "São Paulo", "SP"));
        listaEstados.add(new Estado(41L, "Paraná", "PR"));
        listaEstados.add(new Estado(42L, "Santa Catarina", "SC"));
        listaEstados.add(new Estado(43L, "Rio Grande do Sul", "RS"));
        listaEstados.add(new Estado(50L, "Mato Grosso do Sul", "MS"));
        listaEstados.add(new Estado(51L, "Mato Grosso", "MT"));
        listaEstados.add(new Estado(52L, "Goiás", "GO"));
        listaEstados.add(new Estado(53L, "Distrito Federal", "DF"));
        
        return listaEstados;
    }
}
