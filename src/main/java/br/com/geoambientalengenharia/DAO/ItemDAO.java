/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Item;
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
public class ItemDAO {
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ItemDAO() {
        this(null);
    }

    @Inject
    public ItemDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Item item) {
        getSession().refresh(item);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Item item) {
        if(item.getIdItem() == null)
            manager.persist(item);
        else
            manager.merge(item);
    }

    public void delete(Item item) {
        manager.remove(item);
    }

    public List<Item> listAll() {
        return manager.createQuery("select i from Item i order by i.descricao", Item.class).getResultList();
    }

    public List<Item> findItemByIdSetor(Long id) {
        return manager.createQuery("select i from Item i where i.setor.idSetor = :idSetor", Item.class).setParameter("idSetor", id).getResultList();
    }
    
    public Item findById(Long id) {
        return manager.find(Item.class, id);
    }
}
