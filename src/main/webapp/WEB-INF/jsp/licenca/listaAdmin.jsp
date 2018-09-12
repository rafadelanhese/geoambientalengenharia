<%-- 
    Document   : listaAdmin
    Created on : 12/04/2018, 01:27:51
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Licenças
                <small>| Painel de Listagem</small>
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
            <c:if test="${not empty mensagem}">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-check"></i> Sucesso</h4>
                    ${mensagem}
                </div>
            </c:if>

            <!-- Default box -->
            <div class="box">               
                <div class="box-header with-border">                    
                    <a href="${linkTo[AtividadeController].cadastro}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">                      
                        <table id="tabela_setor" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Núm. Licença</th>
                                    <th>Órgão</th>                                
                                    <th>Status</th>                               
                                    <th style="width: 5%">Visualizar</th>
                                    <th style="width: 5%">Relatório</th>
                                    <th style="width: 5%">Editar</th>
                                    <th style="width: 5%">Remover</th>                 
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listLicenca}" var="licenca">
                                <tr>
                                    <td>${licenca.idAtividade}</td>
                                    <td>${licenca.numeroLicenca}</td>
                                    <td>${licenca.orgao}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${licenca.status == true}">
                                                <a href="${linkTo[AtividadeController].statusAtividade(licenca.getClass().getSimpleName(),licenca.idAtividade,false)}"><span class="label label-success">Em andamento</span></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${linkTo[AtividadeController].statusAtividade(licenca.getClass().getSimpleName(),licenca.idAtividade,true)}"><span class="label label-danger">Encerrado</span></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>                                    
                                    <td><a href="${linkTo[LicencaController].visualizar(licenca.idAtividade)}"><i class="fa fa-search" /></a></td>
                                    <td><a href="${linkTo[LicencaController].relatorio(licenca.idAtividade)}" target="_blank"><i class="fa fa-print" style="color: black"/></a></td>
                                    <td><a href="${linkTo[AtividadeController].edita(licenca.idAtividade)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                    <td><a href="${linkTo[AtividadeController].remove(licenca.getClass().getSimpleName(),licenca.idAtividade)}"><i class="fa fa-remove" style="color: red"/></a></td>                                    
                                </tr>          
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.box -->           
    </body>
</html>

