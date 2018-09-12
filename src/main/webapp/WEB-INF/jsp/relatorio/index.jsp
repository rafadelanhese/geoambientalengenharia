<%-- 
    Document   : index
    Created on : 23/05/2018, 16:25:32
    Author     : Rafael Delanhese
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div>
            <h1>
                RELATÓRIOS               
            </h1>
            <c:if test="${not empty errors}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                    <c:forEach var="error" items="${errors}">
                        ${error.message}<br />
                    </c:forEach>
                </div>
            </c:if>
            <!-- Default box -->
            <div class="box">
                <div class="box-header">
                    <div class="form-horizontal">
                        <label class="col-sm-2 control-label">Tipo de Relatório</label>                                
                        <div class="col-sm-5">
                            <select class="form-control" id="tipoRelatorio" >
                                <option value="">Selecione uma opção</option>
                                <option value="Cliente">Cliente</option> 
                                <option value="Projeto">Projeto</option>
                                <option value="Licenca">Licença</option>
                                <option value="Servico">Serviço</option>
                                <option value="Orcamento">Orçamento</option>
                                <option value="CP">Contas à Pagar</option>
                                <option value="CR">Contas à Receber</option>
                            </select>
                            <span class="help-block" id="sOpcao" />
                        </div>  

                        <div id="filtro">
                            <label class="col-sm-1 control-label">Filtro</label>                                
                            <div class="col-sm-4">
                                <select class="form-control" id="sFiltro" disabled>

                                </select>
                                <span class="help-block" id="sOpcao" />
                            </div>
                        </div>             
                    </div>
                </div>                
            </div>     

            <!-- RELATÓRIO POR PESSOA-->
            <div class="box box-primary" id="relPessoa" style="display: none">
                <div class="box-header with-border">
                    <h3 class="box-title">RELATÓRIO POR PESSOA</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <form action="${linkTo[RelatorioController].relatorioPorCliente}" method="POST" target="blank">                
                    <div class="box-body">
                        <!-- form start -->                    
                        <div class="box-body">                                            
                            <div class="form-horizontal">
                                <input type="text" class="form-control" name="tipoRelatorio" id="idTipoRelatorio" style="display: none"/>                                

                                <label class="col-sm-2 control-label">Pessoa</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" name="idChave">
                                        <option value="">Selecione uma Pessoa...</option>
                                        <c:forEach items="${pessoaList}" var="pessoa">
                                            <option value="${pessoa.idPessoa}">${pessoa.nome}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block"/>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">                        
                        <button type="submit" class="btn btn-primary pull-right">Gerar</button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>

            <!-- RELATÓRIO  FAIXA DE DATAS-->
            <div class="box box-primary" id="relFaixaDatas" style="display: none">
                <div class="box-header with-border">
                    <h3 class="box-title">RELATÓRIO POR FAIXA DE DATAS</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <form action="${linkTo[RelatorioController].relatorioFaixaData}" method="POST" target="blank">                
                    <div class="box-body">
                        <!-- form start -->                    
                        <div class="box-body">                                            
                            <div class="form-horizontal">
                                <input type="text" class="form-control" name="tipoRelatorio" id="idTipoRelatorioData" style="display: none"/>                                
                                <div class="form-horizontal">
                                    <label class="col-sm-2 control-label">Data Inicial</label>                                
                                    <div class="col-sm-4">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>                                        
                                            <input type="text" class="form-control pull-right" name="dataInicio" id="datepickerInicial">
                                        </div>
                                        <span class="help-block" style="color: red"/>
                                    </div> 

                                    <label class="col-sm-2 control-label">Data Final</label>                                
                                    <div class="col-sm-4">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" name="dataFinal" id="datepickerFinal">
                                        </div>
                                        <span class="help-block" style="color: red"/>
                                    </div>                                   
                                </div>           
                            </div>

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">                        
                        <button type="submit" class="btn btn-primary pull-right">Gerar</button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>

            <!-- RELATÓRIO POR CIDADE-->
            <div class="box box-primary" id="relCidade" style="display: none">
                <div class="box-header with-border">
                    <h3 class="box-title">RELATÓRIO POR CIDADE</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <form action="${linkTo[RelatorioController].relatorioPorCidade}" method="POST" target="blank">                
                    <div class="box-body">
                        <!-- form start -->                    
                        <div class="box-body">                                            
                            <div class="form-horizontal">
                                <input type="text" class="form-control" name="tipoRelatorio" id="idTipoRelatorioCidade" style="display: none"/>                                                                                               
                                <div class="form-horizontal">
                                    <label class="col-sm-2 control-label">Estado</label>                                
                                    <div class="col-sm-5">
                                        <select class="form-control" id="estadosSelect">
                                            <option value="">Selecione um estado...</option>
                                            <c:forEach items="${estadoList}" var="estado">
                                                <option value="${estado.idEstado}">${estado.nome}</option>
                                            </c:forEach>
                                        </select>
                                        <span class="help-block" style="color: red" />
                                    </div>

                                    <!--CIDADE-->
                                    <label class="col-sm-1 control-label">Cidade</label>                                
                                    <div class="col-sm-4">
                                        <select class="form-control" id="cidadesSelect" name="idChave" disabled>

                                        </select>
                                        <span class="help-block" style="color: red" />
                                    </div>
                                </div>           
                            </div>

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">                        
                        <button type="submit" class="btn btn-primary pull-right">Gerar</button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>    

            <!-- RELATÓRIO POR SETOR-->
            <div class="box box-primary" id="relSetor" style="display: none">
                <div class="box-header with-border">
                    <h3 class="box-title">RELATÓRIO POR SETOR</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <form action="${linkTo[RelatorioController].relatorioPorSetor}" method="POST" target="blank">                
                    <div class="box-body">
                        <!-- form start -->                    
                        <div class="box-body">                                            
                            <div class="form-horizontal">
                                <input type="text" class="form-control" name="tipoRelatorio" id="idTipoRelatorioSetor" style="display: none"/>                                                                                               
                                <div class="form-horizontal">
                                    <input type="text" class="form-control" name="filtro" id="idFiltro" style="display: none"/>
                                    <label class="col-sm-2 control-label">Setor</label>                                
                                    <div class="col-sm-10">
                                        <select class="form-control" name="idChave">
                                            <option value="">Selecione um Setor...</option>
                                            <c:forEach items="${setorList}" var="setor">
                                                <option value="${setor.idSetor}" ${atividade.setor.idSetor eq setor.idSetor ? 'selected' : ''}>${setor.descricao}</option>
                                            </c:forEach>
                                        </select>
                                        <span class="help-block"/>
                                    </div>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">                        
                        <button type="submit" class="btn btn-primary pull-right">Gerar</button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>    

        </div>
        <!-- /.box --> 
        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>
        <script>
            $('#tipoRelatorio').on('change', function () {
                var self = $(this);
                var selecionado = self.val(); // pega o ID do estado
                desabilitaTodosRelatorios();
                if (selecionado === "") {
                    $.notify("É necessário selecionar um tipo de relatório", "error");
                    $('#sFiltro').attr('disabled', 'true');
                } else {
                    $('#sFiltro').removeAttr('disabled');
                    var options = [];
                    options.push('<option value="">Selecione um filtro...</option>');
                    if (selecionado === "Cliente") {
                        options.push('<option value="Cidade">Cidade</option>');
                        options.push('<option value="Setor">Setor</option>');
                    } else {
                        if (selecionado === "Projeto" | selecionado === "Licenca" | selecionado === "Servico") {
                            options.push('<option value="FaixaDatas">Faixa de Datas</option>');
                            options.push('<option value="Cliente">Cliente</option>');
                            options.push('<option value="Cidade">Cidade</option>');
                        } else {
                            if (selecionado === "Orcamento") {
                                options.push('<option value="FaixaDatas">Faixa de Datas</option>');
                                options.push('<option value="Cliente">Cliente</option>');
                                options.push('<option value="Cidade">Cidade</option>');                                
                            } else {
                                if (selecionado === "CP" | selecionado === "CR") {
                                    options.push('<option value="FaixaDatas">Faixa de Datas</option>');
                                    options.push('<option value="Cliente">Fornecedor</option>');
                                }
                            }
                        }
                    }
                    $('#sFiltro').html(options.join(''));
                    $('#sFiltro').val("");
                }
            });

            $('#sFiltro').on('change', function () {
                var self = $(this);
                var filtro = self.val();
                var tipoRelatorio = $("#tipoRelatorio").val();
                desabilitaTodosRelatorios();
                if (filtro === "") {
                    $.notify("É necessário selecionar um filtro", "error");
                } else {
                    if (tipoRelatorio === "Cliente" && filtro === "Setor") {
                        $('#idTipoRelatorioSetor').val(tipoRelatorio);
                        $("#relSetor").css("display", "block");
                    } else {
                        if ((tipoRelatorio === "Projeto" || tipoRelatorio === "Licenca" || tipoRelatorio === "Servico" || tipoRelatorio === "Orcamento" || tipoRelatorio === "CP" || tipoRelatorio === "CR") && filtro === "Cliente") {
                            $('#idTipoRelatorio').val(tipoRelatorio);
                            $("#relPessoa").css("display", "block");
                        } else {
                            if ((tipoRelatorio === "Projeto" || tipoRelatorio === "Licenca" || tipoRelatorio === "Servico" || tipoRelatorio === "Orcamento" || tipoRelatorio === "CP" || tipoRelatorio === "CR") && filtro === "FaixaDatas") {
                                $('#idTipoRelatorioData').val(tipoRelatorio);
                                $("#relFaixaDatas").css("display", "block");
                            } else {
                                if ((tipoRelatorio === "Cliente" || tipoRelatorio === "Projeto" || tipoRelatorio === "Licenca" || tipoRelatorio === "Servico" || tipoRelatorio === "Orcamento") && filtro === "Cidade") {
                                    $('#idTipoRelatorioCidade').val(tipoRelatorio);
                                    $("#relCidade").css("display", "block");
                                }
                            }
                        }
                    }
                }
            });

            $('#estadosSelect').on('change', function () {
                var self = $(this);
                var selecionado = self.val(); // pega o ID do estado
                if (selecionado === "0") {
                    $('#cidadesSelect').attr('disabled', 'true');
                    $.notify("É necessário selecionar um estado", "error");
                } else
                    carregaCidadeIdEstado(selecionado, 0);
            });

            function desabilitaTodosRelatorios() {
                $("#relSetor").css("display", "none");
                $("#relPessoa").css("display", "none");
                $("#relFaixaDatas").css("display", "none");
                $("#relCidade").css("display", "none");
            }

            function carregaCidadeIdEstado(idEstado, idCidade) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/relatorio/buscaCidades/' + idEstado,
                    method: 'GET',
                    cache: false,
                    dataType: 'json', // O Server vai retornar um JSON
                    success: function (data) {
                        // Precisa transformar de json para objeto html
                        var options = [];
                        options.push('<option value="0">Selecione uma cidade...</option>'); // colocando a primeira option...
                        for (var i = 0; i < data.length; i++) {
                            options.push('<option value="' + data[i].idCidade + '">' + data[i].nome + '</option>');
                        }
                        // Agora precisa juntar esses options dentro da combo de cidades
                        $('#cidadesSelect').html(options.join(''));
                        $('#cidadesSelect').val(idCidade);
                        $('#cidadesSelect').removeAttr('disabled');
                    },
                    error: function () {
                        $.notify("Erro ao buscar cidade", "error");
                    }
                });
            }
            ;
     
            $(function () {

                //Date picker
                $('#datepickerInicial').datepicker({
                    format: 'dd/mm/yyyy',
                    autoclose: true
                });

                //Date picker
                $('#datepickerFinal').datepicker({
                    format: 'dd/mm/yyyy',
                    autoclose: true
                });
            });
        </script>
    </body>
</html>