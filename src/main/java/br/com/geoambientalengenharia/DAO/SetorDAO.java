/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import javax.enterprise.context.RequestScoped;

import br.com.geoambientalengenharia.Model.Setor;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class SetorDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public SetorDAO() {
        this(null);
    }

    @Inject
    public SetorDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Setor setor) {
        getSession().refresh(setor);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Setor setor) {
        if (setor.getIdSetor() == null) {
            manager.persist(setor);
        } else {
            manager.merge(setor);
        }
    }

    public void delete(Setor setor) {
        manager.remove(setor);
    }

    public List<Setor> listAll() {
        return manager.createQuery("select s from Setor s order by s.descricao", Setor.class).getResultList();
    }

    public Setor findById(Long id) {
        return manager.find(Setor.class, id);
    }

    public boolean existeRegistros() {
        int count = (int) getSession().createCriteria(Setor.class)
                .setProjection(Projections.rowCount()).uniqueResult();
        return count > 0;
    }
}
