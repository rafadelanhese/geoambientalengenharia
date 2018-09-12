<%-- 
    Document   : visualizar
    Created on : 17/05/2018, 18:32:44
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>

        <!-- COMEÇO LINHA 1 -->
        <div class="row">
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

                        <p class="text-muted"><strong>Nome:</strong> ${servico.pessoa.nome}</p>
                        <c:choose>
                            <c:when test="${servico.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                <p class="text-muted"><strong>RG:</strong> ${servico.pessoa.cpf}</p>
                                <p class="text-muted"><strong>CPF:</strong> ${servico.pessoa.rg}</p>
                            </c:when>                            
                            <c:otherwise>
                                <p class="text-muted"><strong>CNPJ:</strong> ${servico.pessoa.cnpj}</p>
                                <p class="text-muted"><strong>Inscr. Estadual:</strong> ${servico.pessoa.ie}</p>
                            </c:otherwise>
                        </c:choose>                        
                        <p class="text-muted"><strong>Telefone:</strong> ${servico.pessoa.telefone[0].telefone} - (${servico.pessoa.telefone[0].descricao})</p>
                        <p class="text-muted"><strong>Celular:</strong> ${servico.pessoa.telefone[1].telefone} - (${servico.pessoa.telefone[1].descricao})</p>
                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>

                        <p class="text-muted"><strong>Logradouro:</strong> ${servico.pessoa.endereco.rua}, ${servico.pessoa.endereco.numero}</p>
                        <p class="text-muted"><strong>Complemento:</strong> ${servico.pessoa.endereco.complemento}</p>
                        <p class="text-muted"><strong>Bairro:</strong> ${servico.pessoa.endereco.bairro}</p>
                        <p class="text-muted"><strong>CEP:</strong> ${servico.pessoa.endereco.cep}</p>
                        <p class="text-muted"><strong>Cidade:</strong> ${servico.pessoa.endereco.cidade.nome}</p>
                        <p class="text-muted"><strong>Estado:</strong> ${servico.pessoa.endereco.cidade.estado.nome} - ${servico.pessoa.endereco.cidade.estado.sigla}</p>
                        <hr>

                    </div>    
                </div><!-- /.box -->

                <!-- Box Comment -->
                <div class="box box-widget">
                    <div class="box-header with-border">
                        <div class="user-block"> 
                            <img class="img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/licenca.png" alt="Geoambiental" />
                            <span class="username"><a href="#">SERVIÇO</a></span>    
                            <span class="description">Dados do serviço</span>              
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

                        <p class="text-muted"><strong>Data Inicial:</strong> ${servico.dataInicio.toString("dd/MM/yyyy")}</p>
                        <p class="text-muted"><strong>Data Final:</strong> ${servico.dataFinal.toString("dd/MM/yyyy")}</p>                       
                        <p class="text-muted"><strong>Data Prev. Fim:</strong> ${servico.dataPrevistaFim.toString("dd/MM/yyyy")}</p>                                                                 
                        <hr>

                        <strong><i class="fa fa-book margin-r-5"></i> Dados Cadastrais</strong>

                        <p class="text-muted"><strong>Tipo:</strong> ${servico.tipo}</p>
                        <p class="text-muted"><strong>Obs.:</strong> ${servico.observacoes}</p>                                              
                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço da Obra</strong>

                        <p class="text-muted"><strong>Logradouro:</strong> ${servico.endereco.rua}, ${servico.endereco.numero}</p>
                        <p class="text-muted"><strong>Complemento:</strong> ${servico.endereco.complemento}</p>
                        <p class="text-muted"><strong>Bairro:</strong> ${servico.endereco.bairro}</p>
                        <p class="text-muted"><strong>CEP:</strong> ${servico.endereco.cep}</p>
                        <p class="text-muted"><strong>Cidade:</strong> ${servico.endereco.cidade.nome}</p>
                        <p class="text-muted"><strong>Estado:</strong> ${servico.endereco.cidade.estado.nome} - ${servico.endereco.cidade.estado.sigla}</p>
                        <hr>

                        <strong><i class="fa fa-newspaper-o margin-r-5"></i> Orçamento</strong>

                        <p class="text-muted"><strong>Visualizar:</strong> <a href="${linkTo[ServicoController].visualizarOrcamento(servico.orcamento.idOrcamento)}">Orçamento - ID: ${servico.orcamento.idOrcamento}</a></p>
                        <p class="text-muted"><strong>Tipo:</strong> ${servico.orcamento.tipoOrcamento.descricao}</p>
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
                                <span class="description">Documentos anexados referente a atividade</span>              
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
                            <input type="text" class="form-control" name="idAtividade" value="${servico.idAtividade}" style="display: none"/>                            
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
                                    <c:forEach items="${servico.documentos}" var="documento" varStatus="i">
                                        <tr>
                                            <td><input type="checkbox"  name="docsDownload[${i.index}]" value="${documento.idDocumento}" /></td>                                            
                                            <td><a href="${linkTo[ServicoController].download(servico.idAtividade,documento.idDocumento)}">${documento.nomeArquivo}</a></td>                                             
                                            <td>${documento.dataUpload.toString("dd/MM/yyyy")}</td>
                                            <td>${documento.getTamArq()}</td>                                            
                                            <td><a href="${linkTo[ServicoController].removeDocumento(servico.idAtividade,documento.idDocumento)}"><i class="fa fa-trash-o" style="color: red"/></a></td>
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
                                <c:when test="${empty servico.atividadeItem}">
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

                                        <c:forEach items="${servico.atividadeItem}" var="aI" varStatus="seqItens">
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
                            <c:forEach items="${servico.contasReceber}" var="contasReceber" varStatus="seqItens">
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
                    <form action="${linkTo[ServicoController].uploadArquivos}"  method="post"  enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="text" class="form-control" name="idAtividade" value="${servico.idAtividade}" style="display: none"/>                            
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
        </script>
    </body>
</html>

