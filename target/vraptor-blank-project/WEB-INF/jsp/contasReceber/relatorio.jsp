<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Relatório Geoambiental - Conta à Receber</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="../../arquivos/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../../arquivos/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="../../arquivos/bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../../arquivos/dist/css/AdminLTE.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body onload="window.print();">
        <div class="wrapper">
            <!-- Main content -->
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i> Conta Receber - ID: #${contaReceber.idContasReceber}                            
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
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- ./wrapper -->
    </body>
</html>