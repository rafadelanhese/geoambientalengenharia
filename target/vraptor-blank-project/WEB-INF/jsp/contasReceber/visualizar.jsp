<%-- 
    Document   : visualizar
    Created on : 11/05/2018, 17:38:07
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
                            <i class="fa fa-globe"></i> Conta Receber - ID: #${contaReceber.idContasReceber}
                            <small class="pull-right">Presidente Prudente, ${dataAtual.toString("dd/MM/yyyy")}</small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        <b>Informações cadastrais</b>
                        <address>
                            <b>Cliente:</b> ${contaReceber.atividade.pessoa.nome}<br/>
                            <b>Telefone:</b> ${contaReceber.atividade.pessoa.telefone[0].telefone}<br/>
                            <b>Celular:</b> ${contaReceber.atividade.pessoa.telefone[1].telefone}<br/>
                            <b>Valor:</b> R$ ${l[contaReceber.valor].custom("valorMonetario")}<br/>
                            <b>Data:</b> ${contaReceber.dataReceber.toString("dd/MM/yyyy")}<br/>
                            <b>Observações:</b> ${contaReceber.observacoes}<br/>
                            <b>Referência:</b> ${contaReceber.atividade.getClass().getSimpleName()}<br/>
                        </address>
                    </div> 
                    <div class="col-sm-4 invoice-col">
                        <b>Endereço do Cliente</b>
                        <address>
                            <b>Rua:</b> ${contaReceber.atividade.pessoa.endereco.rua}<br/>                            
                            <b>Número:</b> ${contaReceber.atividade.pessoa.endereco.numero}<br/>
                            <b>Bairro:</b> ${contaReceber.atividade.pessoa.endereco.bairro}<br/>
                            <b>CEP:</b> ${contaReceber.atividade.pessoa.endereco.cep}<br/>
                            <b>Cidade:</b> ${contaReceber.atividade.pessoa.endereco.cidade.nome}<br/>
                            <b>Estado:</b> ${contaReceber.atividade.pessoa.endereco.cidade.estado.nome} - ${contaReceber.atividade.pessoa.endereco.cidade.estado.sigla}<br/>                            
                        </address>
                    </div>      
                    <div class="col-sm-4 invoice-col">
                        <b>Endereço da Obra</b>
                        <address>
                            <b>Rua:</b> ${contaReceber.atividade.endereco.rua}<br/>                            
                            <b>Número:</b> ${contaReceber.atividade.endereco.numero}<br/>
                            <b>Bairro:</b> ${contaReceber.atividade.endereco.bairro}<br/>
                            <b>CEP:</b> ${contaReceber.atividade.endereco.cep}<br/>
                            <b>Cidade:</b> ${contaReceber.atividade.endereco.cidade.nome}<br/>
                            <b>Estado:</b> ${contaReceber.atividade.endereco.cidade.estado.nome} - ${contaReceber.atividade.endereco.cidade.estado.sigla}<br/>                            
                        </address>
                    </div>      
                </div>
                <!-- /.row -->
                <div>                   
                    <c:choose>
                        <c:when test="${empty contaReceber.parcelaReceber }">
                            <p>Não foi lançada nenhuma parcela de recebimento para esta conta.</p>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-striped">
                                <tr>
                                    <th>Nº Parcela</th>
                                    <th>Valor Recebido</th>
                                    <th>Data Recebimento</th> 
                                    <th>Valor Restante</th> 
                                    <th style="width: 5%">Remover</th>
                                </tr>
                                <c:set var="total" value="0"/>
                                <c:set var="valorRestante" value="0"/>
                                <c:forEach items="${contaReceber.parcelaReceber}" var="parcela" varStatus="seqParcela">
                                    <c:set var="total" value="${total + parcela.valorRecebido}"/>
                                    <c:set var="valorRestante" value="${contaReceber.valor - total}"/>
                                    <tr>
                                        <td>${seqParcela.index + 1}</td>
                                        <td>R$ ${l[parcela.valorRecebido].custom("valorMonetario")}</td>
                                        <td>${parcela.dataRecebido.toString("dd/MM/yyyy")}</td>                                        
                                        <td>R$ ${l[valorRestante].custom("valorMonetario")}</td>
                                        <td><a href="${linkTo[ContasReceberController].removeParcelaRecebida(parcela.idParcelaReceber)}"><i class="fa fa-trash-o" style="color: red"/></a></td>
                                    </tr>                                                                             
                                </c:forEach>
                            </table>
                            <div class="row">
                                <div class="col-xs-6">
                                    <p class="lead">Valor pago</p>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th style="width:50%">Valor Restante:</th>
                                                <td>R$ ${l[valorRestante].custom("valorMonetario")}</td>                                                
                                            </tr>
                                            <tr>
                                                <th style="width:50%">Total Recebido:</th>
                                                <td>R$ ${l[total].custom("valorMonetario")}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>                               
                        </c:otherwise>
                    </c:choose>                   

                </div>                
                <!-- this row will not appear when printing -->
                <div class="row no-print">
                    <div class="col-xs-12"> 
                        <hr/>
                        <a href="${linkTo[ContasReceberController].listaContas}" class="btn btn-default">Voltar</a>
                        <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
                            <a href="${linkTo[ContasReceberController].relatorio(contaReceber.idContasReceber)}" target="_blank" style="color: white">  <i class="fa fa-download"></i> Gerar PDF</a>
                        </button>
                    </div>
                </div>
            </section>             
        </div>
    </body>
</html>
