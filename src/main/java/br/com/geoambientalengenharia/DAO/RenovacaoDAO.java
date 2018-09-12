/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Renovacao;
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
public class RenovacaoDAO {
    
    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public RenovacaoDAO() {
        this(null);
    }

    @Inject
    public RenovacaoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Renovacao renovacao) {
        getSession().refresh(renovacao);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Renovacao renovacao) {
        if(renovacao.getIdRenovacao() == null)
            manager.persist(renovacao);
        else
            manager.merge(renovacao);
    }
      
    public void delete(Renovacao renovacao) {
        manager.remove(renovacao);
    }

    public List<Renovacao> listAll() {
        return manager.createQuery("select r from Renovacao r", Renovacao.class).getResultList();
    }
    
    public List<Renovacao> listAllByAtividade(Long idAtividade) {
        return manager.createQuery("select r from Renovacao r "
                + "where r.idAtividade = :idAtividade", Renovacao.class).setParameter("idAtividade", idAtividade).getResultList();
    }

    public Renovacao findById(Long id) {
        return manager.find(Renovacao.class, id);
    }
}
