/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Parcela;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class ParcelaDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ParcelaDAO() {
        this(null);
    }

    @Inject
    public ParcelaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Parcela parcela) {
        getSession().refresh(parcela);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Parcela parcela) {
        if (parcela.getIdParcela() == null) {
            manager.persist(parcela);
        } else {
            manager.merge(parcela);
        }
    }

    public void delete(Parcela parcela) {
        manager.remove(parcela);
    }

    public List<Parcela> listParcelasMes() {
        return manager.createQuery("select p from Parcela p where p.valorpago = NULL and "
                + "MONTH(datavencimento) = :mes and "
                + "YEAR(datavencimento) = :ano "
                + "order by p.datavencimento", Parcela.class)
                .setParameter("mes", LocalDate.now().getMonthOfYear())
                .setParameter("ano", LocalDate.now().getYear())
                .getResultList();
    }

    public List<Parcela> listParcelasAtrasadas() {
        return manager.createQuery("select p from Parcela p where p.valorpago = NULL and "
                + "datavencimento <= current_date() "
                + "order by p.datavencimento" , Parcela.class)
                .getResultList();
    }

    public List<Parcela> listParcelaByIdConta(Long idConta) {
        return manager.createQuery("select p from Parcela p where p.valorpago = NULL and "
                + "p.contasPagar.idContasPagar = :idConta "
                + "order by p.idParcela", Parcela.class).setParameter("idConta", idConta).getResultList();
    }

    public List<Parcela> listaPorData(Date dataInicio, Date dataFinal) {
        return manager.createQuery("select p from Parcela p where p.valorpago = NULL and "
                + "DATE(p.datavencimento) BETWEEN :dataInicio AND :dataFinal "
                + "order by p.datavencimento", Parcela.class)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .getResultList();
    }
    
    public List<Parcela> listaPorPessoa(Long idPessoa) {
        return manager.createQuery("select p from Parcela p where p.valorpago = NULL and "
                + "p.contasPagar.pessoa.idPessoa = :idPessoa "
                + "order by p.datavencimento", Parcela.class)
                .setParameter("idPessoa", idPessoa)                
                .getResultList();
    }
    
    public Parcela findById(Long id) {
        return manager.find(Parcela.class, id);
    }

    public List<Parcela> ultimosLancamentos() {
        return getSession().createCriteria(Parcela.class)
                .add(Restrictions.isNotNull("valorpago"))
                .addOrder(Order.desc("idParcela"))
                .setMaxResults(5)
                .list();
    }

    public BigDecimal totalPagoMesAtual() {
        BigDecimal total = BigDecimal.ZERO;
        total = (BigDecimal) getSession().createCriteria(Parcela.class)
                .add(Restrictions.isNotNull("valorpago"))
                .add(Restrictions.isNotNull("datapagamento"))
                //.add(Restrictions.sqlRestriction("datapagamento = "+LocalDate.now().getMonthOfYear()))                
                .setProjection(Projections.sum("valorpago"))
                .uniqueResult();

        return total;
    }

    public List<Parcela> listaParcelasPagas() {
        return getSession().createCriteria(Parcela.class)
        .add(Restrictions.isNotNull("valorpago"))        
        .list();
    }
    
    public void deletaTodosPorIdContasPagar(Long idContasPagar) {
        getSession().createQuery("delete Parcela parcela where parcela.contasPagar.idContasPagar = :idContasPagar")
                .setParameter("idContasPagar", idContasPagar)
                .executeUpdate();
    }
}
