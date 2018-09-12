<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Relatório Geoambiental - Orçamento</title>
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
                            <i class="fa fa-globe"></i> Orçamento                            
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-6 invoice-col">
                        <b>CONTRATADA</b>
                        <address>
                            <b>Empresa:</b> ${parametro.nome}<br/>
                            <b>CNPJ:</b> ${parametro.cnpj}<br/>
                            <b>Endereço:</b> ${parametro.endereco.rua}, ${parametro.endereco.numero}<br/>                            
                            <b>Bairro:</b> ${parametro.endereco.bairro} - ${parametro.endereco.cidade.nome}/${parametro.endereco.cidade.estado.sigla}<br/>
                            <b>CEP:</b> ${parametro.endereco.cep}<br/>
                        </address>
                    </div> 
                    <div class="col-sm-6 invoice-col">
                        <b>CONTRATANTE</b>
                        <address>
                            <b>Empresa:</b> ${orcamento.pessoa.nome}<br/>
                            <c:choose>
                                <c:when test="${orcamento.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                    <b>RG:</b> ${orcamento.pessoa.cpf}<br/>
                                    <b>CPF:</b> ${orcamento.pessoa.rg}<br/>
                                </c:when>                            
                                <c:otherwise>
                                    <b>CNPJ:</b> ${orcamento.pessoa.cnpj}<br/>
                                    <b>Inscr. Estadual:</b> ${orcamento.pessoa.ie}<br/>
                                </c:otherwise>
                            </c:choose>                                   
                            <b>Endereço:</b> ${orcamento.pessoa.endereco.rua}, ${orcamento.pessoa.endereco.numero}<br/>                            
                            <b>Bairro:</b> ${orcamento.pessoa.endereco.bairro} - ${orcamento.pessoa.endereco.cidade.nome}/${orcamento.pessoa.endereco.cidade.estado.sigla}<br/>
                            <b>CEP:</b> ${orcamento.pessoa.endereco.cep}<br/>
                        </address>
                    </div>                         
                </div>
                <!-- /.row -->
                <div>                                                          
                    <b>Ref.:</b> ${orcamento.tipoOrcamento.descricao}<br/><br/>
                    <b>1. Objetivo</b><br/>
                    ${orcamento.objetivo}<br/>
                    <b>2. Do valor total da proposta</b><br/>
                    ${orcamento.proposta}<br/>
                    <b>3. Do valor total da proposta</b><br/>
                    ${orcamento.formapagamento}<br/>
                    <b>4. Taxas e Emolumentos</b><br/>
                    ${orcamento.taxaseemolumentos}<br/>
                    <b>5. Início das atividades</b><br/>
                    ${orcamento.inicioatividades}<br/>
                    <b>6. Da validade da proposta</b><br/>
                    ${orcamento.validadeproposta}<br/>
                </div>        
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- ./wrapper -->
    </body>
</html>