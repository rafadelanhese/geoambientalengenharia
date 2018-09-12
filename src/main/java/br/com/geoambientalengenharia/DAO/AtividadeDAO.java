/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Atividade;
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
public class AtividadeDAO {
    private EntityManager manager;
    /**
     * @deprecated CDI eyes only
     */
    public AtividadeDAO() {
        this(null);
    }

    @Inject
    public AtividadeDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Atividade atividade) {
        getSession().refresh(atividade);
    }
    
    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Atividade atividade) {
        if(atividade.getIdAtividade() == null)
            manager.persist(atividade);
        else
            manager.merge(atividade);
    }
    
    public void delete(Atividade atividade) {
        manager.remove(atividade);
    }

    public List<Atividade> listAll() {
        return manager.createQuery("select a from Atividade a order by a.descricao", Atividade.class).getResultList();
    }

    public List<Atividade> listAtividadeByPessoa(Long idPessoa) {
        return manager.createQuery("select new Atividade(atividade.idAtividade, atividade.descricao, atividade.status, atividade.pessoa) from Atividade atividade "
                + "where atividade.pessoa.idPessoa = :idPessoa", Atividade.class).setParameter("idPessoa", idPessoa).getResultList();
    }
    
    public int statusAtividade(Long idAtividade, boolean status) {
        return manager.createQuery("update Atividade a set a.status = :status where a.idAtividade = :idAtividade")
                .setParameter("idAtividade", idAtividade)
                .setParameter("status", status)
                .executeUpdate();
    }
    
    public Atividade findById(Long id) {
        return manager.find(Atividade.class, id);
    }       
}
