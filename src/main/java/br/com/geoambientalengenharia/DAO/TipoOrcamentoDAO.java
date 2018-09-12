/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.TipoOrcamento;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;

/**
 *
 * @author Rafael Delanhese
 */
public class TipoOrcamentoDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public TipoOrcamentoDAO() {
        this(null);
    }

    @Inject
    public TipoOrcamentoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(TipoOrcamento tipoOrcamento) {
        getSession().refresh(tipoOrcamento);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(TipoOrcamento tipoOrcamento) {
        if (tipoOrcamento.getIdTipoOrcamento() == null) {
            manager.persist(tipoOrcamento);
        } else {
            manager.merge(tipoOrcamento);
        }
    }   

    public void delete(TipoOrcamento tipoOrcamento) {
        manager.remove(tipoOrcamento);
    }

    public List<TipoOrcamento> listAll() {
        return manager.createQuery("select to from TipoOrcamento to", TipoOrcamento.class).getResultList();
    }

    public TipoOrcamento findById(Long id) {
        return manager.find(TipoOrcamento.class, id);
    }
    
    public boolean contemTipoCadastrado() {        
        Long count = manager.createQuery("select count(tp) from TipoOrcamento tp", Long.class).getSingleResult();
        return count > 0;
    }
}
