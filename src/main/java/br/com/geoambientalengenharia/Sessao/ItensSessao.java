/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Sessao;

import br.com.geoambientalengenharia.Model.OrcamentoItem;
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
@Named("itensSessao")
public class ItensSessao implements Serializable {

    private List<OrcamentoItem> listItem;

    public List<OrcamentoItem> getListItem() {
        return listItem;
    }

    public void setListItem(List<OrcamentoItem> listItem) {
        this.listItem = listItem;
    }

    public void adiciona(OrcamentoItem item) {
        if (this.listItem == null) {
            this.listItem = new ArrayList<>();
            this.listItem.add(item);
        } else {
            /*
            PROCURA O ITEM NA LISTA E SE O ITEM JÁ ESTIVER MUDA QUANTIDADE E VALOR
             */
            boolean achou = true;
            for (OrcamentoItem orcItem : this.listItem) {
                if (orcItem.getItem().getIdItem().compareTo(item.getItem().getIdItem()) == 0) {
                    orcItem.setQuantidade(item.getQuantidade());
                    orcItem.setValor(item.getValor());
                    achou = !achou;
                }
            }
            //SE NÃO ACHOU ADICIONA NA LISTA
            if (achou) {
                this.listItem.add(item);
            }
        }
    }

    public void remove(int indiceItem) {
        this.listItem.remove(indiceItem);
    }

    public void fecharSessao() {
        this.listItem = null;
    }

    public void atualiza(int posicao, int quantidade, BigDecimal valor) {
        this.listItem.get(posicao).setQuantidade(quantidade);
        this.listItem.get(posicao).setValor(valor);
    }

    public BigDecimal total() {
        BigDecimal total = BigDecimal.ZERO;
        if (listItem != null) {
            for (int i = 0; i < listItem.size(); i++) {
                total.add(listItem.get(i).getValor());
            }
        }
        return total;
    }
}
