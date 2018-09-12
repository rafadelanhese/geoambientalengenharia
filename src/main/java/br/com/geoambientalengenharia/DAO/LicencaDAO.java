/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Licenca;
import br.com.geoambientalengenharia.Model.Renovacao;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.ArrayList;
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
public class LicencaDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public LicencaDAO() {
        this(null);
    }

    @Inject
    public LicencaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Licenca licenca) {
        getSession().refresh(licenca);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Licenca licenca) {
        if (licenca.getIdAtividade() == null) {
            manager.persist(licenca);
        } else {
            manager.merge(licenca);
        }
    }

    public void delete(Licenca licenca) {
        manager.remove(licenca);
    }

    public List<Licenca> listAll() {
        return manager.createQuery("select l from Licenca l", Licenca.class).getResultList();
    }

    public List<Licenca> listAllByAdmin(Long idPessoa) {
        return manager.createQuery("select l from Licenca l "
                + "where l.pessoaLogada.idPessoa = :idPessoa", Licenca.class)
                .setParameter("idPessoa", idPessoa)
                .getResultList();
    }

    public List<Licenca> listaTodosCliente(Long idPessoa) {
        return manager.createQuery("select l from Licenca l "
                + "where l.pessoa.idPessoa = :idPessoa", Licenca.class)
                .setParameter("idPessoa", idPessoa)
                .getResultList();
    }

    public List<Licenca> listaPorPessoa(Long idPessoa) {
        return manager.createQuery("select new Licenca(l.idAtividade, l.dataInicio, l.dataFinal, l.status, l.pessoa, l.setor, l.endereco) from Licenca l "
                + "where l.pessoa.idPessoa = :idPessoa", Licenca.class)
                .setParameter("idPessoa", idPessoa)
                .getResultList();
    }

    public List<Licenca> listaPorData(Date dataInicio, Date dataFinal) {
        return manager.createQuery("select new Licenca(l.idAtividade, l.dataInicio, l.dataFinal, l.status, l.pessoa, l.setor, l.endereco) from Licenca l "
                + "where DATE(l.dataInicio) BETWEEN :dataInicio AND :dataFinal", Licenca.class)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .getResultList();
    }

    public List<Licenca> listaPorCidade(Long idCidade) {
        return manager.createQuery("select new Licenca(l.idAtividade, l.dataInicio, l.dataFinal, l.status, l.pessoa, l.setor, l.endereco) from Licenca l "
                + "where l.endereco.cidade.idCidade = :idCidade", Licenca.class)
                .setParameter("idCidade", idCidade)
                .getResultList();
    }

    public void atualizaLicenca(Long idAtividade, LocalDate dataInicio, LocalDate dataFinal) {
        manager.createQuery("update Atividade a set a.dataInicio = :dataInicio, a.dataFinal = :dataFinal, a.dataPrevistaFim = :dataFinal where a.idAtividade = :idAtividade")
                .setParameter("idAtividade", idAtividade)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .executeUpdate();
    }  
    
    public List<Licenca> listaLicencaValidadeProxima() {
        return manager.createQuery("select new Licenca(l.idAtividade, l.dataInicio, l.dataFinal, l.status, l.pessoa, l.setor, l.endereco) from Licenca l where "
                + "MONTH(l.dataFinal) = :mes and "
                + "YEAR(l.dataFinal) = :ano ", Licenca.class)
                .setParameter("mes", LocalDate.now().plusMonths(4).getMonthOfYear())
                .setParameter("ano", LocalDate.now().getYear())
                .getResultList();
    }

    public Licenca findById(Long id) {
        return manager.find(Licenca.class, id);
    }
}
