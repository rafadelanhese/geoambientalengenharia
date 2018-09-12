/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.PessoaFisica;
import br.com.geoambientalengenharia.Model.Telefone;
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
public class PessoaFisicaDAO {

    private EntityManager manager;
    private TelefoneDAO telefoneDao;

    /**
     * @deprecated CDI eyes only
     */
    public PessoaFisicaDAO() {
        this(null, null);
    }

    @Inject
    public PessoaFisicaDAO(EntityManager manager, TelefoneDAO telefoneDao) {
        this.manager = manager;
        this.telefoneDao = telefoneDao;
    }

    public void refresh(PessoaFisica pessoaFisica) {
        getSession().refresh(pessoaFisica);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(PessoaFisica pessoaFisica) {
        if (pessoaFisica.getIdPessoa() == null) {
            manager.persist(pessoaFisica);
        } else {
            manager.merge(pessoaFisica);
        }
    }

    public void delete(PessoaFisica pessoaFisica) {
        manager.remove(pessoaFisica);
    }

    public List<PessoaFisica> listAll() {
        return manager.createQuery("select p from PessoaFisica p order by p.nome", PessoaFisica.class).getResultList();
    }

    public PessoaFisica findById(Long id) {
        return manager.find(PessoaFisica.class, id);
    }
}
