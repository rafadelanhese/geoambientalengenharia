<%-- 
    Document   : visualizar
    Created on : 12/04/2018, 01:37:40
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>    
        <!-- COMEÇO LINHA 1 -->
        <div class="row">
            <div class="col-md-12">
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
            <!-- COMEÇO CLIENTE-->
            <div class="col-md-4">
                <!-- Box Comment -->
                <div class="box box-widget">
                    <div class="box-header with-border">
                        <div class="user-block"> 
                            <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/cliente.png" alt="Geoambiental" />
                            <span class="username"><a href="#">CLIENTE</a></span>    
                            <span class="description">Dados pessoais</span>              
                        </div>
                        <!-- /.user-block -->
                        <div class="box-tools">               
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                        </div>
                        <!-- /.box-tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <strong><i class="fa fa-book margin-r-5"></i> Pessoal</strong>

                        <p class="text-muted"><strong>Nome:</strong> ${licenca.pessoa.nome}</p>
                        <c:choose>
                            <c:when test="${licenca.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                <p class="text-muted"><strong>RG:</strong> ${licenca.pessoa.cpf}</p>
                                <p class="text-muted"><strong>CPF:</strong> ${licenca.pessoa.rg}</p>
                            </c:when>                            
                            <c:otherwise>
                                <p class="text-muted"><strong>CNPJ:</strong> ${licenca.pessoa.cnpj}</p>
                                <p class="text-muted"><strong>Inscr. Estadual:</strong> ${licenca.pessoa.ie}</p>
                            </c:otherwise>
                        </c:choose>                        
                        <p class="text-muted"><strong>Telefone:</strong> ${licenca.pessoa.telefone[0].telefone} - (${licenca.pessoa.telefone[0].descricao})</p>
                        <p class="text-muted"><strong>Celular:</strong> ${licenca.pessoa.telefone[1].telefone} - (${licenca.pessoa.telefone[1].descricao})</p>
                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>

                        <p class="text-muted"><strong>Logradouro:</strong> ${licenca.pessoa.endereco.rua}, ${licenca.pessoa.endereco.numero}</p>
                        <p class="text-muted"><strong>Complemento:</strong> ${licenca.pessoa.endereco.complemento}</p>
                        <p class="text-muted"><strong>Bairro:</strong> ${licenca.pessoa.endereco.bairro}</p>
                        <p class="text-muted"><strong>CEP:</strong> ${licenca.pessoa.endereco.cep}</p>
                        <p class="text-muted"><strong>Cidade:</strong> ${licenca.pessoa.endereco.cidade.nome}</p>
                        <p class="text-muted"><strong>Estado:</strong> ${licenca.pessoa.endereco.cidade.estado.nome} - ${licenca.pessoa.endereco.cidade.estado.sigla}</p>
                        <hr>

                    </div>    
                </div><!-- /.box -->

                <!-- Box Comment -->
                <div class="box box-widget">
                    <div class="box-header with-border">
                        <div class="user-block"> 
                            <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/licenca.png" alt="Geoambiental" />
                            <span class="username"><a href="#">LICENÇA</a></span>    
                            <span class="description">Dados da licença</span>              
                        </div>
                        <!-- /.user-block -->
                        <div class="box-tools">               
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                        </div>
                        <!-- /.box-tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <strong><i class="fa fa-calendar margin-r-5"></i> Datas</strong>

                        <p class="text-muted"><strong>Data Inicial:</strong> ${licenca.dataInicio.toString("dd/MM/yyyy")}</p>
                        <p class="text-muted"><strong>Data Final:</strong> ${licenca.dataFinal.toString("dd/MM/yyyy")}</p>                       
                        <p class="text-muted"><strong>Data Prev. Fim:</strong> ${licenca.dataPrevistaFim.toString("dd/MM/yyyy")}</p>                                                                 
                        <hr>

                        <strong><i class="fa fa-book margin-r-5"></i> Dados Cadastrais</strong>

                        <p class="text-muted"><strong>CNAE:</strong> ${licenca.cnae}</p>
                        <p class="text-muted"><strong>Núm. Proc.:</strong> ${licenca.numeroProcesso}</p>                       
                        <p class="text-muted"><strong>Núm. Licença:</strong> ${licenca.numeroLicenca}</p>                       
                        <p class="text-muted"><strong>Versão:</strong> ${licenca.versao}</p>
                        <p class="text-muted"><strong>Órgão:</strong> ${licenca.orgao}</p>                        
                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço da Obra</strong>

                        <p class="text-muted"><strong>Logradouro:</strong> ${licenca.endereco.rua}, ${licenca.endereco.numero}</p>
                        <p class="text-muted"><strong>Complemento:</strong> ${licenca.endereco.complemento}</p>
                        <p class="text-muted"><strong>Bairro:</strong> ${licenca.endereco.bairro}</p>
                        <p class="text-muted"><strong>CEP:</strong> ${licenca.endereco.cep}</p>
                        <p class="text-muted"><strong>Cidade:</strong> ${licenca.endereco.cidade.nome}</p>
                        <p class="text-muted"><strong>Estado:</strong> ${licenca.endereco.cidade.estado.nome} - ${licenca.endereco.cidade.estado.sigla}</p>
                        <hr>

                        <strong><i class="fa fa-newspaper-o margin-r-5"></i> Orçamento</strong>

                        <p class="text-muted"><strong>Visualizar:</strong> <a href="<c:url value="/licenca/visualizarOrcamento/${licenca.orcamento.idOrcamento}"/>">Orçamento - ID: ${licenca.orcamento.idOrcamento}</a></p>
                        <p class="text-muted"><strong>Tipo:</strong> ${licenca.orcamento.tipoOrcamento.descricao}</p>
                        <hr>
                    </div>    
                </div><!-- /.box -->
            </div><!-- /.col -->

            <!-- FIM CLIENTE -->           
            <div class="col-md-8">
                <!-- COMEÇO DOCUMENTOS-->
                <div>
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block"> 
                                <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/documento.png" alt="Geoambiental" />
                                <span class="username"><a href="#">DOCUMENTOS</a></span>    
                                <span class="description">Documentos anexados referente ao licenca</span>              
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools"> 
                                <a class="badge bg-green" id="btnAddContasReceber" data-toggle="modal" data-target="#modal-default"><span data-toggle="tooltip" title="Anexar arquivos no licenca" class="badge bg-green"><i class="fa fa-upload"></i> Enviar Arquivos</span></a>
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">                       
                            <input type="text" class="form-control" name="idAtividade" value="${licenca.idAtividade}" style="display: none"/>                            
                            <table id="tabela_setor" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th> 
                                        <th>Nome</th> 
                                        <th>Data Publicação</th>
                                        <th>Tam. Arquivo</th>
                                        <th>Excluir</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${licenca.documentos}" var="documento" varStatus="i">
                                        <tr>
                                            <td><input type="checkbox"  name="docsDownload[${i.index}]" value="${documento.idDocumento}" /></td>                                            
                                            <td><a href="${linkTo[LicencaController].download(licenca.idAtividade,documento.idDocumento)}">${documento.nomeArquivo}</a></td>                                             
                                            <td>${documento.dataUpload.toString("dd/MM/yyyy")}</td>
                                            <td>${documento.getTamArq()}</td>                                            
                                            <td><a href="${linkTo[LicencaController].removeDocumento(licenca.idAtividade,documento.idDocumento)}"><i class="fa fa-trash-o" style="color: red"/></a></td>
                                        </tr>                                      
                                    </c:forEach>
                                </tbody>
                            </table>                                              
                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM DOCUMENTOS --> 

                <!-- COMEÇO RENOVAÇÃO REALIZADOS-->
                <div>
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block"> 
                                <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/servico.png" alt="Geoambiental" />
                                <span class="username"><a href="#">SERVIÇOS REALIZADOS</a></span>    
                                <span class="description">Histórico de serviços</span>              
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">                                     
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <c:choose>
                                <c:when test="${empty licenca.atividadeItem}">
                                    <p>Não há serviços cadastrados</p>
                                </c:when>
                                <c:otherwise>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Seq.</th>
                                            <th>Item</th>
                                            <th>Quantidade</th>
                                            <th>Valor</th>                                
                                            <th>Sub. Total</th>                                
                                        </tr>

                                        <c:forEach items="${licenca.atividadeItem}" var="aI" varStatus="seqItens">
                                            <tr>
                                                <td>${seqItens.index + 1}</td>
                                                <td>${aI.item.descricao}</td>
                                                <td>${aI.quantidade}</td>
                                                <td>${aI.valor}</td>
                                                <td>R$ ${l[aI.quantidade * aI.valor].custom("valorMonetario")}</td> 
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:otherwise>
                            </c:choose>                           
                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM SERVIÇOS --> 

                <!-- COMEÇO RENOVAÇÃO REALIZADOS-->
                <div>
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block"> 
                                <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="Geoambiental" />
                                <span class="username"><a href="#">RENOVAÇÃO</a></span>    
                                <span class="description">Histórico de renovação da licença</span>              
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">     
                                <a class="badge bg-green" id="btnAddContasReceber" data-toggle="modal" data-target="#modal-renovacao"><span data-toggle="tooltip" title="Cadastrar uma renovação" class="badge bg-green"><i class="fa fa-upload"></i> Cad. Renovação</span></a>
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <c:choose>
                                <c:when test="${empty licenca.renovacao}">
                                    <p>Não há renovações cadastradas</p>
                                </c:when>
                                <c:otherwise>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Seq.</th>
                                            <th>Data Inicial</th>
                                            <th>Data Vencimento</th>    
                                            <th>Excluir</th>    
                                        </tr>

                                        <c:forEach items="${licenca.renovacao}" var="renovacao" varStatus="seqItens">
                                            <tr>
                                                <td>${seqItens.index + 1}</td>
                                                <td>${renovacao.dataInicial.toString("dd/MM/yyyy")}</td>
                                                <td>${renovacao.dataVencimento.toString("dd/MM/yyyy")}</td> 
                                                <td><a href="${linkTo[LicencaController].removeRenovacao(licenca.idAtividade,renovacao.idRenovacao)}"><i class="fa fa-trash-o" style="color: red"/></a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:otherwise>
                            </c:choose>                           
                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM SERVIÇOS --> 

                <div>
                    <!-- CONTAS A RECEBER -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block"> 
                                <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="Geoambiental" />
                                <span class="username"><a href="#">CONTAS À RECEBER</a></span>    
                                <span class="description">Contas recebidas</span>              
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">               
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <c:forEach items="${licenca.contasReceber}" var="contasReceber" varStatus="seqItens">
                                <div class="box-group" id="accordion">                           
                                    <div class="panel box">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#${seqItens.index}">
                                                    ID: ${contasReceber.idContasReceber} - Descrição: ${contasReceber.observacoes}
                                                </a>                                            
                                                <div class="description-block" style="font-size: 15px; color: gray;"> 
                                                    <span class="description">Valor Total: R$ ${l[contasReceber.valor].custom("valorMonetario")} | Data de Recebimento: ${contasReceber.dataReceber.toString("dd/MM/yyyy")} | Qtde Parc. Lançadas: ${contasReceber.parcelaReceber.size()}</span> 
                                                </div>                                            
                                            </h4>
                                        </div>

                                        <div id="${seqItens.index}" class="panel-collapse collapse">
                                            <div class="box-body">
                                                <table class="table table-striped">
                                                    <c:choose>
                                                        <c:when test="${empty contasReceber.parcelaReceber }">
                                                            <p>Não foi lançada nenhuma parcela de recebimento para esta conta.</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <th>Nº Parcela</th>
                                                                <th>Valor Recebido</th>
                                                                <th>Data Pag.</th>                                            
                                                            </tr>
                                                            <c:forEach items="${contasReceber.parcelaReceber}" var="parcela" varStatus="seqParcela">

                                                                <tr>
                                                                    <td>${seqParcela.index + 1}</td>
                                                                    <td>R$ ${l[parcela.valorRecebido].custom("valorMonetario")}</td>
                                                                    <td>${parcela.dataRecebido.toString("dd/MM/yyyy")}</td>                                               
                                                                </tr>                                                                             
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>
                            </c:forEach>                      
                        </div>    
                    </div><!-- /.box -->           
                    <!-- FIM CONTAS A RECEBER -->  
                </div>                
            </div>
        </div>      

        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Enviar Arquivos</h4>
                    </div>
                    <form action="${linkTo[LicencaController].uploadArquivos}"  method="post"  enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="text" class="form-control" name="idAtividade" value="${licenca.idAtividade}" style="display: none"/>                            
                            <table class="table table-striped" id="idTabela">                                

                            </table>
                        </div>                                                                                                        
                        <div class="modal-footer">                            
                            <input class="left-side" type="file" id="inputUpload"  name="files[]" multiple />
                            <input type="submit" class="btn btn-primary right-side" value="Upload" />                            
                        </div>
                    </form>  
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <div class="modal fade" id="modal-renovacao">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">CADASTRAR UMA RENOVAÇÃO</h4>
                    </div>
                    <form class="form-horizontal" action="${linkTo[LicencaController].cadastraRenovacao}"  method="post">
                        <div class="modal-body">
                            <div class="row">                                
                                <div class="form-group">
                                    <input type="text" class="form-control" name="renovacao.idRenovacao" value="${renovacao.idRenovacao}" style="display: none"/>
                                    <input type="text" class="form-control" name="idAtividade" value="${licenca.idAtividade}" style="display: none"/>
                                    <label class="col-sm-2 control-label">Data Inicial</label>                                
                                    <div class="col-sm-4" id="dDataInicio">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>                                        
                                            <input type="text" class="form-control pull-right" name="renovacao.dataInicial" value="${renovacao.dataInicial}" id="dtpDataInicial">
                                        </div>
                                        <span class="help-block" style="color: red">${errors.from('renovacao.dataInicial')}</span>
                                    </div> 

                                    <label class="col-sm-2 control-label">Data Venc.</label>                                
                                    <div class="col-sm-4" id="dDataFinal">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" name="renovacao.dataVencimento" value="${renovacao.dataVencimento}" id="dtpDataVencimento">
                                        </div>
                                        <span class="help-block" style="color: red">${errors.from('renovacao.dataVencimento')}</span>
                                    </div>                                 

                                </div>   

                                <input type="text" class="form-control" name="contasReceber.idContasReceber" value="${contasReceber.idContasReceber}" style="display: none"/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Valor Total</label>                                
                                    <div class="col-sm-4" >
                                        <div class="input-group">
                                            <span class="input-group-addon">R$</span>
                                            <input type="text" class="form-control" name="contasReceber.valor" value="${contasReceber.valor}" id="valor" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                        </div>
                                        <span class="help-block" id="sObservacoes">${errors.from('contasReceber.valor')}</span>                                    
                                    </div>

                                    <label class="col-sm-2 control-label">Data Receb.</label>                                
                                    <div class="col-sm-4" id="dDataFinal">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" name="contasReceber.dataReceber" value="${contasReceber.dataReceber}" id="dtpDataRecebimento"/>
                                        </div>
                                        <span class="help-block" style="color: red">${errors.from('contasReceber.dataReceber')}</span>
                                    </div> 
                                </div>                                          

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Observações</label>                                
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="contasReceber.observacoes" value="Referente a licença número: ${licenca.numeroLicenca}" placeholder="Observações" maxlength="150" />
                                        <span class="help-block" style="color: red">${errors.from('contasReceber.observacoes')}</span>                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">                       
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </div>
                    </form>

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/arqWeb/jquery.validate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
                                                $('#inputUpload').on("change", function () {
                                                    var input = document.getElementById("inputUpload");
                                                    var tabela = document.getElementById("idTabela");
                                                    var row = document.createElement("tr");
                                                    var th1 = document.createElement("th");
                                                    var th2 = document.createElement("th");
                                                    var th3 = document.createElement("th");
                                                    th1.appendChild(document.createTextNode("Nome do Arquivo"));
                                                    th2.appendChild(document.createTextNode("Extensão"));
                                                    th3.appendChild(document.createTextNode("Tamanho"));
                                                    row.appendChild(th1);
                                                    row.appendChild(th2);
                                                    row.appendChild(th3);
                                                    tabela.appendChild(row);
                                                    if (input.files.length > 0) {

                                                        for (var i = 0; i < input.files.length; i++) {
                                                            var row = document.createElement("tr");
                                                            var td1 = document.createElement("td");
                                                            var td2 = document.createElement("td");
                                                            var td3 = document.createElement("td");
                                                            var nome = input.files[i].name.split(".");
                                                            td1.appendChild(document.createTextNode(nome[0]));
                                                            td2.appendChild(document.createTextNode(nome[1]));
                                                            td3.appendChild(document.createTextNode(input.files[i].valueOf().length));
                                                            row.appendChild(td1);
                                                            row.appendChild(td2);
                                                            row.appendChild(td3);
                                                            tabela.appendChild(row);
                                                            //options.push('<tr><td>' + input.files[i].name + '</td></tr>');
                                                        }
                                                    }
                                                });

                                                $(function () {
                                                    $('#dtpDataInicial').datepicker({
                                                        format: 'dd/mm/yyyy',
                                                        autoclose: true
                                                    });
                                                    $('#dtpDataVencimento').datepicker({
                                                        format: 'dd/mm/yyyy',
                                                        autoclose: true
                                                    });
                                                    $('#dtpDataRecebimento').datepicker({
                                                        format: 'dd/mm/yyyy',
                                                        autoclose: true
                                                    });
                                                });

        </script>
    </body>
</html>

