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
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${servico.documentos}" var="documento" varStatus="i">
                                        <tr>
                                            <td><input type="checkbox"  name="docsDownload[${i.index}]" value="${documento.idDocumento}" /></td>                                            
                                            <td><a href="${linkTo[ServicoController].download(servico.idAtividade,documento.idDocumento)}">${documento.nomeArquivo}</a></td>                                             
                                            <td>${documento.dataUpload.toString("dd/MM/yyyy")}</td>
                                            <td>${documento.getTamArq()}</td>                                                                                        
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
            </div>
        </div>           

        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/arqWeb/jquery.validate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>       
    </body>
</html>

