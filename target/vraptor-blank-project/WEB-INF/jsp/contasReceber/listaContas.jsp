<%-- 
    Document   : listaContas
    Created on : 22/04/2018, 00:03:42
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Contas
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
            
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-check"></i> Sucesso</h4>
                    ${success.message}
                </div>
            </c:if>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <a href="${linkTo[ContasReceberController].gerar}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 5%">ID</th>
                                <th style="width: 5%">Tipo Atividade</th> 
                                <th>Cliente</th>
                                <th>E-mail</th>
                                <th>Valor Total</th>
                                <th>Data Receber</th> 
                                <th style="width: 5%">Exibir</th>
                                <th style="width: 5%">Cobrar</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Remover</th>                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listContas}" var="contasReceber">
                                <tr>
                                    <td>${contasReceber.idContasReceber}</td>
                                    <td>                                        
                                        <c:choose>
                                            <c:when test="${contasReceber.atividade.getClass().getSimpleName() eq 'Projeto'}">
                                                <span class="label label-success" >PROJETO</span>
                                            </c:when>
                                            <c:when test="${contasReceber.atividade.getClass().getSimpleName() eq 'Licenca'}">
                                                <span class="label label-primary">LICENÇA</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="label label-danger">SERVIÇO</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${contasReceber.atividade.pessoa.nome}</td>
                                    <td>${contasReceber.atividade.pessoa.email}</td>
                                    <td>R$ ${l[contasReceber.valor].custom("valorMonetario")}</td> 
                                    <td>${contasReceber.dataReceber.toString("dd/MM/yyyy")}</td>
                                    <td><a href="${linkTo[ContasReceberController].visualizar(contasReceber.idContasReceber)}"><i class="fa fa-search" /></a></td>                                                                               
                                    <td><a href="${linkTo[ContasReceberController].emailCobranca(contasReceber.atividade.pessoa.email)}"><i class="fa fa-envelope primary"/></a></td>
                                    <td><a href="${linkTo[ContasReceberController].editaContaReceber(contasReceber.idContasReceber)}"><i class="fa fa-edit" style="color: green"/></a></td>                                    
                                    <td><a href="${linkTo[ContasReceberController].removeContaReceber(contasReceber.idContasReceber)}"><i class="fa fa-remove" style="color: red"/></a></td>                                    
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