/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.DAO;

import br.com.geoambientalengenharia.Model.Atividade;
import br.com.geoambientalengenharia.Model.Pessoa;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.RollbackException;
import org.hibernate.Session;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class PessoaDAO {

    private EntityManager manager;    
    /**
     * @deprecated CDI eyes only
     */
    public PessoaDAO() {
        this(null);
    }

    @Inject 
    public PessoaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void refresh(Pessoa pessoa) {
        getSession().refresh(pessoa);
    }

    private Session getSession() {
        return manager.unwrap(Session.class);
    }

    public void saveOrUpdate(Pessoa pessoa) {
        if (pessoa.getIdPessoa() == null) {
            manager.persist(pessoa);
        } else {
            manager.merge(pessoa);
        }
    }

    public void delete(Pessoa pessoa) {
        manager.remove(pessoa);
    }

    public List<Pessoa> listAll() {
        return manager.createQuery("select p from Pessoa p order by p.nome", Pessoa.class).getResultList();
    }
    
    public List<Pessoa> listaPorSetor(Long idSetor) {
        return manager.createQuery("select new Pessoa(p.idPessoa, p.nome, p.endereco, p.setor) from Pessoa p where p.setor.idSetor = :idSetor order by p.nome", Pessoa.class)
                .setParameter("idSetor", idSetor)
                .getResultList();
    }
    
    public List<Pessoa> listaPorCidade(Long idCidade) {
        return manager.createQuery("select new Pessoa(p.idPessoa, p.nome, p.endereco, p.setor) from Pessoa p where p.endereco.cidade.idCidade = :idCidade order by p.nome", Pessoa.class)
                .setParameter("idCidade", idCidade)
                .getResultList();
    }
    
    public List<Pessoa> listaTodos() {
        return manager.createQuery("select new Pessoa(p.idPessoa, p.nome) from Pessoa p order by p.nome", Pessoa.class)                
                .getResultList();
    }

    public Pessoa findById(Long id) {
        return manager.find(Pessoa.class, id);
    }

    public Pessoa findPessoa(Long idPessoa) {
        return manager.createQuery("select new Pessoa(p.idPessoa, p.nome) from Pessoa p where p.idPessoa = :idPessoa", Pessoa.class) 
                .setParameter("idPessoa", idPessoa)
                .getSingleResult();
    }
    
    public Pessoa login(String email) {
        return manager.createQuery("select p from Pessoa p where "
                + "p.email = :email", Pessoa.class).setParameter("email", email).getSingleResult();

    }

    public boolean contemLogin(String email) {
        Long count = manager.createQuery("select count(p) from Pessoa p where "
                + "p.email = :email", Long.class).setParameter("email", email).getSingleResult();

        return count > 0;
    }

    public String quantidadePessoas() {
        /*
        RETORNA A QUANTIDADE DE PESSOAS REGISTRADAS
         */
        Long count = 0L;
        count = manager.createQuery("select count(p) from Pessoa p", Long.class).getSingleResult();
        return String.valueOf(count);
    }
    
    public boolean removeValidar(Long idPessoa) {
        Long count = manager.createQuery("select count(a) from Atividade a where "
                + "a.pessoaLogada.idPessoa = :idPessoa or "
                + "a.pessoa.idPessoa = :idPessoa", Long.class)
                .setParameter("idPessoa", idPessoa).getSingleResult();

        return count > 0;
    }
    
    public int alteraSenha(Pessoa pessoa, String senha) {
        return manager.createQuery("update Pessoa pes set pes.senha = :senha where pes.idPessoa = :idPessoa")
                .setParameter("idPessoa", pessoa.getIdPessoa())
                .setParameter("senha", senha)
                .executeUpdate();
    }
}
