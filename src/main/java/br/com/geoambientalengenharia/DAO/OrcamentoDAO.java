/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Orcamento;
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
public class OrcamentoDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public OrcamentoDAO() {
        this(null);
    }

    @Inject
    public OrcamentoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Orcamento orcamento) {
        getSession().refresh(orcamento);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Orcamento orcamento) {
        if (orcamento.getIdOrcamento() == null) {
            manager.persist(orcamento);
        } else {
            manager.merge(orcamento);
        }
    }

    public void delete(Orcamento orcamento) {
        manager.remove(orcamento);
    }

    public List<Orcamento> listAll() {
        return manager.createQuery("SELECT new Orcamento(o.idOrcamento, o.dataorc, o.status, o.total, o.desconto, o.tipoOrcamento, o.pessoa) FROM Orcamento o", Orcamento.class).getResultList();
    }
    
    public List<Orcamento> listByPessoaAprovado(Long idPessoa) {
        return manager.createQuery("SELECT new Orcamento(o.idOrcamento, o.dataorc, o.status, o.total, o.desconto, o.tipoOrcamento, o.pessoa) FROM Orcamento o "
                + "where o.pessoa.idPessoa = :idPessoa and "
                + "o.status = :aprovado", Orcamento.class).setParameter("idPessoa", idPessoa).setParameter("aprovado", true).getResultList();
    }
    
    public List<Orcamento> listaPorPessoa(Long idPessoa) {
        return manager.createQuery("select new Orcamento(o.idOrcamento, o.dataorc, o.status, o.total, o.desconto, o.tipoOrcamento, o.pessoa) from Orcamento o "
                + "where o.pessoa.idPessoa = :idPessoa", Orcamento.class)
                .setParameter("idPessoa", idPessoa)               
                .getResultList();
    }
   
    public List<Orcamento> listaPorData(Date dataInicio, Date dataFinal) {
        return manager.createQuery("select new Orcamento(o.idOrcamento, o.dataorc, o.status, o.total, o.desconto, o.tipoOrcamento, o.pessoa) from Orcamento o "
                + "where DATE(o.dataorc) BETWEEN :dataInicio AND :dataFinal", Orcamento.class)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .getResultList();
    }
    
    public List<Orcamento> listaPorCidade(Long idCidade) {
        return manager.createQuery("select new Orcamento(o.idOrcamento, o.dataorc, o.status, o.total, o.desconto, o.tipoOrcamento, o.pessoa) from Orcamento o "
                + "where o.pessoa.endereco.cidade.idCidade = :idCidade", Orcamento.class)
                .setParameter("idCidade", idCidade)
                .getResultList();
    }
    
    public Orcamento findByIdTeste(Long idOrcamento) {
        return manager.createQuery("SELECT new Orcamento(o.idOrcamento, o.dataorc, o.status, o.tipoOrcamento, o.pessoa) FROM Orcamento o "
                + "where o.idOrcamento = :idOrcamento", Orcamento.class).setParameter("idOrcamento", idOrcamento).getSingleResult();
    }

    public int statusOrcamento(Long idOrcamento, boolean status) {
        return manager.createQuery("update Orcamento o set o.status = :status where o.idOrcamento = :idOrcamento")
                .setParameter("idOrcamento", idOrcamento)
                .setParameter("status", status)
                .executeUpdate();
    }
    
    public Orcamento findById(Long id) {
        return manager.find(Orcamento.class, id);
    }
    
    public Orcamento findByIdReport(Long idOrcamento) {
        return manager.createQuery("SELECT new Orcamento(o.idOrcamento, o.objetivo, o.proposta, o.pessoa) FROM Orcamento o "
                + "where o.idOrcamento = :idOrcamento", Orcamento.class).setParameter("idOrcamento", idOrcamento).getSingleResult();
    }
}
