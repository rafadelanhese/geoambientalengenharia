package br.com.geoambientalengenharia.Initialize;

import br.com.caelum.vraptor.events.VRaptorInitialized;
import br.com.geoambientalengenharia.Controller.PessoaController;
import br.com.geoambientalengenharia.Model.Cidade;
import br.com.geoambientalengenharia.Model.Endereco;
import br.com.geoambientalengenharia.Model.Estado;
import br.com.geoambientalengenharia.Model.PessoaJuridica;
import br.com.geoambientalengenharia.Model.Setor;
import br.com.geoambientalengenharia.Model.Telefone;
import br.com.geoambientalengenharia.Model.TipoUsuario;
import br.com.geoambientalengenharia.Utils.SafePass;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.Dependent;
import javax.enterprise.event.Observes;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Rafael Delanhese
 */
@Dependent
public class Initialize {

    private EntityManagerFactory factory;
    private EntityManager manager;

    @Inject
    public Initialize(EntityManagerFactory factory) {
        this.factory = factory;
        this.manager = this.factory.createEntityManager();
    }

    public void insert(@Observes VRaptorInitialized event) {
        System.out.println("E-AMBIENTAL INICIADO COM SUCESSO");
        if (!existePessoaCadastrada()) {
            System.out.println("INICIANDO CADASTRO PADRÃO DO SISTEMA");
            cadastraSetores();
            cadastraTipoUsuario();
            cadastraEstados();
            cadastraCidade();
            cadastraUsuarioInicial();
        }

        if (manager != null && manager.isOpen()) {
            manager.close();
        }
    }

    public boolean existePessoaCadastrada() {
        Long count = 0L;
        count = manager.createQuery("select count(p) from Pessoa p", Long.class).getSingleResult();
        return count > 0;
    }

    public void cadastraSetores() {
        try {
            manager.getTransaction().begin();

            manager.persist(new Setor("Engenharia Ambiental"));
            manager.persist(new Setor("Engenharia Civil"));
            manager.persist(new Setor("Arquitetura"));
            manager.persist(new Setor("Topografia"));

            manager.getTransaction().commit();
        } finally {
            manager.clear();
        }
    }

    public void cadastraTipoUsuario() {
        try {
            manager.getTransaction().begin();

            manager.persist(new TipoUsuario("Administrador"));
            manager.persist(new TipoUsuario("Cliente"));
            manager.persist(new TipoUsuario("Funcionário"));

            manager.getTransaction().commit();
        } finally {
            manager.clear();
        }
    }

    public void cadastraEstados() {

        try {
            manager.getTransaction().begin();

            Estado estados = new Estado();

            for (Estado est : estados.listaEstados()) {
                manager.persist(est);
            }

            manager.getTransaction().commit();
        } finally {
            manager.clear();
        }
    }

    public void cadastraCidade() {

        try {
            manager.getTransaction().begin();
            manager.persist(new Cidade(3541406L, "Presidente Prudente", new Estado(35L)));
            manager.getTransaction().commit();
        } finally {
            manager.clear();
        }
    }

    public void cadastraUsuarioInicial() {

        try {
            manager.getTransaction().begin();

            PessoaJuridica pj = new PessoaJuridica();
            List<Telefone> telefone = new ArrayList<>();            

            pj.setNome("Geoambiental Engenharia");
            pj.setEmail("contato@geoambientalengenharia.com.br");
            pj.setSenha(SafePass.crypPass("x8p0Em!A#MqJ"));
            pj.setCnpj("23.171.833/0001-10");
            pj.setEndereco(new Endereco("Rua João Gonçalves Foz", "1969", "Jardim Marupiara", null, "19015-480", new Cidade(3541406L)));
            pj.setSetor(new Setor(1L));
            pj.setTipousuario(new TipoUsuario(1L));
            telefone.add(new Telefone("(18) 3203-3759", "Escritório", pj));
            pj.setTelefone(telefone);

            manager.persist(pj);
            manager.getTransaction().commit();
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            Logger.getLogger(PessoaController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            manager.clear();
        }
    }
}
