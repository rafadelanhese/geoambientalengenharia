<%-- 
    Document   : lista
    Created on : 29/04/2018, 15:52:39
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Parâmetro               
            </h1>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <c:if test="${parametroList.size() eq 0 }">
                        <a href="${linkTo[ParametroController].cadastro}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                    </c:if>                    
                </div>
                <div class="box-body">   
                    <table id="tabelaParametro" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 5%">ID</th>                                
                                <th>Empresa</th>
                                <th>CNPJ</th>
                                <th>Telefone</th>
                                <th>E-mail</th>
                                <th style="width: 5%">Visualizar</th>
                                <th style="width: 5%">Editar</th>                               
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${parametroList}" var="parametro">
                                <tr>
                                    <td>${parametro.idParametro}</td>
                                    <td>${parametro.nome}</td>
                                    <td>${parametro.cnpj}</td>
                                    <td>${parametro.telefone}</td>
                                    <td>${parametro.email}</td>
                                    <td><a href="javascript:void(0);" onclick="carregaModal(${parametro.idParametro});"><i class="fa fa-search" /></a></td>
                                    <td><a href="${linkTo[ParametroController].editar(parametro.idParametro)}"><i class="fa fa-edit" style="color: green"/></a></td>                                    
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
        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>
        <script>
                                        $(function () {
                                            $('#tabelaParametro').DataTable({
                                                'paging': false,
                                                'lengthChange': true,
                                                'searching': false,
                                                'ordering': true,
                                                'info': true,
                                                'autoWidth': true
                                            });
                                        });

                                        function carregaModal(idParametro) {
                                            var url = "${pageContext.request.contextPath}/parametro/visualizar/" + idParametro;
                                            $.ajax({
                                                method: 'GET',
                                                url: url,
                                                dataType: 'json',
                                                cache: false,
                                                success: function (data) {
                                                    $("#idModal").empty();
                                                    $("#idModal").append(
                                                            "<p><strong>ID: </strong>" + data.idParametro + "</p>" +
                                                            "<p><strong>Empresa: </strong>" + data.nome + "</p>" +
                                                            "<p><strong>Telefone: </strong>" + data.telefone + "</p>" +
                                                            "<p><strong>CNPJ: </strong>" + data.cnpj + "</p>" +
                                                            "<p><strong>E-Mail: </strong>" + data.email + "</p>" +
                                                            "<p><strong>Site: </strong>" + data.site + "</p>" +
                                                            "<p><strong>Endereço: </strong>" + data.endereco.rua + ", " + data.endereco.numero + " - "+ data.endereco.bairro +"</p>" +
                                                            "<p><strong>Cidade: </strong>" + data.endereco.cidade.nome + " - " + data.endereco.cidade.estado.sigla +"</p>"
                                                            );
                                                    $('#myModal').modal("show");

                                                }
                                            });
                                        }
        </script>
    </body>
</html>
