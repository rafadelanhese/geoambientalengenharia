/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Parametro;
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
public class ParametroDAO {
    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ParametroDAO() {
        this(null);
    }

    @Inject
    public ParametroDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Parametro parametro) {
        getSession().refresh(parametro);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Parametro parametro) {
        if(parametro.getIdParametro() == null)
            manager.persist(parametro);
        else
            manager.merge(parametro);
    }
    
    public void delete(Parametro parametro) {
        manager.remove(parametro);
    }

    public List<Parametro> listAll() {
        return manager.createQuery("select param from Parametro param", Parametro.class).getResultList();
    }

    public Parametro findById(Long id) {
        return manager.find(Parametro.class, id);
    }
    
    public boolean isEmpty() {
        Long count = 0L;
        count = manager.createQuery("select count(param) from Parametro param", Long.class).getSingleResult();
        return count == 0;
    }
}
