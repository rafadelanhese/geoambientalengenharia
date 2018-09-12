<%-- 
    Document   : listaParcelasPagas
    Created on : 16/05/2018, 23:12:39
    Author     : Rafael Delanhese
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Parcelas Pagas
                <small>| Painel de Listagem</small>
            </h1>
            <!-- Default box -->
            <div class="box">               
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Fornecedor</th>
                                <th>Tipo Despesa</th>
                                <th>Qtde de Parcelas</th>
                                <th>Valor Pago</th>
                                <th>Data Pagamento</th>                                                                                              
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${parcelaList}" var="parcela">                            
                                <tr>
                                    <td>${parcela.idParcela}</td>
                                    <td>${parcela.contasPagar.pessoa.nome}</td>
                                    <td>${parcela.contasPagar.tipoDespesa.descricao}</td>
                                    <td>${parcela.qtdeParcelas}</td>
                                    <td>R$ ${l[parcela.valorpago].custom("valorMonetario")}</td>                                                                                     
                                    <td>${parcela.datapagamento.toString("dd/MM/yyyy")}</td>                                                                       
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

