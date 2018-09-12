<%-- 
    Document   : cadastro
    Created on : 19/11/2017, 22:15:53
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Gerar Atividade<small>| Painel de Atividade</small>
                </h1>                  
                <c:if test="${not empty errors}">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                        <c:forEach var="error" items="${errors}">
                            ${error.message}<br />
                        </c:forEach>
                    </div>
                </c:if> 
            </div>
            <form class="form-horizontal" action="${linkTo[AtividadeController].adiciona}" method="POST" >

                <!-- COMEÇO PASSO 1-->
                <div class="col-md-12">
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block">
                                <img class="img-circle" src="../arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="User Image">
                                <span class="username"><a href="#">ATIVIDADE</a></span>
                                <span class="description">Preencha os campos relacionados a atividade</span>
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">               
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="atividade.idAtividade" value="${atividade.idAtividade}" style="display: none"/>                           

                            <div class="form-group">
                                <label for="pessoa" class="col-sm-2 control-label">Tipo de Cliente</label>                                
                                <div class="col-sm-3" id="dOpcao">
                                    <select class="form-control" name="atividade.pessoa" id="tipoPessoa" >
                                        <option value="">Selecione uma opção</option>
                                        <option value="PessoaFisica" ${atividade.pessoa.getClass().getSimpleName() eq 'PessoaFisica' ? 'selected' : ''}>PESSOA FÍSICA</option>
                                        <option value="PessoaJuridica" ${atividade.pessoa.getClass().getSimpleName() eq 'PessoaJuridica' ? 'selected' : ''}>PESSOA JURÍDICA</option>
                                    </select>
                                    <span class="help-block" id="sOpcao" />
                                </div>

                                <label class="col-sm-1 control-label">Cliente</label>                                
                                <div class="col-sm-6">
                                    <select class="form-control" id="pessoaSelect" name="atividade.pessoa.idPessoa" disabled>

                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('atividade.pessoa.idPessoa').join(' - ')}</span>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tipo Atividade</label>                                
                                <div class="col-sm-10" id="dopcaoAtividade">
                                    <select class="form-control" name="atividade" id="opcaoAtividade">
                                        <option value="">Selecione uma opção</option>
                                        <option value="LICENCA" ${atividade.getClass().getSimpleName() eq 'Licenca' ? 'selected' : ''}>LICENÇA</option>
                                        <option value="PROJETO" ${atividade.getClass().getSimpleName() eq 'Projeto' ? 'selected' : ''}>PROJETO</option>
                                        <option value="SERVICO" ${atividade.getClass().getSimpleName() eq 'Servico' ? 'selected' : ''}>SERVIÇO</option>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('tipoAtividade').join(' - ')}</span>
                                </div>
                            </div>

                            <!--LICENÇA-->                            
                            <div class="form-group" id="licencaBloco2" style="display: none">
                                <label class="col-sm-2 control-label">Número Processo</label>                                
                                <div class="col-sm-4" id="iNPROC">
                                    <input type="text" class="form-control" name="atividade.numeroProcesso" value="${licenca.numeroProcesso}" id="numero_processo" placeholder="Número processo" maxlength="150"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.numeroProcesso')}</span>
                                </div>

                                <label class="col-sm-2 control-label">Número Licenca</label>                                
                                <div class="col-sm-4" id="iLICENCA">
                                    <input type="text" class="form-control" name="atividade.numeroLicenca" value="${licenca.numeroLicenca}" id="numero_licenca" placeholder="Número Licença" maxlength="150"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.numeroLicenca')}</span>
                                </div>
                            </div>                

                            <div class="form-group" id="licencaBloco1" style="display: none">
                                <label class="col-sm-2 control-label">Órgão</label>                                
                                <div class="col-sm-4" id="iOrgao">
                                    <input type="text" class="form-control" name="atividade.orgao" value="${licenca.orgao}" id="orgao" placeholder="Órgão" maxlength="150"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.orgao')}</span>
                                </div>

                                <label class="col-sm-2 control-label">CNAE</label>                                
                                <div class="col-sm-2" id="iCNAE">
                                    <input type="text" class="form-control" name="atividade.cnae" value="${licenca.cnae}" id="cnae" placeholder="CNAE" maxlength="10" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.cnae')}</span> 
                                </div>  
                                
                                <label class="col-sm-1 control-label">Versão</label>                                
                                <div class="col-sm-1" id="iVERSAO">
                                    <input type="text" class="form-control" name="atividade.versao" value="${licenca.versao}" id="versao" placeholder="Versão" maxlength="150"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.versao')}</span>
                                </div>                                                                                          
                            </div>

                            <div class="form-group" id="licencaBloco3" style="display: none">

                            </div>
                            <!--PROJETO-->
                            <div class="form-group" id="projetoBloco1" style="display: none">
                                <label class="col-sm-2 control-label">ART/RRT</label>                                
                                <div class="col-sm-5" id="iART">
                                    <input type="text" class="form-control" name="atividade.art" value="${projeto.art}" id="art" placeholder="ART/RRT" maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.art')}</span>                                    
                                </div>

                                <label class="col-sm-1 control-label">Área Total</label>                                
                                <div class="col-sm-4" id="iAreaTotal">
                                    <input type="text" class="form-control" name="atividade.areaTotal" value="${projeto.areaTotal}" id="AreaTotal" placeholder="Área Total"  maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.areaTotal')}</span>                                    
                                </div>
                            </div>


                            <div class="form-group" id="projetoBloco2" style="display: none">
                                <label class="col-sm-2 control-label">Área Terreno</label>                                
                                <div class="col-sm-5" id="iAreaTerreno">
                                    <input type="text" class="form-control" name="atividade.areaTerreno" value="${projeto.areaTerreno}" id="AreaTerreno" placeholder="Area Terreno"  maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.areaTerreno')}</span>                                    
                                </div>

                                <label class="col-sm-1 control-label">Ref. Cadastral</label>                                
                                <div class="col-sm-4" id="iReferenciaCadastral">
                                    <input type="text" class="form-control" name="atividade.referenciaCadastral" value="${projeto.referenciaCadastral}" id="ReferenciaCadastral" placeholder="Referência Cadastral"  maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.referenciaCadastral')}</span>                                    
                                </div>
                            </div>

                            <div class="form-group" id="projetoBloco3" style="display: none">
                                <label class="col-sm-2 control-label">Cadastro Anterior</label>                                
                                <div class="col-sm-5" id="iCadastroAnterior">
                                    <input type="text" class="form-control" name="atividade.cadastroAnterior" value="${projeto.cadastroAnterior}" id="CadastroAnterior" placeholder="Cadastro Anterior"  maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.cadastroAnterior')}</span>                                    
                                </div>

                                <label class="col-sm-1 control-label">Zoneamento</label>                                
                                <div class="col-sm-4" id="iZoneamento">
                                    <input type="text" class="form-control" name="atividade.zoneamento" value="${projeto.zoneamento}" id="Zoneamento" placeholder="Zoneamento"  maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.zoneamento')}</span>                                    
                                </div>
                            </div>                    

                            <div class="form-group" id="projetoBloco4" style="display: none">
                                <label class="col-sm-2 control-label">Número Matrícula</label>                                
                                <div class="col-sm-5" id="iNumeroMatricula">
                                    <input type="text" class="form-control" name="atividade.numeroMatricula" value="${projeto.numeroMatricula}" id="NumeroMatricula" placeholder="Número Matrícula"  maxlength="150" onkeyup="somenteNumeros(this);"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.numeroMatricula')}</span>                                    
                                </div>

                                <label class="col-sm-1 control-label">Lote/Quadra</label>                                
                                <div class="col-sm-4" id="iLoteQuadra">
                                    <input type="text" class="form-control" name="atividade.loteQuadra" value="${projeto.loteQuadra}" id="LoteQuadra" placeholder="Lote/Quadra"  maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.loteQuadra')}</span>                                    
                                </div>
                            </div>

                            <!--SERVIÇO-->

                            <div class="form-group" id="servicoBloco1" style="display: none">
                                <label class="col-sm-2 control-label">Tipo</label>                                
                                <div class="col-sm-5" id="iTipo">
                                    <input type="text" class="form-control" name="atividade.tipo" value="${servico.tipo}" id="Tipo" placeholder="Tipo" maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.tipo').join(' - ')}</span>                                    
                                </div>

                                <label class="col-sm-1 control-label">Observações</label>                                
                                <div class="col-sm-4" id="iObservacoes">
                                    <input type="text" class="form-control" name="atividade.observacoes" value="${servico.observacoes}" id="Observacoes" placeholder="Observações" maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.observacoes')}</span>                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Data Inicial</label>                                
                                <div class="col-sm-2" id="dDataInicio">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>                                        
                                        <input type="text" class="form-control pull-right" name="atividade.dataInicio" value="${atividade.dataInicio.toString("dd/MM/yyyy")}" id="datepickerInicial">
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('atividade.dataInicio')}</span>
                                </div> 

                                <label class="col-sm-1 control-label">Dt. Final</label>                                
                                <div class="col-sm-2" id="dDataFinal">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" name="atividade.dataFinal" value="${atividade.dataFinal.toString("dd/MM/yyyy")}" id="datepickerFinal">
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('atividade.dataFinal')}</span>
                                </div> 

                                <label class="col-sm-2 control-label">Data Prevista Fim</label>                                
                                <div class="col-sm-3" id="dDataFinal">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" name="atividade.dataPrevistaFim" value="${atividade.dataPrevistaFim.toString("dd/MM/yyyy")}" id="datepickerPrevistaFim" />
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('atividade.dataPrevistaFim')}</span>
                                </div> 

                            </div>                                                   

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Descrição</label>                                
                                <div class="col-sm-10" id="dDescricao">
                                    <input type="text" class="form-control" name="atividade.descricao" value="${atividade.descricao}"  placeholder="Descrição"  maxlength="150"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.descricao')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="setor" class="col-sm-2 control-label">Setor</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" name="atividade.setor">
                                        <option value="">Selecione um Setor...</option>
                                        <c:forEach items="${setorList}" var="setor">
                                            <option value="${setor.idSetor}" ${atividade.setor.idSetor eq setor.idSetor ? 'selected' : ''}>${setor.descricao}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('atividade.setor.idSetor').join(' - ')}</span>
                                </div>
                            </div>            

                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM PASSO 1 -->

                <!-- COMEÇO PASSO 2 -->
                <div class="col-md-12">
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block">               
                                <img class="img-circle" src="../arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="User Image">
                                <span class="username"><a href="#">ENDEREÇO DA OBRA</a></span>
                                <span class="description">Preencha os campos relacionados ao endereço da atividade</span>               
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">               
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="atividade.endereco.idEndereco" value="${atividade.endereco.idEndereco}" style="display: none"/>
                            <input type="text" class="form-control" name="atividade.endereco" value="endereco" style="display: none"/>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Estado</label>                                
                                <div class="col-sm-5">
                                    <select class="form-control" id="estadosSelect">
                                        <option value="">Selecione um estado...</option>
                                        <c:forEach items="${estadoList}" var="estado">
                                            <option value="${estado.idEstado}" ${atividade.endereco.cidade.estado.idEstado eq estado.idEstado ? 'selected' : ''}>${estado.nome}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.cidade.estado').join(' - ')}</span>
                                </div>

                                <!--CIDADE-->
                                <label class="col-sm-1 control-label">Cidade</label>                                
                                <div class="col-sm-4">
                                    <select class="form-control" id="cidadesSelect" name="atividade.endereco.cidade" disabled>

                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.cidade.idCidade').join(' - ')}</span>
                                </div>
                            </div>                         

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Rua</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="atividade.endereco.rua" value="${atividade.endereco.rua}" id="rua" placeholder="Rua" maxlength="100"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.rua').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">Número</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="atividade.endereco.numero" value="${atividade.endereco.numero}" placeholder="Número" onkeyup="somenteNumeros(this);" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.numero').join(' - ')}</span>
                                </div>
                            </div>                           

                            <div class="form-group">
                                <label for="bairro" class="col-sm-2 control-label">Bairro</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="atividade.endereco.bairro" value="${atividade.endereco.bairro}" placeholder="Bairro" id="bairro" maxlength="50"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.bairro').join(' - ')}</span>
                                </div>

                                <label for="cep" class="col-sm-1 control-label">CEP</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="atividade.endereco.cep" value="${atividade.endereco.cep}" placeholder="CEP" id="cep" maxlength="9" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.cep').join(' - ')}</span>
                                </div>       
                            </div>

                            <div class="form-group">
                                <label for="complemento" class="col-sm-2 control-label">Complemento</label>                                
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="atividade.endereco.complemento" value="${atividade.endereco.complemento}" id="complemento" placeholder="Complemento" maxlength="50"/>
                                    <span class="help-block" style="color: red">${errors.from('atividade.endereco.complemento').join(' - ')}</span>
                                </div>
                            </div>



                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM PASSO 2 -->


                <!-- COMEÇO PASSO 3 -->
                <div class="col-md-12" id="divOrcamento">
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block">               
                                <img class="img-circle" src="../arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="User Image">
                                <span class="username"><a href="#">ORÇAMENTO</a></span>
                                <span class="description">Selecione um orçamento e adicione um ou mais itens de serviço</span>               
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">               
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Orçamento</label>                                
                                <div class="col-sm-8">
                                    <select class="form-control" id="orcamentoSelect" name="atividade.orcamento.idOrcamento">

                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('atividade.orcamento.idOrcamento')}</span>
                                </div>

                                <div class="col-sm-2" id="divBtnImportarItens" style="display: none" >
                                    <a href="#" onclick="carregaItensSessao();" ><i class="btn btn-primary btn-flat">Importar Itens</i></a>
                                </div>
                            </div>           

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Setor</label>                                
                                <div class="col-sm-4">
                                    <select class="form-control" name="" id="setor">
                                        <option value="">Selecione um setor</option>
                                        <c:forEach items="${setorList}" var="setor">
                                            <option value="${setor.idSetor}">${setor.descricao}</option>
                                        </c:forEach>
                                    </select>                                   
                                </div>

                                <label class="col-sm-1 control-label">Item</label>                                
                                <div class="col-sm-3">
                                    <select class="form-control" id="itemSelect" name="itemSelecionado" disabled>

                                    </select>                                    
                                </div>
                                <span class="help-block">${errors.from('quantidadeItem')}</span>                                                                
                            </div>                           
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Quantidade</label>
                                <div class="col-sm-2">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="quantidade" name="quantidade" value="1" onkeyup="somenteNumeros(this);">
                                        <span class="input-group-btn">
                                            <!--<a href="javascript:void(0);" onclick="carregaLista();"><i class="fa fa-search" /></a>-->
                                            <button type="button" class="btn btn-primary btn-flat"  id="" onclick="carregaLista();">+</button>
                                            <span class="help-block">${errors.from('quantidadeItem')}</span>                                           
                                        </span>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" />Tabela de Itens</label>                                
                                <div class="col-sm-10" id="tabelaItens">                                

                                </div>                                  
                            </div>                                                                   
                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM PASSO 3 -->               


                <!-- COMEÇO PASSO 4 -->
                <div class="col-md-12">
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block">               
                                <img class="img-circle" src="../arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="Geoambiental" />
                                <span class="username"><a href="#">VALOR TOTAL À RECEBER</a></span>
                                <span class="description">Insira dados ao valor total da atividade e clique em registrar para finalizar</span>              
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">                                   
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body" id="divContasReceber">
                            <input type="text" class="form-control" name="atividade.contasReceber[0].idContasReceber" value="${atividade.contasReceber[0].idContasReceber}" style="display: none"/>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Valor Total</label>                                
                                <div class="col-sm-5" >
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" class="form-control" name="atividade.contasReceber[0].valor" value="${l[atividade.contasReceber[0].valor].custom("valorMonetario")}" id="valor" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('atividade.contasReceber[0].valor').join(' - ')}</span>                                    
                                </div>

                                <label class="col-sm-2 control-label">Data Recebimento</label>                                
                                <div class="col-sm-3" id="dDataFinal">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" name="atividade.contasReceber[0].dataReceber" value="${atividade.contasReceber[0].dataReceber.toString("dd/MM/yyyy")}" id="datepickerDataReceber"/>
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('atividade.contasReceber[0].dataReceber').join(' - ')}</span>
                                </div> 
                            </div>                                          

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Observações</label>                                
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="atividade.contasReceber[0].observacoes" value="${atividade.contasReceber[0].observacoes}" placeholder="Observações" maxlength="150" />
                                    <span class="help-block" style="color: red">${errors.from('atividade.contasReceber[0].observacoes').join(' - ')}</span>                                    
                                </div>
                            </div>                           
                        </div> 
                    </div><!-- /.box -->
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <a href="${linkTo[AtividadeController].voltaLista}" class="btn btn-default">Voltar</a>
                        <button type="submit" class="btn btn-primary pull-right">Registrar</button>
                    </div>                         
                    <!-- /.box-footer -->
                </div><!-- /.col -->
                <!-- FIM PASSO 4 -->

            </form>

        </div>   

        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>
        <!-- BUSCA ENDEREÇO PELO CEP  -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" 
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script type="text/javascript" src="../arquivos/js/atividadeJS.js"></script> 
        <script>
                                            $("#opcaoAtividade").change(function () {
                                                mudaOpcaoAtividade();
                                            });

                                            $('#estadosSelect').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val(); // pega o ID do estado
                                                if (selecionado === "0") {
                                                    $('#cidadesSelect').attr('disabled', 'true');
                                                    $.notify("É necessário selecionar um estado", "error");
                                                } else
                                                    carregaCidadeIdEstado(selecionado, 0);
                                            });

                                            $('#tipoPessoa').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "0") {
                                                    $('#pessoaSelect').attr('disabled', 'true');
                                                    $.notify("É necessário selecionar um tipo de pessoa", "error");
                                                } else
                                                    buscaPessoa(selecionado, 0);
                                            });

                                            $('#pessoaSelect').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "") {
                                                    $("#divBtnImportarItens").css("display", "none");
                                                    $.notify("Selecione uma pessoa", "error");
                                                } else {
                                                    buscaOrcamento(selecionado, "");
                                                }
                                            });

                                            $('#setor').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "Selecionar") {
                                                    $('#itemSelect').attr('disabled', 'true');
                                                    $.notify("Selecione um setor", "error");
                                                } else
                                                    buscaItemPorIdsetor(selecionado);
                                            });

                                            $('#orcamentoSelect').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "") {
                                                    $("#divBtnImportarItens").css("display", "none");
                                                } else
                                                    $("#divBtnImportarItens").css("display", "block");
                                            });

                                            function carregaCidadeIdEstado(idEstado, idCidade) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/atividade/buscaCidades/' + idEstado,
                                                    method: 'GET',
                                                    cache: false,
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value="0">Selecione uma cidade...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idCidade + '">' + data[i].nome + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#cidadesSelect').html(options.join(''));
                                                        $('#cidadesSelect').val(idCidade);
                                                        $('#cidadesSelect').removeAttr('disabled');
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao buscar cidade", "error");
                                                    }
                                                });
                                            }
                                            ;

                                            function buscaPessoa(tipoPessoa, selecionado) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/atividade/buscaPessoa/' + tipoPessoa,
                                                    method: 'GET',
                                                    cache: false,
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "">Selecione uma pessoa...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idPessoa + '">' + data[i].nome + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#pessoaSelect').html(options.join(''));
                                                        $('#pessoaSelect').val(selecionado);
                                                        $('#pessoaSelect').removeAttr('disabled');
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao buscar pessoa", "error");
                                                    }
                                                });
                                            }
                                            ;

                                            function buscaOrcamento(pessoa, selecionado) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/atividade/buscaOrcamento/' + pessoa,
                                                    method: 'GET',
                                                    cache: false,
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "">Selecione um orçamento...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idOrcamento + '">' + data[i].idOrcamento + " - " + data[i].pessoa.nome + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#orcamentoSelect').html(options.join(''));
                                                        $('#orcamentoSelect').val(selecionado);
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao buscar orçamento", "error");
                                                    }
                                                });
                                            }
                                            ;

                                            function carregaItensSessao() {
                                                var orcamentoSelecionado = $('#orcamentoSelect option:selected').val();
                                                if (orcamentoSelecionado === 0 || orcamentoSelecionado === null) {
                                                    $.notify("Nenhum orçamento selecionado", "error");
                                                } else {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/atividade/carregaItensSessao/' + orcamentoSelecionado,
                                                        method: 'GET',
                                                        cache: false,
                                                        success: function () {
                                                            $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                            $.notify("Itens importados com sucesso", "success");
                                                        },
                                                        error: function () {
                                                            $.notify("Erro ao carregar itens na sessão", "error");
                                                        }
                                                    });
                                                }
                                            }

                                            function removeLista(indiceItem) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/atividade/removelista/' + indiceItem,
                                                    method: 'GET',
                                                    cache: false,
                                                    success: function () {
                                                        $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                        $.notify("Item removido com sucesso", "success");
                                                    },
                                                    error: function () {
                                                        $.notify("Não foi possível remover o item", "error");
                                                    }
                                                });
                                            }



                                            function buscaItemPorIdsetor(idSetor) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/atividade/buscaItem/' + idSetor,
                                                    method: 'GET',
                                                    cache: false,
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "0">Selecione um item...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idItem + '">' + data[i].descricao + " - R$ " + data[i].valor + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#itemSelect').html(options.join(''));
                                                        $('#itemSelect').removeAttr('disabled');
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao carregar itens", "erros");
                                                    }
                                                });
                                            }
                                            ;
                                            function carregaLista() {
                                                var itemSelecionado = $("#itemSelect option:selected").val();
                                                var quantidade = $("#quantidade").val();
                                                if (typeof itemSelecionado === "undefined" || itemSelecionado <= 0 || quantidade <= 0) {
                                                    $.notify("Item e/ou quantidade inválido", "error");
                                                } else {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/atividade/carregalista/' + itemSelecionado + '/' + quantidade,
                                                        method: 'GET',
                                                        cache: false,
                                                        success: function () {
                                                            $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                            $.notify("Item adicionado com sucesso", "success");
                                                        }
                                                    });
                                                }
                                            }

                                            function atualizaLista(posicao) {
                                                var quantidade = $('#qtde' + posicao).val();
                                                var valor = $('#valor' + posicao).val().replace(".", "");
                                                var valorFormatado = valor.replace(",", ".");
                                                var url = '${pageContext.request.contextPath}/atividade/atualizaitens/' + posicao + '/' + quantidade + '/' + valorFormatado;
                                                $.ajax({
                                                    url: url,
                                                    method: 'GET',
                                                    cache: false,
                                                    success: function () {
                                                        $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                        $.notify("Item atualizado com sucesso", "success");
                                                    },
                                                    error: function () {
                                                        $.notify("Item não foi atualizado", "error");
                                                    }
                                                });
                                            }

                                            //Quando o campo cep perde o foco.
                                            $("#cep").blur(function () {

                                                //Nova variável "cep" somente com dígitos.
                                                var cep = $(this).val().replace(/\D/g, '');
                                                //Verifica se campo cep possui valor informado.
                                                if (cep !== "") {

                                                    //Expressão regular para validar o CEP.
                                                    var validacep = /^[0-9]{8}$/;
                                                    //Valida o formato do CEP.
                                                    if (validacep.test(cep)) {

                                                        //Preenche os campos com "..." enquanto consulta webservice.
                                                        $("#rua").val("Buscando endereço");
                                                        $("#bairro").val("Buscando endereço");
                                                        $.notify("Buscando CEP: " + $("#cep").val(), "info");
                                                        //Consulta o webservice viacep.com.br/
                                                        $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                                                            if (!("erro" in dados)) {
                                                                //Atualiza os campos com os valores da consulta.
                                                                $("#rua").val(dados.logradouro);
                                                                $("#bairro").val(dados.bairro);
                                                                $("#complemento").val(dados.complemento);
                                                                selecionaEstadoECidade(dados.localidade);
                                                                $.notify("CEP encontrado", "success");
                                                            } //end if.
                                                            else {
                                                                //CEP pesquisado não foi encontrado.
                                                                limpa_formulario_cep();
                                                                $.notify("CEP não encontrado", "error");
                                                            }
                                                        });
                                                    } //end if.
                                                    else {
                                                        //cep é inválido.
                                                        limpa_formulario_cep();
                                                        $.notify("Formato de CEP inválido", "error");
                                                    }
                                                } //end if.
                                                else {
                                                    //cep sem valor, limpa formulário.
                                                    limpa_formulario_cep();
                                                }
                                            });
                                            function limpa_formulario_cep() {
                                                // Limpa valores do formulário de cep.
                                                $("#atividade.endereco.rua").val("");
                                                $("#bairro").val("");
                                                $("#cidade").val("");
                                                $("#complemento").val("");
                                                $("#uf").val("");
                                                $("#ibge").val("");
                                            }

                                            function selecionaEstadoECidade(nomeCidade) {
                                                //FUNÇÃO QUE BUSCA CIDADE POR NOME E SELECIONA A CIDADE
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/atividade/buscaCidadePorNome/' + nomeCidade,
                                                    method: 'GET',
                                                    cache: false,
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        $("#estadosSelect").val(data.estado.idEstado);
                                                        carregaCidadeIdEstado(data.estado.idEstado, data.idCidade);
                                                        $.notify("Cidade selecionada com sucesso", "success");
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao selecionar Cidade", "erros");
                                                    }
                                                });
                                            }
                                            /*
                                             * AO CARREGAR A PÁGINA VERIFICA SE NÃO É PARA ATUALIZAR A ENTIDADE
                                             * 
                                             */
                                            $(function () {
                                                var options = [];
                                                options.push('<option value= "">Selecione um orçamento...</option>'); // colocando a primeira option...                                                    
                                                $('#orcamentoSelect').html(options.join(''));
                                                $('#orcamentoSelect').val("");
                                                
                                                //Date picker
                                                $('#datepickerInicial').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });

                                                //Date picker
                                                $('#datepickerFinal').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });

                                                //Date picker
                                                $('#datepickerPrevistaFim').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });

                                                $('#datepickerDataReceber').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });

                                                //RECUPERA CAMPOS NO FORM DE EDIÇÃO
                                                if ('${atividade.idAtividade}') {
                                                    if ($('#tipoPessoa').val() !== "0") {
                                                        //BUSCA PESSOA E SELECIONA                                                        
                                                        buscaPessoa($('#tipoPessoa').val(), '${atividade.pessoa.idPessoa}');

                                                        //BUSCA OS ORÇAMENTOS
                                                        buscaOrcamento('${atividade.pessoa.idPessoa}', '${atividade.orcamento.idOrcamento}');
                                                    }

                                                    if ($("#opcaoAtividade").val() !== "0") {
                                                        mudaOpcaoAtividade();
                                                    }

                                                    if ($("#estadosSelect").val() !== "0") {
                                                        carregaCidadeIdEstado($("#estadosSelect").val(), '${atividade.endereco.cidade.idCidade}');
                                                    }

                                                    //LOAD DA TABELA DE ITENS
                                                    $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                }

                                            });
        </script>
    </body>
</html>

