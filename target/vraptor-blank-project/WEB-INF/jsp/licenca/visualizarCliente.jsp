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
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${licenca.documentos}" var="documento" varStatus="i">
                                    <tr>
                                        <td><input type="checkbox"  name="docsDownload[${i.index}]" value="${documento.idDocumento}" /></td>                                            
                                        <td><a href="${linkTo[LicencaController].download(licenca.idAtividade,documento.idDocumento)}">${documento.nomeArquivo}</a></td>                                             
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
                                        </tr>

                                        <c:forEach items="${licenca.renovacao}" var="renovacao" varStatus="seqItens">
                                            <tr>
                                                <td>${seqItens.index + 1}</td>
                                                <td>${renovacao.dataInicial.toString("dd/MM/yyyy")}</td>
                                                <td>${renovacao.dataVencimento.toString("dd/MM/yyyy")}</td>                                                 
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

