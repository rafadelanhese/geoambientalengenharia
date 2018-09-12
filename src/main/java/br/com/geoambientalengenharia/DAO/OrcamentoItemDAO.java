/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.OrcamentoItem;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class OrcamentoItemDAO {
    
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public OrcamentoItemDAO() {
        this(null);
    }

    @Inject
    public OrcamentoItemDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(OrcamentoItem orcamentoItem) {
        getSession().refresh(orcamentoItem);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(OrcamentoItem orcamentoItem) {
        if (orcamentoItem.getIdOrcamentoItem() == null) {
            manager.persist(orcamentoItem);
        } else {
            manager.merge(orcamentoItem);
        }
    }

    public void delete(OrcamentoItem orcamentoItem) {
        manager.remove(orcamentoItem);
    }

    public List<OrcamentoItem> listAll() {
        return manager.createQuery("SELECT oi FROM OrcamentoItem oi", OrcamentoItem.class).getResultList();
    }
    
    public List<OrcamentoItem> findByIdOrcamento(Long idOrcamento) {
        return manager.createQuery("SELECT oi FROM OrcamentoItem oi where oi.orcamento.idOrcamento = :idOrcamento", OrcamentoItem.class)
                .setParameter("idOrcamento", idOrcamento)
                .getResultList();
    }

     public void deletaTodosPorIdOrcamento(Long idOrcamento) {
        getSession().createQuery("delete OrcamentoItem oi where oi.orcamento.idOrcamento = :idOrcamento")
                .setParameter("idOrcamento", idOrcamento)
                .executeUpdate();
    }
     
    public OrcamentoItem findById(Long id) {
        return manager.find(OrcamentoItem.class, id);
    }
}
