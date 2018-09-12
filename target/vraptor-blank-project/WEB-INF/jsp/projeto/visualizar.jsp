<%-- 
    Document   : visualizar
    Created on : 08/03/2018, 17:45:20
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

                        <p class="text-muted"><strong>Nome:</strong> ${projeto.pessoa.nome}</p>
                        <c:choose>
                            <c:when test="${projeto.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                <p class="text-muted"><strong>RG:</strong> ${projeto.pessoa.cpf}</p>
                                <p class="text-muted"><strong>CPF:</strong> ${projeto.pessoa.rg}</p>
                            </c:when>                            
                            <c:otherwise>
                                <p class="text-muted"><strong>CNPJ:</strong> ${projeto.pessoa.cnpj}</p>
                                <p class="text-muted"><strong>Inscr. Estadual:</strong> ${projeto.pessoa.ie}</p>
                            </c:otherwise>
                        </c:choose>                        
                        <p class="text-muted"><strong>Telefone:</strong> ${projeto.pessoa.telefone[0].telefone} - (${projeto.pessoa.telefone[0].descricao})</p>
                        <p class="text-muted"><strong>Celular:</strong> ${projeto.pessoa.telefone[1].telefone} - (${projeto.pessoa.telefone[1].descricao})</p>
                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>

                        <p class="text-muted"><strong>Logradouro:</strong> ${projeto.pessoa.endereco.rua}, ${projeto.pessoa.endereco.numero}</p>
                        <p class="text-muted"><strong>Complemento:</strong> ${projeto.pessoa.endereco.complemento}</p>
                        <p class="text-muted"><strong>Bairro:</strong> ${projeto.pessoa.endereco.bairro}</p>
                        <p class="text-muted"><strong>CEP:</strong> ${projeto.pessoa.endereco.cep}</p>
                        <p class="text-muted"><strong>Cidade:</strong> ${projeto.pessoa.endereco.cidade.nome}</p>
                        <p class="text-muted"><strong>Estado:</strong> ${projeto.pessoa.endereco.cidade.estado.nome} - ${projeto.pessoa.endereco.cidade.estado.sigla}</p>
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

                        <p class="text-muted"><strong>Data Inicial:</strong> ${projeto.dataInicio.toString("dd/MM/yyyy")}</p>
                        <p class="text-muted"><strong>Data Final:</strong> ${projeto.dataFinal.toString("dd/MM/yyyy")}</p>                       
                        <p class="text-muted"><strong>Data Prev. Fim:</strong> ${projeto.dataPrevistaFim.toString("dd/MM/yyyy")}</p>                                                                 
                        <hr>

                        <strong><i class="fa fa-book margin-r-5"></i> Dados Cadastrais</strong>

                        <p class="text-muted"><strong>ART:</strong> ${projeto.art}</p>
                        <p class="text-muted"><strong>Área Total:</strong> ${projeto.areaTotal}</p>
                        <p class="text-muted"><strong>Área Terreno:</strong> ${projeto.areaTerreno}</p>
                        <p class="text-muted"><strong>Ref. Cadastral:</strong> ${projeto.referenciaCadastral}</p>
                        <p class="text-muted"><strong>Cad. Anterior:</strong> ${projeto.cadastroAnterior}</p>
                        <p class="text-muted"><strong>Zoneamento:</strong> ${projeto.zoneamento}</p>
                        <p class="text-muted"><strong>Núm. Matrícula:</strong> ${projeto.numeroMatricula}</p>
                        <p class="text-muted"><strong>Lote/Quadra:</strong> ${projeto.loteQuadra}</p>

                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço da Obra</strong>

                        <p class="text-muted"><strong>Logradouro:</strong> ${projeto.endereco.rua}, ${projeto.endereco.numero}</p>
                        <p class="text-muted"><strong>Complemento:</strong> ${projeto.endereco.complemento}</p>
                        <p class="text-muted"><strong>Bairro:</strong> ${projeto.endereco.bairro}</p>
                        <p class="text-muted"><strong>CEP:</strong> ${projeto.endereco.cep}</p>
                        <p class="text-muted"><strong>Cidade:</strong> ${projeto.endereco.cidade.nome}</p>
                        <p class="text-muted"><strong>Estado:</strong> ${projeto.endereco.cidade.estado.nome} - ${projeto.endereco.cidade.estado.sigla}</p>
                        <hr>

                        <strong><i class="fa fa-newspaper-o margin-r-5"></i> Orçamento</strong>

                        <p class="text-muted"><strong>Visualizar:</strong> <a href="${linkTo[ProjetoController].visualizarOrcamento(projeto.orcamento.idOrcamento)}">Orçamento - ID: ${projeto.orcamento.idOrcamento}</a></p>
                        <p class="text-muted"><strong>Tipo:</strong> ${projeto.orcamento.tipoOrcamento.descricao}</p>
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
                            <input type="text" class="form-control" name="idAtividade" value="${projeto.idAtividade}" style="display: none"/>                            
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
                                    <c:forEach items="${projeto.documentos}" var="documento" varStatus="i">
                                        <tr>
                                            <td><input type="checkbox"  name="docsDownload[${i.index}]" value="${documento.idDocumento}" /></td>                                            
                                            <td><a href="${linkTo[ProjetoController].download(projeto.idAtividade,documento.idDocumento)}">${documento.nomeArquivo}</a></td>                                             
                                            <td>${documento.dataUpload.toString("dd/MM/yyyy")}</td>
                                            <td>${documento.getTamArq()}</td>                                            
                                            <td><a href="${linkTo[ProjetoController].removeDocumento(projeto.idAtividade,documento.idDocumento)}"><i class="fa fa-trash-o" style="color: red"/></a></td>
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
                                <c:when test="${empty projeto.atividadeItem}">
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

                                        <c:forEach items="${projeto.atividadeItem}" var="aI" varStatus="seqItens">
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
                            <c:forEach items="${projeto.contasReceber}" var="contasReceber" varStatus="seqItens">
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
                    <form action="${linkTo[ProjetoController].uploadArquivos}"  method="post"  enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="text" class="form-control" name="idAtividade" value="${projeto.idAtividade}" style="display: none"/>                            
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

