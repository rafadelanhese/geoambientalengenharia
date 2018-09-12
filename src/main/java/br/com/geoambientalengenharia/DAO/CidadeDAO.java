/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Cidade;
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
public class CidadeDAO {
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public CidadeDAO() {
        this(null);
    }

    @Inject
    public CidadeDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Cidade cidade) {
        getSession().refresh(cidade);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Cidade cidade) {
        if(cidade.getIdCidade() == null)
            manager.persist(cidade);
        else
            manager.merge(cidade);
    }    

    public void delete(Cidade cidade) {
        manager.remove(cidade);
    }

    public List<Cidade> listAll() {
        return manager.createQuery("select c from Cidade c order by c.nome", Cidade.class).getResultList();
    }

    public Cidade findById(Long id) {
        return manager.find(Cidade.class, id);
    }
    
    public List<Cidade> cidadeByEstado(Long idEstado) {
        return manager.createQuery("select c from Cidade c where c.estado.idEstado = :idEstado order by c.nome").setParameter("idEstado", idEstado).getResultList();
    }
    
    public Cidade cidadeByNome(String nomeCidade) {
        return manager.createQuery("select c from Cidade c where c.nome = :nomeCidade", Cidade.class)
                .setParameter("nomeCidade", nomeCidade)
                .getSingleResult();
    }
}
