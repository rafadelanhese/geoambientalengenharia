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
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import static br.com.caelum.vraptor.view.Results.logic;
import br.com.geoambientalengenharia.DAO.AtividadeDAO;
import br.com.geoambientalengenharia.DAO.AtividadeItemDAO;
import br.com.geoambientalengenharia.DAO.CidadeDAO;
import br.com.geoambientalengenharia.DAO.EstadoDAO;
import br.com.geoambientalengenharia.DAO.ItemDAO;
import br.com.geoambientalengenharia.DAO.LicencaDAO;
import br.com.geoambientalengenharia.DAO.OrcamentoDAO;
import br.com.geoambientalengenharia.DAO.PessoaFisicaDAO;
import br.com.geoambientalengenharia.DAO.PessoaJuridicaDAO;
import br.com.geoambientalengenharia.DAO.ProjetoDAO;
import br.com.geoambientalengenharia.DAO.ServicoDAO;
import br.com.geoambientalengenharia.DAO.SetorDAO;
import br.com.geoambientalengenharia.Login.AdminLogado;
import br.com.geoambientalengenharia.Login.LogadoRule;
import br.com.geoambientalengenharia.Login.UsuarioLogado;
import br.com.geoambientalengenharia.Model.Atividade;
import br.com.geoambientalengenharia.Model.AtividadeItem;
import br.com.geoambientalengenharia.Model.Cidade;
import br.com.geoambientalengenharia.Model.ContasReceber;
import br.com.geoambientalengenharia.Model.Item;
import br.com.geoambientalengenharia.Model.Licenca;
import br.com.geoambientalengenharia.Model.Orcamento;
import br.com.geoambientalengenharia.Model.Projeto;
import br.com.geoambientalengenharia.Model.Servico;
import br.com.geoambientalengenharia.Sessao.AtividadeItemSessao;
import java.math.BigDecimal;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Rafael Delanhese
 */
@Controller
@Path("/atividade")
@CustomBrutauthRules({LogadoRule.class, AdminLogado.class})
public class AtividadeController {

    private PessoaFisicaDAO pfDao;
    private PessoaJuridicaDAO pjDao;
    private CidadeDAO cidadeDao;
    private EstadoDAO estadoDao;
    private SetorDAO setorDao;
    private ProjetoDAO projetoDao;
    private ServicoDAO servicoDao;
    private LicencaDAO licencaDao;
    private AtividadeDAO atividadeDao;
    private OrcamentoDAO orcamentoDao;
    private ItemDAO itemDao;
    private AtividadeItemDAO atividadeItemDao;
    private Item item;
    private AtividadeItemSessao aiSessao;
    private UsuarioLogado usuarioLogado;
    private Result result;
    private final Validator validation;

    /**
     * @deprecated CDI eyes only
     */
    public AtividadeController() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    @Inject
    public AtividadeController(PessoaFisicaDAO pfDao, PessoaJuridicaDAO pjDao, CidadeDAO cidadeDao, EstadoDAO estadoDao, SetorDAO setorDao, ProjetoDAO projetoDao, ServicoDAO servicoDao, LicencaDAO licencaDao, AtividadeDAO atividadeDao, OrcamentoDAO orcamentoDao, ItemDAO itemDao, AtividadeItemDAO atividadeItemDao, Item item, AtividadeItemSessao aiSessao, UsuarioLogado usuarioLogado, Result result, Validator validation) {
        this.pfDao = pfDao;
        this.pjDao = pjDao;
        this.cidadeDao = cidadeDao;
        this.estadoDao = estadoDao;
        this.setorDao = setorDao;
        this.projetoDao = projetoDao;
        this.servicoDao = servicoDao;
        this.licencaDao = licencaDao;
        this.atividadeDao = atividadeDao;
        this.orcamentoDao = orcamentoDao;
        this.itemDao = itemDao;
        this.atividadeItemDao = atividadeItemDao;
        this.item = item;
        this.aiSessao = aiSessao;
        this.usuarioLogado = usuarioLogado;
        this.result = result;
        this.validation = validation;
    }

    @Get
    @Path(value = "/cadastro")
    public void cadastro(Atividade atividade) {
        if (atividade.getIdAtividade() != null) {
            if (atividade.getAtividadeItem() != null && atividade.getAtividadeItem().size() > 0) {
                for (AtividadeItem atividadeItem : atividade.getAtividadeItem()) {
                    aiSessao.adiciona(atividadeItem);
                }
            }
            if (atividade.getClass() == Projeto.class) {
                projetoDao.refresh((Projeto) atividade);
                result.include("projeto", atividade);
            } else if (atividade.getClass() == Servico.class) {
                servicoDao.refresh((Servico) atividade);
                result.include("servico", atividade);
            } else if (atividade.getClass() == Licenca.class) {
                licencaDao.refresh((Licenca) atividade);
                result.include("licenca", atividade);
            }
        }
        result.include("atividade", atividade);
        result.include("setorList", setorDao.listAll());
        result.include("estadoList", estadoDao.listAll());
    }

    @Post("/adiciona")
    public void adiciona(@NotNull @Valid Atividade atividade) {
        validation.addIf(atividade.getOrcamento().getIdOrcamento() == null, new SimpleMessage("atividade.orcamento.idOrcamento", "Selecione um orcamento"));
        validation.addIf(atividade.getPessoa().getIdPessoa() == null, new SimpleMessage("atividade.pessoa.idPessoa", "Selecione um cliente"));
        validation.addIf(atividade.getSetor().getIdSetor() == null, new SimpleMessage("atividade.setor.idSetor", "Selecione um setor"));
        validation.addIf(atividade.getClass() != Projeto.class && atividade.getClass() != Licenca.class && atividade.getClass() != Servico.class, new SimpleMessage("tipoAtividade", "Selecione um tipo de atividade"));
        validation.onErrorRedirectTo(this).cadastro(atividade);
        validation.addIf(atividade.getDataInicio().isAfter(atividade.getDataFinal()), new SimpleMessage("atividade.dataInicio", "Data Inicial não pode ser depois da Data Final"));
        validation.addIf(atividade.getDataFinal().isBefore(atividade.getDataInicio()), new SimpleMessage("atividade.dataFinal", "Data Final não pode antes da Data Inicial"));
        if (atividade.getDataPrevistaFim() != null) {
            validation.addIf(atividade.getDataPrevistaFim().isBefore(atividade.getDataInicio()), new SimpleMessage("atividade.dataPrevistaFim", "Data Prevista Fim não pode antes da Data Inicial"));
        }
        validation.onErrorRedirectTo(this).cadastro(atividade);

        atividade.setPessoaLogada(usuarioLogado.getUserLogado());

        //SETA STATUS COMO ATIVO
        atividade.setStatus(true);

        //RELACIONA A ATIVIDADE NA CONTA A RECEBER PARA PERSISTIR
        for (ContasReceber cr : atividade.getContasReceber()) {
            if (cr.getAtividade() == null) {
                cr.setAtividade(atividade);
            }
        }

        //EXCLUI TODOS OS ITENS DA LISTA QUANDO É EDITADO
        if (atividade.getIdAtividade() != null) {
            atividadeItemDao.deletaTodosPorIdAtividade(atividade.getIdAtividade());
        }
        //RELACIONA OS ITENS DA ATIVIDADE NA SESSÃO NA ATIVIDADE
        if (aiSessao.getListAI() != null && aiSessao.getListAI().size() > 0) {
            for (AtividadeItem itemSessao : aiSessao.getListAI()) {
                atividade.addItens(new AtividadeItem(atividade, itemSessao.getItem(), itemSessao.getQuantidade(), itemSessao.getValor()));
            }
        }

        if (atividade.getClass() == Licenca.class) {
            licencaDao.saveOrUpdate((Licenca) atividade);
            aiSessao.fecharSessao();
            result.redirectTo(LicencaController.class).listaAdmin();
        } else if (atividade.getClass() == Projeto.class) {
            projetoDao.saveOrUpdate((Projeto) atividade);
            aiSessao.fecharSessao();
            result.redirectTo(ProjetoController.class).listaAdmin();
        } else if (atividade.getClass() == Servico.class) {
            servicoDao.saveOrUpdate((Servico) atividade);
            aiSessao.fecharSessao();
            result.redirectTo(ServicoController.class).listaAdmin();
        }
    }

    @Path("/edita/{idAtividade}")
    public void edita(Long idAtividade) {
        result.redirectTo(this).cadastro(atividadeDao.findById(idAtividade));
    }

    @Path("/visualiza/{idAtividade}")
    public void visualiza(Long idAtividade) {
        result.use(Results.json()).withoutRoot().from(atividadeDao.findById(idAtividade)).include("endereco").include("setor").include("pessoa").serialize();
    }

    @Path("/remove/{tipoAtividade}/{idAtividade}")
    public void remove(String tipoAtividade, Long idAtividade) {
        atividadeDao.delete(atividadeDao.findById(idAtividade));
        switch (tipoAtividade) {
            case "Licenca":
                validation.onErrorRedirectTo(LicencaController.class).listaAdmin();
                result.include("mensagem", "Sua licença foi excluída com sucesso");
                result.redirectTo(LicencaController.class).listaAdmin();
                break;
            case "Projeto":
                validation.onErrorRedirectTo(ProjetoController.class).listaAdmin();
                result.include("mensagem", "Seu projeto foi excluído com sucesso");
                result.redirectTo(ProjetoController.class).listaAdmin();
                break;
            case "Servico":
                validation.onErrorRedirectTo(ServicoController.class).listaAdmin();
                result.include("mensagem", "Seu serviço foi excluído com sucesso");
                result.redirectTo(ProjetoController.class).listaAdmin();
                break;
            default:
                result.redirectTo(PainelControleController.class).index();
                break;
        }
    }

    @Path("/statusAtividade/{tipoAtividade}/{idAtividade}/{status}")
    public void statusAtividade(String tipoAtividade, Long idAtividade, boolean status) {
        atividadeDao.statusAtividade(idAtividade, status);

        switch (tipoAtividade) {
            case "Licenca":
                result.include("mensagem", "Sua licença foi atualizada com sucesso");
                result.redirectTo(LicencaController.class).listaAdmin();
                break;
            case "Projeto":
                result.include("mensagem", "Seu projeto foi atualizado com sucesso");
                result.redirectTo(ProjetoController.class).listaAdmin();
                break;
            case "Servico":
                result.include("mensagem", "Seu serviço foi atualizado com sucesso");
                result.redirectTo(ServicoController.class).listaAdmin();
                break;
            default:
                result.redirectTo(PainelControleController.class).index();
                break;
        }
    }

    @Get("/tabela")
    public void tabelaItens() {
        result.include("itensList", aiSessao.getListAI());
    }

    @Get("/buscaCidades/{idEstado}")
    public void buscaCidades(Long idEstado) {
        List<Cidade> cidades = cidadeDao.cidadeByEstado(idEstado);
        result.use(Results.json()).withoutRoot().from(cidades).serialize();
    }

    @Get("/buscaCidadePorNome/{nomeCidade}")
    public void buscaCidadePorNome(String nomeCidade) {
        result.use(Results.json()).withoutRoot().from(cidadeDao.cidadeByNome(nomeCidade)).include("estado").serialize();
    }

    @Get("/buscaPessoa/{tpPessoa}")
    public void buscaPessoa(String tpPessoa) {
        if (tpPessoa.equals("PessoaFisica")) {
            result.use(Results.json()).withoutRoot().from(pfDao.listAll()).serialize();
        } else {
            result.use(Results.json()).withoutRoot().from(pjDao.listAll()).serialize();
        }
    }

    @Get("/buscaOrcamento/{idPessoa}")
    public void buscaOrcamento(Long idPessoa) {
        result.use(Results.json()).withoutRoot().from(orcamentoDao.listByPessoaAprovado(idPessoa)).include("pessoa").serialize();
    }

    @Path("/voltalista")
    public void voltaLista() {
        /*
        MÉTODO NECESSÁRIO CASO O USUÁRIO NÃO FAÇA NADA PARA EDITAR OU PARA GERAR UM ORÇAMENTO
        A FUNÇÃO DESTE MÉTODO É FECHAR A SESSÃO DE ITENS E RETORNAR PARA A PÁGINA DE LISTA
         */
        aiSessao.fecharSessao();
        result.redirectTo(PainelControleController.class).index();
    }

    @Get("/carregaItensSessao/{idOrcamento}")
    public void carregaItensSessao(Long idOrcamento) {
        validation.addIf(idOrcamento == null, new SimpleMessage("Orcamento", "Nenhum orçamento foi selecionado"));
        Orcamento orcamento = orcamentoDao.findById(idOrcamento);
        for (int i = 0; i < orcamento.getOrcamentoItem().size(); i++) {
            aiSessao.adiciona(new AtividadeItem(orcamento.getOrcamentoItem().get(i).getItem(), orcamento.getOrcamentoItem().get(i).getQuantidade(), orcamento.getOrcamentoItem().get(i).getValor()));
        }
        result.redirectTo(this).tabelaItens();
    }

    @Path("/removelista/{indiceItem}")
    public void removeItemLista(int indiceItem) {
        aiSessao.remove(indiceItem);
        result.redirectTo(this).tabelaItens();
    }

    @Get("/buscaItem/{idSetor}")
    public void getItem(Long idSetor) {
        result.use(Results.json()).withoutRoot().from(itemDao.findItemByIdSetor(idSetor)).serialize();
    }

    @Get("/carregalista/{itemSelecionado}/{quantidade}")
    public void addItemLista(Long itemSelecionado, int quantidade) {
        //VALIDAÇÕES SÃO FEITAS NA VIEW        
        item = itemDao.findById(itemSelecionado);
        aiSessao.adiciona(new AtividadeItem(item, quantidade, item.getValor()));
        result.redirectTo(this).tabelaItens();
    }

    @Get("/atualizaitens/{posicao}/{quantidade}/{valor}")
    public void atualizaItens(int posicao, int quantidade, String valor) {
        validation.addIf(quantidade <= 0, new SimpleMessage("atividade.atividadeItem", "Quantidade inválida, insira um número maior que zero."));
        validation.addIf(new BigDecimal(valor).compareTo(BigDecimal.ZERO) == 0, new SimpleMessage("atividade.atividadeItem", "Valor inválido, insira um valor maior que zero"));
        aiSessao.atualiza(posicao, quantidade, new BigDecimal(valor));
        result.redirectTo(this).tabelaItens();
    }
}
