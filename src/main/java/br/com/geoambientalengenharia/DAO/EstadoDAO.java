/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Estado;
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
public class EstadoDAO {
    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public EstadoDAO() {
        this(null);
    }

    @Inject
    public EstadoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Estado estado) {
        getSession().refresh(estado);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Estado estado) {
        if(estado.getIdEstado() == null)
            manager.persist(estado);
        else
            manager.merge(estado);
    }      

    public void delete(Estado estado) {
        manager.remove(estado);
    }

    public List<Estado> listAll() {
        return manager.createQuery("select est from Estado est order by est.nome", Estado.class).getResultList();
    }

    public Estado findById(Long id) {
        return manager.find(Estado.class, id);
    }
    
    public Estado findByUF(String ufEstado) {
        return manager.createQuery("select est from Estado est where "
                + "est.sigla = :ufEstado", Estado.class).setParameter("ufEstado", ufEstado).getSingleResult();
    }
}
