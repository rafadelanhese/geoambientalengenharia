/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.geoambientalengenharia.DAO.ItemDAO;
import br.com.geoambientalengenharia.DAO.OrcamentoDAO;
import br.com.geoambientalengenharia.DAO.OrcamentoItemDAO;
import br.com.geoambientalengenharia.DAO.ParametroDAO;
import br.com.geoambientalengenharia.DAO.PessoaFisicaDAO;
import br.com.geoambientalengenharia.DAO.PessoaJuridicaDAO;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import br.com.geoambientalengenharia.DAO.TipoOrcamentoDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import br.com.geoambientalengenharia.Model.Item;
import br.com.geoambientalengenharia.Model.Orcamento;
import br.com.geoambientalengenharia.Model.OrcamentoItem;
import br.com.geoambientalengenharia.Model.Parametro;
import br.com.geoambientalengenharia.Sessao.ItensSessao;
import static com.google.common.base.Strings.isNullOrEmpty;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/orcamento")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class OrcamentoController {

    private ItensSessao itensSessao;
    private PessoaFisicaDAO pfDao;
    private PessoaJuridicaDAO pjDao;
    private OrcamentoDAO orcamentoDao;
    private OrcamentoItemDAO orcItemDao;
    private TipoOrcamentoDAO toDao;
    private SetorDAO setorDao;
    private ItemDAO itemDao;
    private ParametroDAO paramDao;
    private UsuarioLogado usuarioLogado;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public OrcamentoController() {
        this(null, null, null, null, null, null, null, null, null, null, null, null);
    }

    @Inject
    public OrcamentoController(ItensSessao itensSessao, PessoaFisicaDAO pfDao, PessoaJuridicaDAO pjDao, OrcamentoDAO orcamentoDao, OrcamentoItemDAO orcItemDao, TipoOrcamentoDAO toDao, SetorDAO setorDao, ItemDAO itemDao, ParametroDAO paramDao, UsuarioLogado usuarioLogado, Result result, Validator validation) {
        this.itensSessao = itensSessao;
        this.pfDao = pfDao;
        this.pjDao = pjDao;
        this.orcamentoDao = orcamentoDao;
        this.orcItemDao = orcItemDao;
        this.toDao = toDao;
        this.setorDao = setorDao;
        this.itemDao = itemDao;
        this.paramDao = paramDao;
        this.usuarioLogado = usuarioLogado;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path("/gerar")
    public void gerar(Orcamento orcamento) {
        if (orcamento.getIdOrcamento() != null) {
            if (orcamento.getOrcamentoItem() != null && orcamento.getOrcamentoItem().size() > 0) {
                for (OrcamentoItem orcItem : orcamento.getOrcamentoItem()) {
                    itensSessao.adiciona(orcItem);
                }
            }
        }
        result.include("orcamento", orcamento);
        result.include("tipoOrcamentoList", toDao.listAll());
        result.include("setorList", setorDao.listAll());
        result.include("itensList", itensSessao.getListItem());
    }

    @Post("/adiciona")
    public void adiciona(@NotNull @Valid Orcamento orcamento) {
        validation.addIf(orcamento.getPessoa().getIdPessoa() == null, new SimpleMessage("orcamento.pessoa.idPessoa", "Selecione um usuário"));
        validation.addIf(orcamento.getTipoOrcamento().getIdTipoOrcamento() == null, new SimpleMessage("orcamento.tipoOrcamento.idTipoOrcamento", "Selecione um tipo de orçamento"));
        if (orcamento.getDesconto() != null) {
            validation.addIf(orcamento.getDesconto().compareTo(orcamento.getTotal()) > 0, new SimpleMessage("orcamento.desconto", "Valor do desconto não pode ser maior que o Total"));
        }
        validation.onErrorRedirectTo(this).gerar(orcamento);

        if (orcamento.getIdOrcamento() == null) {
            //ACIDICIONANDO
            orcamento.setStatus(false);
        }

        if (orcamento.getDesconto() == null) {
            orcamento.setDesconto(BigDecimal.ZERO);
        }

        //EXCLUI TODOS OS ITENS DA LISTA QUANDO É EDITADO
        if (orcamento.getIdOrcamento() != null) {
            orcItemDao.deletaTodosPorIdOrcamento(orcamento.getIdOrcamento());
        }

        //RELACIONA OS ITENS DO ORCAMENTO NA SESSÃO NA ATIVIDADE
        if (itensSessao.getListItem() != null && itensSessao.getListItem().size() > 0) {
            for (OrcamentoItem orcItem : itensSessao.getListItem()) {
                orcItem.setOrcamento(orcamento);
                orcamento.adicionaItemLista(orcItem);
            }
        }

        //SALVA O ORÇEMNTO
        orcamentoDao.saveOrUpdate(orcamento);
        //FECHA A SESSÃO DA LISTA
        itensSessao.fecharSessao();

        result.redirectTo(this).lista();
    }

    @Get
    @Path("/lista")
    public void lista() {
        result.include("orcamentoList", orcamentoDao.listAll());
    }

    @Path("/visualizar/{idOrcamento}")
    public void visualizar(Long idOrcamento) {
        result.include("orcamento", orcamentoDao.findById(idOrcamento));
        result.include("parametro", paramDao.findById(1L));
        result.include("dataAtual", LocalDate.now());
    }

    @Path("/remove/{idOrcamento}")
    public void remove(Long idOrcamento) {
        orcamentoDao.delete(orcamentoDao.findById(idOrcamento));
        result.redirectTo(this).lista();
    }

    @Path("/edita/{idOrcamento}")
    public void edita(Long idOrcamento) {
        result.redirectTo(this).gerar(orcamentoDao.findById(idOrcamento));
    }

    @Path("/relatorio/{idOrcamento}")
    public void relatorio(Long idOrcamento) {
        result.include("orcamento", orcamentoDao.findById(idOrcamento));
        result.include("parametro", paramDao.findById(1L));
    }

    @Path("/statusOrcamento/{idOrcamento}/{status}")
    public void statusOrcamento(Long idOrcamento, boolean status) {
        orcamentoDao.statusOrcamento(idOrcamento, status);
        result.redirectTo(this).lista();
    }

    @Get
    @Path("/tabela")
    public void tabelaItens() {
        result.include("itensList", itensSessao.getListItem());
    }

    @Get("/buscaPessoa/{tpPessoa}")
    public void getPessoa(String tpPessoa) {
        if (tpPessoa.equals("PessoaFisica")) {
            result.use(Results.json()).withoutRoot().from(pfDao.listAll()).serialize();
        } else {
            result.use(Results.json()).withoutRoot().from(pjDao.listAll()).serialize();
        }
    }

    @Get("/buscaItem/{idSetor}")
    public void getItem(Long idSetor) {
        result.use(Results.json()).withoutRoot().from(itemDao.findItemByIdSetor(idSetor)).serialize();
    }

    @Get("/carregalista/{itemSelecionado}/{quantidade}")
    public void getItemLista(Long itemSelecionado, int quantidade) {
        //FALTA VALIDAÇÕES, VERIFICAR MENSAGENS DE VALIDAÇÕES NA VIEW
        validation.addIf(quantidade <= 0 || itemSelecionado <= 0, new SimpleMessage("quantidadeItem", "Item ou Quantidade não pode ser menor ou igual a 0")).onErrorRedirectTo(this).gerar(null);
        Item item = itemDao.findById(itemSelecionado);
        itensSessao.adiciona(new OrcamentoItem(item, quantidade, item.getValor()));
        result.redirectTo(this).tabelaItens();
    }

    @Get("/removelista/{indiceItem}")
    public void removeItemLista(int indiceItem) {
        itensSessao.remove(indiceItem);
        result.redirectTo(this).tabelaItens();
    }

    @Path("/voltalista")
    public void voltaLista() {
        /*
        MÉTODO NECESSÁRIO CASO O USUÁRIO NÃO FAÇA NADA PARA EDITAR OU PARA GERAR UM ORÇAMENTO
        A FUNÇÃO DESTE MÉTODO É FECHAR A SESSÃO DE ITENS E RETORNAR PARA A PÁGINA DE LISTA
         */
        itensSessao.fecharSessao();
        result.redirectTo(this).lista();
    }

    @Get("/atualizaitens/{posicao}/{quantidade}/{valor}")
    public void atualizaItens(int posicao, int quantidade, String valor) {
        validation.addIf(quantidade <= 0, new SimpleMessage("quantidade", "Quantidade inválida, insira um número maior que zero."));
        validation.addIf(new BigDecimal(valor).compareTo(BigDecimal.ZERO) == 0, new SimpleMessage("valor", "Valor inválido, insira um valor maior que zero"));
        itensSessao.atualiza(posicao, quantidade, new BigDecimal(valor));
        result.redirectTo(this).tabelaItens();
    }
}
