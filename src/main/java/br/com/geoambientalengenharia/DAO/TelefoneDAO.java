/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Telefone;
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
public class TelefoneDAO {
    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public TelefoneDAO() {
        this(null);
    }

    @Inject
    public TelefoneDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Telefone telefone) {
        getSession().refresh(telefone);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Telefone telefone) {
        if(telefone.getIdTelefone() == null)
            manager.persist(telefone);
        else
            manager.merge(telefone);
    }
    
    public void delete(Telefone telefone) {
        manager.remove(telefone);
    }

    public List<Telefone> listAll() {
        return manager.createQuery("select s from Telefone s order by s.descricao", Telefone.class).getResultList();
    }

    public Telefone findById(Long id) {
        return manager.find(Telefone.class, id);
    }
}
