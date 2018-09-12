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
                            <input type="text" class="form-control" name="idAtividade" value="${projeto.idAtividade}" style="display: none"/>                            
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
                                    <c:forEach items="${projeto.documentos}" var="documento" varStatus="i">
                                        <tr>
                                            <td><input type="checkbox"  name="docsDownload[${i.index}]" value="${documento.idDocumento}" /></td>                                            
                                            <td><a href="${linkTo[ProjetoController].download(projeto.idAtividade,documento.idDocumento)}">${documento.nomeArquivo}</a></td>                                             
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
            </div>
        </div>          

        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/arqWeb/jquery.validate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>     
    </body>
</html>

