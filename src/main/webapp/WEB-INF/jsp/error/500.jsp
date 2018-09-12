<%-- 
    Document   : 500
    Created on : 21/04/2018, 16:42:40
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GeoAmbiental Engenharia</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="../arquivos/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../arquivos/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="../arquivos/bower_components/Ionicons/css/ionicons.min.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="../arquivos/bower_components/jvectormap/jquery-jvectormap.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="../arquivos/bower_components/select2/dist/css/select2.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../arquivos/dist/css/AdminLTE.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="../arquivos/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="../arquivos/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">              

        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="../arquivos/dist/css/skins/_all-skins.min.css">
        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="../arquivos/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="error-page">
            <h2 class="headline text-red">500</h2>
            <div class="error-content">
                <h3><i class="fa fa-warning text-red"></i> Oops! Algo deu errado.</h3>
                <p>
                    Vamos trabalhar para consertar isso imediatamente.
                    Um e-mail com a descrição do problema já foi enviada ao desenvolvedor.
                    Enquanto isso, você pode <a href="${linkTo[PainelControleController].index}">retornar ao painel.</a>
                </p>
            </div>
        </div>
        <!-- /.error-page -->
    </body>
</html>
