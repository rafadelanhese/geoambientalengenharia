<%-- 
    Document   : listaAdmin
    Created on : 10/05/2018, 16:33:05
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Serviços
                <small>| Painel de Listagem</small>
            </h1>
            <c:if test="${not empty errors}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                    <c:forEach var="error" items="${errors}">
                        ${error.category} - ${error.message}<br />
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
                                <th>Tipo</th>
                                <th>Cliente</th>                                
                                <th>Status</th>                               
                                <th style="width: 5%">Visualizar</th>
                                <th style="width: 5%">Relatório</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Remover</th>                 
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listServico}" var="servico">
                                <c:choose>
                                    <c:when test="${servico.status == true}">                                       
                                        <tr>
                                            <td>${servico.idAtividade}</td>
                                            <td>${servico.tipo}</td>
                                            <td>${servico.pessoa.nome}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${servico.status == true}">
                                                        <a href="${linkTo[AtividadeController].statusAtividade(servico.getClass().getSimpleName(),servico.idAtividade,false)}"><span class="label label-success">Em andamento</span></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${linkTo[AtividadeController].statusAtividade(servico.getClass().getSimpleName(),servico.idAtividade,true)}"><span class="label label-danger">Encerrado</span></a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>                                    
                                            <td><a href="${linkTo[ServicoController].visualizar(servico.idAtividade)}"><i class="fa fa-search" /></a></td>
                                            <td><a href="${linkTo[ServicoController].relatorio(servico.idAtividade)}" target="blank"><i class="fa fa-print" style="color: black" /></a></td>
                                            <td><a href="${linkTo[AtividadeController].edita(servico.idAtividade)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                            <td><a href="${linkTo[AtividadeController].remove(servico.getClass().getSimpleName(),servico.idAtividade)}"><i class="fa fa-remove" style="color: red"/></a></td>                                    
                                        </tr>      
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.box -->        
    </body>
</html>

