<%-- 
    Document   : lista
    Created on : 25/01/2018, 18:11:59
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Orçamento
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
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <a href="${linkTo[OrcamentoController].gerar}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Cliente</th>
                                <th>Referência</th>
                                <th>Data</th>
                                <th>Total</th>
                                <th>Desconto</th>                                
                                <th>Valor</th>
                                <th>Status</th>                              
                                <th style="width: 5%">Visualizar</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orcamentoList}" var="ocmto">
                                <tr>
                                    <td>${ocmto.idOrcamento}</td>
                                    <td>${ocmto.pessoa.nome}</td>
                                    <td>${ocmto.tipoOrcamento.descricao}</td>
                                    <td>${ocmto.dataorc.toString("dd/MM/yyyy")}</td>
                                    <td>R$ ${l[ocmto.total].custom("valorMonetario")}</td>
                                    <td>R$ ${l[ocmto.desconto].custom("valorMonetario")}</td>
                                    <td>R$ ${l[ocmto.total - ocmto.desconto].custom("valorMonetario")}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${ocmto.status == true}">
                                                <a href="${linkTo[OrcamentoController].statusOrcamento(ocmto.idOrcamento,false)}"><span class="label label-success">Aprovado</span></a>                                                
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${linkTo[OrcamentoController].statusOrcamento(ocmto.idOrcamento,true)}"><span class="label label-warning">Pendente</span></a>                                                                                                
                                            </c:otherwise>
                                        </c:choose>
                                    </td>                                  
                                    <td><a href="${linkTo[OrcamentoController].visualizar(ocmto.idOrcamento)}"><i class="fa fa-search" /></a></td>                                           
                                    <td><a href="${linkTo[OrcamentoController].edita(ocmto.idOrcamento)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                    <td><a href="${linkTo[OrcamentoController].remove(ocmto.idOrcamento)}"><i class="fa fa-remove" style="color: red"/></a></td>
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


