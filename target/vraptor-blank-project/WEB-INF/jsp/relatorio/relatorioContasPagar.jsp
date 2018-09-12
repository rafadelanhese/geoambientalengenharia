<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Relatório Geoambiental - Contas à Pagar</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="../arquivos/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../arquivos/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="../arquivos/bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../arquivos/dist/css/AdminLTE.min.css">

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
                            <i class="fa fa-globe"></i> Geoambiental Engenharia         
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Valor</th>
                                    <th>Qtde. Parcelas</th>
                                    <th>Data de Vencimento</th>
                                    <th>Fornecedor</th>
                                    <th>Tipo Despesa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${parcelaList}" var="parcela">
                                    <tr>
                                        <td>${parcela.idParcela}</td>
                                        <td>${l[parcela.valor].custom("valorMonetario")}</td>
                                        <td>${parcela.qtdeParcelas}</td>
                                        <td>${parcela.datavencimento.toString("dd/MM/yyyy")}</td>
                                        <td>${parcela.contasPagar.pessoa.nome}</td>   
                                        <td>${parcela.contasPagar.tipoDespesa.descricao}</td>                                                                                
                                    </tr>          
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- ./wrapper -->
    </body>
</html>