<%-- 
    Document   : listaparcelas
    Created on : 20/01/2018, 14:23:46
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Parcelas à Pagar
                <small>| Painel de Listagem</small>
            </h1>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <a href="${linkTo[ContasPagarController].gerar}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                    <c:forEach var="error" items="${errors}">
                        <p style="color : red">${error.category} - ${error.message}</p>
                    </c:forEach>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Fornecedor</th>
                                <th>Tipo Despesa</th>
                                <th>Qtde de Parcelas</th>
                                <th>Valor à ser Pago</th>
                                <th>Data Vencimento</th>                               
                                <th style="width: 5%">Lançar Pagamento</th>                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${parcelaList}" var="parcela">                            
                                <tr>
                                    <td>${parcela.idParcela}</td>
                                    <td>${parcela.contasPagar.pessoa.nome}</td>
                                    <td>${parcela.contasPagar.tipoDespesa.descricao}</td>
                                    <td>${parcela.qtdeParcelas}</td>
                                    <td>R$ ${l[parcela.valor].custom("valorMonetario")}</td>                                                                                     
                                    <td>${parcela.datavencimento.toString("dd/MM/yyyy")}</td>                                    
                                    <td><a href="${linkTo[ContasPagarController].parcela(parcela.idParcela)}"><i class="fa fa-check" style="color: green"/></a></td>                 
                                </tr>  
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.box -->    
        <script>
            function buscaParcela(idParcela) {
                var url = "${pageContext.request.contextPath}/contaspagar/buscaparcela/" + idParcela;

                $.ajax({
                    url: url
                });
            }
        </script>
    </body>
</html>
