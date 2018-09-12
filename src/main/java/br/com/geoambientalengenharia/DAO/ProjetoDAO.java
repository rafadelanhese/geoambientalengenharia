/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Projeto;
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
public class ProjetoDAO {

    private EntityManager manager;

    /**
     * @deprecated CDI eyes only
     */
    public ProjetoDAO() {
        this(null);
    }

    @Inject
    public ProjetoDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Projeto projeto) {
        getSession().refresh(projeto);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Projeto projeto) {
        if (projeto.getIdAtividade() == null) {
            manager.persist(projeto);
        } else {
            manager.merge(projeto);
        }
    }

    public void delete(Projeto projeto) {
        manager.remove(projeto);
    }

    public List<Projeto> listAll() {
        return manager.createQuery("select p from Projeto p", Projeto.class).getResultList();
    }

    public List<Projeto> listAllByAdmin(Long idPessoa) {
        return manager.createQuery("select new Projeto(p.art, p.areaTotal, p.areaTerreno, p.referenciaCadastral, p.cadastroAnterior, p.zoneamento, p.numeroMatricula, p.loteQuadra, p.idAtividade, p.dataInicio, p.dataFinal, p.status, p.pessoa) from Projeto p "
                + "where p.pessoaLogada.idPessoa = :idPessoa", Projeto.class).setParameter("idPessoa", idPessoa).getResultList();
    }

    public List<Projeto> listaPorPessoa(Long idPessoa) {
        return manager.createQuery("select new Projeto(p.idAtividade, p.dataInicio, p.dataFinal, p.status, p.pessoa, p.setor, p.endereco) from Projeto p "
                + "where p.pessoa.idPessoa = :idPessoa", Projeto.class)
                .setParameter("idPessoa", idPessoa)
                .getResultList();
    }

    public List<Projeto> listaPorData(Date dataInicio, Date dataFinal) {
        return manager.createQuery("select new Projeto(p.idAtividade, p.dataInicio, p.dataFinal, p.status, p.pessoa, p.setor, p.endereco) from Projeto p "
                + "where DATE(p.dataInicio) BETWEEN :dataInicio AND :dataFinal", Projeto.class)
                .setParameter("dataInicio", dataInicio)
                .setParameter("dataFinal", dataFinal)
                .getResultList();
    }

    public List<Projeto> listaPorCidade(Long idCidade) {
        return manager.createQuery("select new Projeto(p.idAtividade, p.dataInicio, p.dataFinal, p.status, p.pessoa, p.setor, p.endereco) from Projeto p "
                + "where p.endereco.cidade.idCidade = :idCidade", Projeto.class)
                .setParameter("idCidade", idCidade)
                .getResultList();
    }

    public List<Projeto> listaTodosCliente(Long idPessoa) {
        return manager.createQuery("select new Projeto(p.art, p.areaTotal, p.areaTerreno, p.referenciaCadastral, p.cadastroAnterior, p.zoneamento, p.numeroMatricula, p.loteQuadra, p.idAtividade, p.dataInicio, p.dataFinal, p.status, p.pessoa) from Projeto p "
                + "where p.pessoa.idPessoa = :idPessoa", Projeto.class)
                .setParameter("idPessoa", idPessoa)
                .getResultList();
    }
    
    public Projeto findById(Long id) {
        return manager.find(Projeto.class, id);
    }
}
