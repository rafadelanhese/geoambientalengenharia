/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.TipoDespesa;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;

/**
 *
 * @author Rafael Delanhese
 */
public class TipoDespesaDAO {
     private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public TipoDespesaDAO() {
        this(null);
    }

    @Inject
    public TipoDespesaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(TipoDespesa tipodespesa) {
        getSession().refresh(tipodespesa);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(TipoDespesa tipodespesa) {
        if(tipodespesa.getIdTipoDespesa() == null)
            manager.persist(tipodespesa);
        else
            manager.merge(tipodespesa);
    }    

    public void delete(TipoDespesa tipodespesa) {
        manager.remove(tipodespesa);
    }

    public List<TipoDespesa> listAll() {
        return manager.createQuery("select tp from TipoDespesa tp", TipoDespesa.class).getResultList();
    }

    public TipoDespesa findById(Long id) {
        return manager.find(TipoDespesa.class, id);
    }
}
