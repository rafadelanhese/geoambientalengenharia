<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Geoambiental Engenharia</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/Ionicons/css/ionicons.min.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/jvectormap/jquery-jvectormap.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/select2/dist/css/select2.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/dist/css/AdminLTE.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">              
        
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/dist/css/skins/_all-skins.min.css">
        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/arquivos/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <header class="main-header"> 

                <!-- Logo -->
                <a class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>G</b>eo</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Geo</b>ambiental</span>
                </a>

                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">                                                   
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="${pageContext.request.contextPath}/arquivos/imagens/geo_logo.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${userLogado.userLogado.getNomeAbreviado()}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="${pageContext.request.contextPath}/arquivos/imagens/geo_logo.jpg" class="img-circle" alt="User Image">

                                        <p>
                                            GeoAmbiental Engenharia
                                            <small>Desde 2015</small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Perfil</a>
                                        </div>
                                        <div class="pull-right">
                                            <form action="${linkTo[LoginController].logoff}" method="POST">
                                                <!-- <a href="#" class="btn btn-default btn-flat" >Sair</a> -->
                                                <button type="submit" class="btn btn-primary btn-block btn-flat">Sair</button>
                                            </form>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>

                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${pageContext.request.contextPath}/arquivos/imagens/geo_logo.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${userLogado.userLogado.getPrimeiroNome()}</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>        
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu" data-widget="tree">                      
                        <li class="header">ATIVIDADE</li>
                        <li><a href="${linkTo[ProjetoController].listaCliente}"><i class="fa fa-building-o"></i> <span>Projeto</span></a></li>
                        <li><a href="${linkTo[LicencaController].listaCliente}"><i class="fa fa-newspaper-o"></i> <span>Licença</span></a></li>
                        <li><a href="${linkTo[ServicoController].listaCliente}"><i class="fa fa-wrench"></i> <span>Serviço</span></a></li>                                                                
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                    <sitemesh:write property='body'/>     
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Versão</b> 1.0
                </div>
                <strong>Copyright &copy; 2017 <a href="#">Rafael Delanhese</a>.</strong> All rights
                reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane" id="control-sidebar-home-tab">


                    </div>
                    <!-- /.tab-pane -->

                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">Configurações Gerais</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Uso do painel de relatórios
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Algumas informações sobre a opção de configurações gerais
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Permitir o redirecionamento de email
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Existem outros conjuntos de opções disponíveis
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Expor o nome do autor nas postagens
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Permitir que o usuário mostre seu nome nas postagens
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <h3 class="control-sidebar-heading">Configurações do Chat</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Mostre-me como online
                                    <input type="checkbox" class="pull-right" checked>
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Desligar notificações
                                    <input type="checkbox" class="pull-right">
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Deletar histórico do chat
                                    <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                                </label>
                            </div>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>

        </div>
        <!-- ./wrapper -->

        <!-- CK Editor -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/ckeditor/ckeditor.js"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="${pageContext.request.contextPath}/arquivos/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- jQuery 3 -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Select2 -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/select2/dist/js/select2.full.min.js"></script>            
        <!-- InputMask -->
        <script src="${pageContext.request.contextPath}/arquivos/plugins/input-mask/jquery.inputmask.js"></script>
        <script src="${pageContext.request.contextPath}/arquivos/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="${pageContext.request.contextPath}/arquivos/plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <!-- FastClick -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/arquivos/dist/js/adminlte.min.js"></script>
        <!-- Sparkline -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
        <!-- jvectormap  -->
        <script src="${pageContext.request.contextPath}/arquivos/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/arquivos/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- SlimScroll -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- ChartJS -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/chart.js/Chart.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="${pageContext.request.contextPath}/arquivos/dist/js/pages/dashboard2.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/arquivos/dist/js/demo.js"></script>
        <script src="${pageContext.request.contextPath}/arquivos/mascaras/jquery.maskedinput.js" type="text/javascript"></script>
        <!-- bootstrap datepicker -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <!-- DataTables -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

        <!-- Validações -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/arquivos/validacoes/validaCampos.js"></script>

        <!-- bootstrap datepicker -->
        <script src="${pageContext.request.contextPath}/arquivos/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

        <!-- Notificações -->
        <script src="${pageContext.request.contextPath}/arquivos/notificacao/notify.js"></script>
        <script src="${pageContext.request.contextPath}/arquivos/notificacao/notify.min.js"></script>

        <!-- Máscara Money 
        <script type="text/javascript" src="../arquivos/mascaras/jquery.js"></script>
        <script type="text/javascript" src="../arquivos/mascaras/jquery.maskMoney.min.js"></script>-->

        <script type="text/javascript">

            function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e) {
                var sep = 0;
                var key = '';
                var i = j = 0;
                var len = len2 = 0;
                var strCheck = '0123456789';
                var aux = aux2 = '';
                var whichCode = (window.Event) ? e.which : e.keyCode;
                if (whichCode === 13 || whichCode === 8)
                    return true;
                key = String.fromCharCode(whichCode); // Valor para o código da Chave  
                if (strCheck.indexOf(key) === -1)
                    return false; // Chave inválida  
                len = objTextBox.value.length;
                for (i = 0; i < len; i++)
                    if ((objTextBox.value.charAt(i) !== '0') && (objTextBox.value.charAt(i) !== SeparadorDecimal))
                        break;
                aux = '';
                for (; i < len; i++)
                    if (strCheck.indexOf(objTextBox.value.charAt(i)) !== -1)
                        aux += objTextBox.value.charAt(i);
                aux += key;
                len = aux.length;
                if (len === 0)
                    objTextBox.value = '';
                if (len === 1)
                    objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
                if (len === 2)
                    objTextBox.value = '0' + SeparadorDecimal + aux;
                if (len > 2) {
                    aux2 = '';
                    for (j = 0, i = len - 3; i >= 0; i--) {
                        if (j === 3) {
                            aux2 += SeparadorMilesimo;
                            j = 0;
                        }
                        aux2 += aux.charAt(i);
                        j++;
                    }
                    objTextBox.value = '';
                    len2 = aux2.length;
                    for (i = len2 - 1; i >= 0; i--)
                        objTextBox.value += aux2.charAt(i);
                    objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
                }
                return false;
            }
        </script>	

        <script>
            $(function () {
                $('#tabela_setor').DataTable({
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                    'autoWidth': true
                });
            });

            $(function () {
                $('#tabela_orcamento').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': true
                });
            });

            $(function () {
                $('#tabelaParcela').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': true
                });
            });

        </script>
    </body>
</html>
