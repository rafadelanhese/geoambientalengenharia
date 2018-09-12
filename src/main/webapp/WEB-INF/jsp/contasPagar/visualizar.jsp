<%-- 
    Document   : visualizar
    Created on : 15/06/2018, 15:27:18
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>    
    <body>
        <div class="row">                             
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i> Conta à Pagar - ID: #${contaPagar.idContasPagar}                            
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        <b>Informações cadastrais</b>
                        <address>
                            <b>Observação:</b> ${contaPagar.observacao}<br/>
                            <b>Data de Lançamento:</b> ${contaPagar.datalancamento.toString("dd/MM/yyyy")}<br/>
                            <b>Tipo de Despesa:</b> ${contaPagar.tipoDespesa.descricao}<br/>
                            <b>Fornecedor:</b> ${contaPagar.pessoa.nome}<br/>                                                                                    
                        </address>
                    </div>                    
                </div>
                <!-- /.row -->                
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#parcelaPaga" data-toggle="tab">Parcelas Pagas</a></li>
                            <li><a href="#parcelaAPagar" data-toggle="tab">Parcelas à Pagar</a></li>                                
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="parcelaPaga">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Nº Parcela</th>
                                        <th>Valor Pago</th>
                                        <th>Data Pagamento</th> 
                                        <th>Quant. Parcelas</th>                                             
                                    </tr>                        
                                    <c:forEach items="${contaPagar.parcelas}" var="parcela" varStatus="seqParcela">   
                                        <c:if test="${not empty parcela.valorpago}">
                                            <tr>
                                                <td>${seqParcela.index + 1}</td>
                                                <td>R$ ${l[parcela.valorpago].custom("valorMonetario")}</td>
                                                <td>${parcela.datapagamento.toString("dd/MM/yyyy")}</td>                                        
                                                <td>${parcela.qtdeParcelas}</td>                                                    
                                            </tr> 
                                        </c:if>
                                    </c:forEach>
                                </table>  
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="parcelaAPagar"> 
                                <table class="table table-striped">
                                    <tr>
                                        <th>Nº Parcela</th>
                                        <th>Valor</th>
                                        <th>Data Vencimento</th> 
                                        <th>Quant. Parcelas</th> 
                                        <th style="width: 5%">Quitar</th>
                                    </tr>                        
                                    <c:forEach items="${contaPagar.parcelas}" var="parcela" varStatus="seqParcela">   
                                        <c:if test="${empty parcela.valorpago}">
                                            <tr>
                                                <td>${seqParcela.index + 1}</td>
                                                <td>R$ ${l[parcela.valor].custom("valorMonetario")}</td>
                                                <td>${parcela.datavencimento.toString("dd/MM/yyyy")}</td>                                        
                                                <td>${parcela.qtdeParcelas}</td>
                                                <td><a href="${linkTo[ContasPagarController].parcela(parcela.idParcela)}"><i class="fa fa-check" style="color: green"/></a></td>                 
                                            </tr> 
                                        </c:if>
                                    </c:forEach>
                                </table>          
                            </div>
                            <!-- /.tab-pane -->                              
                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->                              
                </div>                
                <!-- this row will not appear when printing -->                
                <div class="row no-print">
                    <div class="col-xs-12"> 
                        <hr/>
                        <a href="${linkTo[ContasPagarController].lista}" class="btn btn-default">Voltar</a>                        
                    </div>
                </div>
            </section>             
        </div>
    </body>
</html>

