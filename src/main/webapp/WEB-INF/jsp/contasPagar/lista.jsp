<%-- 
    Document   : lista
    Created on : 27/12/2017, 14:30:08
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Contas à Pagar
                <small>| Painel de Listagem</small>
            </h1>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <a href="${linkTo[ContasPagarController].gerar}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Fornecedor</th>
                                <th>Tipo Despesa</th>
                                <th>Data</th>
                                <th>Status</th>
                                <th style="width: 5%">Visualizar</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${contaspagarList}" var="cp">
                                <tr>
                                    <td>${cp.idContasPagar}</td>
                                    <td>${cp.pessoa.nome}</td>
                                    <td>${cp.tipoDespesa.descricao}</td>
                                    <td>${cp.datalancamento.toString("dd/MM/yyyy")}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${cp.status() eq true}">
                                                <span class="label label-danger">ABERTA</span>
                                            </c:when>                                           
                                            <c:otherwise>
                                                <span class="label label-success">QUITADA</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td><a href="${linkTo[ContasPagarController].visualizar(cp.idContasPagar)}"><i class="fa fa-search" /></a></td>
                                    <td><a href="${linkTo[ContasPagarController].edita(cp.idContasPagar)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                    <td><a href="${linkTo[ContasPagarController].remove(cp.idContasPagar)}"><i class="fa fa-remove" style="color: red"/></a></td>
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
