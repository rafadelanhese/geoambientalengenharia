<%-- 
    Document   : listaCliente
    Created on : 01/06/2018, 00:24:43
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
                <div class="box-body">                      
                        <table id="tabela_setor" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Núm. Licença</th>
                                    <th>Órgão</th>                                
                                    <th>Status</th>                               
                                    <th style="width: 5%">Visualizar</th>                                                
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
                                                <a href="#"><span class="label label-success">Em andamento</span></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#"><span class="label label-danger">Encerrado</span></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>                                    
                                    <td><a href="${linkTo[LicencaController].visualizarCliente(licenca.idAtividade)}"><i class="fa fa-search" /></a></td>                                   
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

