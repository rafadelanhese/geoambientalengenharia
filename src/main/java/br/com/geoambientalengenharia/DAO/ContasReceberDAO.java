/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.ContasReceber;
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
public class ContasReceberDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ContasReceberDAO() {
        this(null);
    }

    @Inject
    public ContasReceberDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(ContasReceber contasReceber) {
        getSession().refresh(contasReceber);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(ContasReceber contasReceber) {
        if (contasReceber.getIdContasReceber() == null) {
            manager.persist(contasReceber);
        } else {
            manager.merge(contasReceber);
        }
    }

    public void delete(ContasReceber contasReceber) {        
        manager.remove(contasReceber);
    }
   
    public void exclui(Long idContaReceber) {
        getSession().createQuery("delete ContasReceber cr where cr.idContasReceber = :idContaReceber")
                .setParameter("idContaReceber", idContaReceber)
                .executeUpdate();
    }
    
    public List<ContasReceber> listAll() {
        return manager.createQuery("select contasReceber from ContasReceber contasReceber", ContasReceber.class).getResultList();
    }

    public ContasReceber findById(Long id) {
        return manager.find(ContasReceber.class, id);
    }

    public ContasReceber findByIdAtividade(Long id) {
        return manager.createQuery("select contasReceber from ContasReceber contasReceber where "
                + "contasReceber.atividade.idAtividade = :idAtividade", ContasReceber.class).setParameter("idAtividade", id).getSingleResult();
    }

    public List<ContasReceber> listFindByIdAtividade(Long id) {
        return manager.createQuery("select contasReceber from ContasReceber contasReceber where "
                + "contasReceber.atividade.idAtividade = :idAtividade", ContasReceber.class).setParameter("idAtividade", id).getResultList();
    }
    
    public List<ContasReceber> listaContasPorUsuarioLogado(Long idPessoa) {
        return manager.createQuery("select cr from ContasReceber cr, Atividade a where "
                + "a.pessoaLogada.idPessoa = :idPessoa and "
                + "a.idAtividade = cr.atividade.idAtividade", ContasReceber.class)
                .setParameter("idPessoa", idPessoa)                
                .getResultList();
    }

    public boolean validaExclusao(Long idContasReceber) {
        Long count = manager.createQuery("select count(pr) from ParcelaReceber pr where "
                + "pr.contasReceber.idContasReceber = :idContasReceber", Long.class).setParameter("idContasReceber", idContasReceber).getSingleResult();

        return count > 0;
    }
}
