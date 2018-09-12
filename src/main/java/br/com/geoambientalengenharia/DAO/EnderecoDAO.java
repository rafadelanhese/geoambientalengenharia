/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Endereco;
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
public class EnderecoDAO {
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public EnderecoDAO() {
        this(null);
    }

    @Inject
    public EnderecoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Endereco endereco) {
        getSession().refresh(endereco);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Endereco endereco) {
        if(endereco.getIdEndereco() == null)
            manager.persist(endereco);
        else
            manager.merge(endereco);
    }

    public void delete(Endereco endereco) {
        manager.remove(endereco);
    }

    public List<Endereco> listAll() {
        return manager.createQuery("select s from Endereco s order by s.descricao", Endereco.class).getResultList();
    }

    public Endereco findById(Long id) {
        return manager.find(Endereco.class, id);
    }
}
