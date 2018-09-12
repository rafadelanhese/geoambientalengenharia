/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.PessoaJuridica;
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
public class PessoaJuridicaDAO {

    private EntityManager manager;    

    /**
     * @deprecated CDI eyes only
     */
    public PessoaJuridicaDAO() {
        this(null);
    }

    @Inject   
    public PessoaJuridicaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(PessoaJuridica pessoaJuridica) {
        getSession().refresh(pessoaJuridica);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(PessoaJuridica pessoaJuridica) {
        if (pessoaJuridica.getIdPessoa() == null) {
            manager.persist(pessoaJuridica);
        } else {
            manager.merge(pessoaJuridica);
        }
    }
  
    public void delete(PessoaJuridica pessoaJuridica) {
        manager.remove(pessoaJuridica);
    }

    public List<PessoaJuridica> listAll() {
        return manager.createQuery("select p from PessoaJuridica p order by p.nome", PessoaJuridica.class).getResultList();
    }

    public PessoaJuridica findById(Long id) {
        return manager.find(PessoaJuridica.class, id);
    }
}
