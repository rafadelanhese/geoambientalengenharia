/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.TipoUsuario;
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
public class TipoUsuarioDAO {
    
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public TipoUsuarioDAO() {
        this(null);
    }

    @Inject
    public TipoUsuarioDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(TipoUsuario tipoUsuario) {
        getSession().refresh(tipoUsuario);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(TipoUsuario tipoUsuario) {
        if(tipoUsuario.getIdTipoUsuario()== null)
            manager.persist(tipoUsuario);
        else
            manager.merge(tipoUsuario);
    }

    public void delete(TipoUsuario tipoUsuario) {
        manager.remove(tipoUsuario);
    }

    public List<TipoUsuario> listAll() {
        return manager.createQuery("select tp from TipoUsuario tp order by tp.descricao", TipoUsuario.class).getResultList();
    }

    public TipoUsuario findById(Long id) {
        return manager.find(TipoUsuario.class, id);
    }
}
