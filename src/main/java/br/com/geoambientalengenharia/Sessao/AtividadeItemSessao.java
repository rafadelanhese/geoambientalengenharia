/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Sessao;

import br.com.geoambientalengenharia.Model.AtividadeItem;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Rafael Delanhese
 */
@SessionScoped
@Named("atividadeSessao")
public class AtividadeItemSessao implements Serializable {

    private List<AtividadeItem> listAI;

    public List<AtividadeItem> getListAI() {
        return listAI;
    }

    public void setListAI(List<AtividadeItem> listAI) {
        this.listAI = listAI;
    }

    public void adiciona(AtividadeItem atividadeItem) {
        if (this.listAI == null) {
            this.listAI = new ArrayList<>();
            this.listAI.add(atividadeItem);
        } else {
            /*
            PROCURA O ITEM NA LISTA E SE O ITEM JÁ ESTIVER MUDA QUANTIDADE E VALOR
             */
            boolean achou = true;
            for (int i = 0; i < this.listAI.size(); i++) {
                if (this.listAI.get(i).getItem().getIdItem().compareTo(atividadeItem.getItem().getIdItem()) == 0) {
                    this.listAI.get(i).setQuantidade(atividadeItem.getQuantidade());
                    this.listAI.get(i).setValor(atividadeItem.getItem().getValor());
                    achou = !achou;
                }
            }
            //SE NÃO ACHOU ADICIONA NA LISTA
            if (achou) {
                this.listAI.add(atividadeItem);
            }
        }
    }

    public void remove(int indiceItem) {
        this.listAI.remove(indiceItem);
    }

    public void fecharSessao() {
        this.listAI = null;
    }

    public AtividadeItem getItem(int posicao) {
        return this.listAI.get(posicao);
    }
    
    public void atualiza(int posicao, int quantidade, BigDecimal valor){
        this.listAI.get(posicao).setQuantidade(quantidade);
        this.listAI.get(posicao).setValor(valor);
    }
}
