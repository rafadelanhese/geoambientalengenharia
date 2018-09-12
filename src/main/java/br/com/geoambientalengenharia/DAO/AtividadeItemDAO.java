/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.AtividadeItem;
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
public class AtividadeItemDAO {
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public AtividadeItemDAO() {
        this(null);
    }

    @Inject
    public AtividadeItemDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(AtividadeItem atividadeItem) {
        getSession().refresh(atividadeItem);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(AtividadeItem atividadeItem) {
        if(atividadeItem.getIdAtividadeItem() == null)
            manager.persist(atividadeItem);
        else
            manager.merge(atividadeItem);
    }
    
    public void delete(AtividadeItem atividadeItem) {
        manager.remove(atividadeItem);
    }

    public List<AtividadeItem> listAll() {
        return manager.createQuery("select s from AtividadeItem s order by s.descricao", AtividadeItem.class).getResultList();
    }
    
    public void deletaTodosPorIdAtividade(Long idAtividade) {
        getSession().createQuery("delete AtividadeItem ai where ai.atividade.idAtividade = :idAtividade")
                .setParameter("idAtividade", idAtividade)
                .executeUpdate();
    }

    public AtividadeItem findById(Long id) {
        return manager.find(AtividadeItem.class, id);
    }
}
