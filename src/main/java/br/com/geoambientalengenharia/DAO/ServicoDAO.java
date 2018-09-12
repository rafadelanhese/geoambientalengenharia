/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Servico;
import java.util.Date;
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
public class ServicoDAO {
     private EntityManager manager;
  
    /**
     * @deprecated CDI eyes only
     */
    public ServicoDAO() {
        this(null);
    }

    @Inject
    public ServicoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Servico servico) {
        getSession().refresh(servico);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Servico servico) {
       if(servico.getIdAtividade() == null)
            manager.persist(servico);
        else
            manager.merge(servico);
    }

    public void delete(Servico servico) {
        manager.remove(servico);
    }

    public List<Servico> listAll() {
        return manager.createQuery("select s from Servico s", Servico.class).getResultList();
    }

    public List<Servico> listAllByAdmin(Long idPessoa) {
        return manager.createQuery("select s from Servico s "
                + "where s.pessoaLogada.idPessoa = :idPessoa", Servico.class).setParameter("idPessoa", idPessoa).getResultList();
    }
    
    public List<Servico> listaPorPessoa(Long idPessoa) {
        return manager.createQuery("select new Servico(s.idAtividade, s.dataInicio, s.dataFinal, s.status, s.pessoa, s.setor, s.endereco) from Servico s "
                + "where s.pessoa.idPessoa = :idPessoa", Servico.class)
                .setParameter("idPessoa", idPessoa)               
                .getResultList();
    }
    
    public List<Servico> listaPorData(Date dataInicio, Date dataFinal) {
        return manager.createQuery("select new Servico(s.idAtividade, s.dataInicio, s.dataFinal, s.status, s.pessoa, s.setor, s.endereco) from Servico s "
                + "where DATE(s.dataInicio) BETWEEN :dataInicio AND :dataFinal", Servico.class)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .getResultList();
    }
    
    public List<Servico> listaPorCidade(Long idCidade) {
        return manager.createQuery("select new Servico(s.idAtividade, s.dataInicio, s.dataFinal, s.status, s.pessoa, s.setor, s.endereco) from Servico s "
                + "where s.endereco.cidade.idCidade = :idCidade", Servico.class)
                .setParameter("idCidade", idCidade)
                .getResultList();
    }
    
    public List<Servico> listaTodosCliente(Long idPessoa) {
        return manager.createQuery("select new Servico(s.idAtividade, s.dataInicio, s.dataFinal, s.status, s.pessoa, s.setor, s.endereco) from Servico s "
                + "where s.pessoa.idPessoa = :idPessoa", Servico.class)
                .setParameter("idPessoa", idPessoa)               
                .getResultList();
    }
    
    public Servico findById(Long id) {
        return manager.find(Servico.class, id);
    }
}
