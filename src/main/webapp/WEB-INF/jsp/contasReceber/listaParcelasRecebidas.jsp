<%-- 
    Document   : listaParcelasRecebidas
    Created on : 15/03/2018, 17:25:26
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Parcelas Recebidas
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
                    <a href="${linkTo[ContasReceberController].lancarRecebimento}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 5%">ID</th>
                                <th style="width: 5%">Tipo Atividade</th> 
                                <th>Data Recebimento</th>
                                <th>Valor Recebido</th>
                                <th>Conta Receber [ID]</th>
                                <th style="width: 5%">Recibo</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listParcelaRecebidas}" var="parcela">
                                <tr>
                                    <td>${parcela.idParcelaReceber}</td>
                                    <td>                                        
                                        <c:choose>
                                            <c:when test="${parcela.contasReceber.atividade.getClass().getSimpleName() eq 'Projeto'}">
                                                <span class="label label-success" >PROJETO</span>
                                            </c:when>
                                            <c:when test="${parcela.contasReceber.atividade.getClass().getSimpleName() eq 'Licenca'}">
                                                <span class="label label-primary">LICENÇA</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="label label-danger">SERVIÇO</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>                                      
                                    <td>${parcela.dataRecebido.toString("dd/MM/yyyy")}</td>                                    
                                    <td>R$ ${l[parcela.valorRecebido].custom("valorMonetario")}</td> 
                                    <td>${parcela.contasReceber.idContasReceber}</td>
                                    <td><a href="${linkTo[ContasReceberController].recibo(parcela.idParcelaReceber)}" target="blank"><i class="fa  fa-ticket primary" /></a></td>
                                    <td><a href="${linkTo[ContasReceberController].editaParcelaRecebida(parcela.idParcelaReceber)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                    <td><a href="${linkTo[ContasReceberController].removeParcelaRecebida(parcela.idParcelaReceber)}"><i class="fa fa-remove" style="color: red"/></a></td>
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
