<%-- 
    Document   : lista
    Created on : 24/10/2017, 18:24:17
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Setores
                <small>| Painel de Listagem</small>
            </h1>
            <c:if test="${not empty validacao}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                    ${validacao}
                </div>
            </c:if>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <a href="${linkTo[SetorController].cadastro}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 5%">ID</th>                                
                                <th>Descrição</th>
                                <th style="width: 5%">Visualizar</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${setorList}" var="setor">
                                <tr>
                                    <td>${setor.idSetor}</td>
                                    <td>${setor.descricao}</td>
                                    <td><a href="javascript:void(0);" onclick="carregaModal(${setor.idSetor});"><i class="fa fa-search" /></a></td>
                                    <td><a href="${linkTo[SetorController].editar(setor.idSetor)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                    <td><a href="${linkTo[SetorController].remover(setor.idSetor)}"><i class="fa fa-remove" style="color: red"/></a></td>                                    
                                </tr>          
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.box -->    

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Painel de Visualização</h4>
                    </div>
                    <div class="modal-body" id="idModal">

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <script>
            function carregaModal(idSetor) {
                var url = "${pageContext.request.contextPath}/setor/visualizar/" + idSetor;
                $.ajax({
                    method: 'GET',
                    url: url,
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                        $("#idModal").empty();
                        $("#idModal").append(
                                "<p><strong>ID: </strong>" + data.idSetor + "</p>" +
                                "<p><strong>Descrição: </strong>" + data.descricao + "</p>"
                                );
                        $('#myModal').modal("show");

                    }
                });
            }
        </script>
    </body>
</html>