/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.ContasPagar;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.joda.time.LocalDate;


/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class ContasPagarDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ContasPagarDAO() {
        this(null);
    }

    @Inject
    public ContasPagarDAO(EntityManager manager) {
        this.manager = manager;      
    }

    public void refresh(ContasPagar cp) {
        getSession().refresh(cp);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(ContasPagar cp) {
        if (cp.getIdContasPagar() == null) {
            manager.persist(cp);
        } else {
            manager.merge(cp);
        }
    }

    public void delete(ContasPagar cp) {
        manager.remove(cp);
    }

    public List<ContasPagar> listAll() {
        return manager.createQuery("select cp from ContasPagar cp order by cp.datalancamento desc", ContasPagar.class).getResultList();
    }

    public ContasPagar findById(Long id) {
        return manager.find(ContasPagar.class, id);
    }
}
