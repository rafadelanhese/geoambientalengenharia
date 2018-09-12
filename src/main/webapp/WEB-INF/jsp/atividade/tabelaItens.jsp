<%-- 
    Document   : tabelaItens
    Created on : 02/03/2018, 18:30:33
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <body>
        <div class="form-group" id="tabelaAtualiza">
            <div class="col-sm-10">
                <table id="tabela_orcamento" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Descrição</th> 
                            <th>Quant.</th> 
                            <th>Valor</th>                            
                            <th>Sub. Total</th>
                            <th style="width: 5%">Alterar</th>
                            <th style="width: 5%">Remover</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value=""/>
                        <c:forEach items="${itensList}" var="itens" varStatus="itensIndex">  
                            <c:set var="total" value="${total + (itens.valor * itens.quantidade)}"/>
                            <tr>
                                <td>${itens.item.descricao}</td>
                                <td style="width: 5%"><input type="text" class="form-control" value="${itens.quantidade}" id="qtde${itensIndex.index}" /></td>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" class="form-control" value="${l[itens.valor].custom("valorMonetario")}" id="valor${itensIndex.index}" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                    </div>
                                </td>                                
                                <td>R$ ${l[itens.valor * itens.quantidade].custom("valorMonetario")}</td> 
                                <td><a href="javascript:void(0);" onclick="atualizaLista(${itensIndex.index});"><i class="fa fa-check" style="color: green"/></a></td>                                                 
                                <td><a href="javascript:void(0);" onclick="removeLista(${itensIndex.index});" id="btnRemover"><i class="fa fa-remove" style="color: red"/></td>
                            </tr>                            
                        </c:forEach>                               
                    </tbody>
                </table>
                <label>Total: R$ ${total}</label> 
            </div>                        
        </div>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>
        <script type="text/javascript" src="../arquivos/js/atividadeJS.js"></script>   
    </body>
</html>
