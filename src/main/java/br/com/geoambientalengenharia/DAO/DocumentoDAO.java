/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Documento;
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
public class DocumentoDAO {
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public DocumentoDAO() {
        this(null);
    }

    @Inject
    public DocumentoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Documento documento) {
        getSession().refresh(documento);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Documento documento) {
        if(documento.getIdDocumento() == null)
            manager.persist(documento);
        else
            manager.merge(documento);
    }     

    public void delete(Documento documento) {
        manager.remove(documento);
    }

    public List<Documento> listAll() {
        return manager.createQuery("select doc from Documento doc", Documento.class).getResultList();
    }        

    public Documento findById(Long id) {
        return manager.find(Documento.class, id);
    }
}
