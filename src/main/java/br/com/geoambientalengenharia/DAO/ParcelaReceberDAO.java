/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.ParcelaReceber;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class ParcelaReceberDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ParcelaReceberDAO() {
        this(null);
    }

    @Inject
    public ParcelaReceberDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(ParcelaReceber parcelaReceber) {
        getSession().refresh(parcelaReceber);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(ParcelaReceber parcelaReceber) {
        if (parcelaReceber.getIdParcelaReceber() == null) {
            manager.persist(parcelaReceber);
        } else {
            manager.merge(parcelaReceber);
        }
    }

    public void delete(ParcelaReceber parcelaReceber) {
        manager.remove(parcelaReceber);
    }
    
    public void exclui(Long idParcelaReceber) {
        getSession().createQuery("delete ParcelaReceber pr where pr.idParcelaReceber = :idParcelaReceber")
                .setParameter("idParcelaReceber", idParcelaReceber)
                .executeUpdate();
    }

    public List<ParcelaReceber> listAll() {
        return manager.createQuery("select pr from ParcelaReceber pr", ParcelaReceber.class).getResultList();
    }

    public List<ParcelaReceber> listParcelasRecebidasMesAtual() {
        return manager.createQuery("select pr from ParcelaReceber pr where pr.valorRecebido = NOT NULL and "
                + "MONTH(pr.dataRecebido) = :mes and "
                + "YEAR(pr.dataRecebido) = :ano ", ParcelaReceber.class).setParameter("mes", LocalDate.now().getMonthOfYear()).setParameter("ano", LocalDate.now().getYear()).getResultList();
    }

    public List<ParcelaReceber> listaParcelasPorUsuarioLogado(Long idPessoa) {
        return manager.createQuery("select pr from ParcelaReceber pr, ContasReceber cr, Atividade a where "
                + "a.pessoaLogada.idPessoa = :idPessoa and "
                + "a.idAtividade = cr.atividade.idAtividade and "
                + "cr.idContasReceber = pr.contasReceber.idContasReceber", ParcelaReceber.class)
                .setParameter("idPessoa", idPessoa)
                .getResultList();
    }

    public List<ParcelaReceber> listaPorData(Date dataInicio, Date dataFinal) {
        return manager.createQuery("select pr from ParcelaReceber pr where "
                + "DATE(pr.dataRecebido) BETWEEN :dataInicio AND :dataFinal "
                + "order by pr.dataRecebido", ParcelaReceber.class)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .getResultList();
    }
    
    public List<ParcelaReceber> listaPorPessoa(Long idPessoa) {
        return manager.createQuery("select pr from ParcelaReceber pr where "
                + "pr.contasReceber.atividade.pessoa.idPessoa = :idPessoa "
                + "order by pr.dataRecebido", ParcelaReceber.class)
                .setParameter("idPessoa", idPessoa)                
                .getResultList();
    }
    public ParcelaReceber findById(Long id) {
        return manager.find(ParcelaReceber.class, id);
    }

    public List<ParcelaReceber> ultimosLancamentos(Long idPessoaLogada) {
        return manager.createQuery("select pr from ParcelaReceber pr, Atividade a, ContasReceber cr where "
                + "a.pessoaLogada.idPessoa = :idPessoaLogada and "
                + "a.idAtividade = cr.atividade.idAtividade and "
                + "cr.idContasReceber = pr.contasReceber.idContasReceber", ParcelaReceber.class)
                .setParameter("idPessoaLogada", idPessoaLogada)
                .getResultList();
    }

    public BigDecimal totalRecebidoMesAtual(Long idPessoa) {
        BigDecimal total = BigDecimal.ZERO;

        total = manager.createQuery("select sum(pr.valorRecebido) from ParcelaReceber pr where "
                + "pr.contasReceber.atividade.pessoaLogada.idPessoa = :idPessoa", BigDecimal.class)
                .setParameter("idPessoa", idPessoa)
                .getSingleResult();

        return total;
    }

    public boolean podeDeletar(Long idContasReceber) {
        Long count = manager.createQuery("select count(pr) from ParcelaReceber pr where "
                + "pr.contasReceber.idContasReceber = :idContasReceber", Long.class).setParameter("idContasReceber", idContasReceber).getSingleResult();

        return count > 0;
    }
}
