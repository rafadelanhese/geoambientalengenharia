<%-- 
    Document   : gerar
    Created on : 12/03/2018, 17:29:06
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
                GERAR CONTAS À RECEBER
                <small>| Painel de Contas</small>
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
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">CONTAS À RECEBER</h3>
                </div>
                <form action="${linkTo[ContasReceberController].adiciona}" method="POST">
                    <div class="box-body">
                        <!-- form start -->                   
                        <div class="box-body">                       
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="contasReceber.idContasReceber" value="${contasReceber.idContasReceber}" style="display: none"/>                            

                            <div class="form-group">
                                <label for="pessoa" class="col-sm-2 control-label">Tipo de Pessoa</label>                                
                                <div class="col-sm-10" id="dOpcao">
                                    <select class="form-control" name="contasReceber.pessoa" id="tipoPessoa">
                                        <option value="0">Selecione uma opção</option>
                                        <option value="PessoaFisica" ${contasReceber.atividade.pessoa.getClass().getSimpleName() eq 'PessoaFisica' ? 'selected' : ''}>PESSOA FÍSICA</option>
                                        <option value="PessoaJuridica" ${contasReceber.atividade.pessoa.getClass().getSimpleName() eq 'PessoaJuridica' ? 'selected' : ''}>PESSOA JURÍDICA</option>
                                    </select>
                                    <span class="help-block" id="sOpcao" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Pessoa</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" id="pessoaSelect" name="contasReceber.pessoa.idPessoa" disabled>

                                    </select>
                                    <span class="help-block">${errors.from('contasReceber.pessoa.nome')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Atividade</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" id="atividadeSelect" name="idAtividade" disabled>

                                    </select>
                                   <span class="help-block" style="color: red">${errors.from('atividade')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Observações</label>                                
                                <div class="col-sm-10" >
                                    <input type="text" class="form-control" name="contasReceber.observacoes" value="${contasReceber.observacoes}" placeholder="Observações" />
                                    <span class="help-block" style="color: red">${errors.from('contaspagar.observacoes')}</span>                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Data Recebimento</label>                                
                                <div class="col-sm-10" id="dDataInicio">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>                                        
                                        <input type="text" class="form-control pull-right" name="contasReceber.dataReceber" value="${contasReceber.dataReceber.toString("dd/MM/yyyy")}" id="datepickerLancarParcelas">
                                    </div>
                                   <span class="help-block" style="color: red">${errors.from('contasReceber.dataReceber')}</span>
                                </div>                                    
                            </div>         


                            <div class="form-group">
                                <label class="col-sm-2 control-label">Valor Total</label>                                
                                <div class="col-sm-10" >
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" class="form-control" name="contasReceber.valor" value="${l[contasReceber.valor].custom("valorMonetario")}" id="valor" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('contasReceber.valor')}</span>                                    
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <a href="${linkTo[ContasReceberController].listaContas}" class="btn btn-default">Voltar</a>
                        <button type="submit" class="btn btn-primary pull-right">Registrar</button>
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
                                            $('#tipoPessoa').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "Selecionar") {
                                                    $('#pessoaSelect').attr('disabled', 'true');
                                                    $.notify("É necessário selecionar um tipo de pessoa", "error");
                                                } else
                                                    buscaPessoa(selecionado, 0);
                                            });
                                            $('#pessoaSelect').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "0")
                                                    $.notify("Selecione uma pessoa", "error");
                                                else
                                                    buscaAtividade(selecionado, 0);
                                            });

                                            function buscaPessoa(tipoPessoa, selecionado) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/contasreceber/buscaPessoa/' + tipoPessoa,
                                                    //data: {estado: selecionado}, // Passa a variável ao server. O nome do parâmetro tem que ser estado, pois foi o nome colocado aqui.
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "0">Selecione uma pessoa...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idPessoa + '">' + data[i].nome + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#pessoaSelect').html(options.join(''));
                                                        $('#pessoaSelect').val(selecionado);
                                                        $('#pessoaSelect').removeAttr('disabled');
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao buscar pessoa", "error");
                                                    }
                                                });
                                            }
                                            ;

                                            function buscaAtividade(idPessoa, selecionado) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/contasreceber/buscaAtividade/' + idPessoa,
                                                    //data: {estado: selecionado}, // Passa a variável ao server. O nome do parâmetro tem que ser estado, pois foi o nome colocado aqui.
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "0">Selecione uma atividade...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idAtividade + '">' + [data[i].idAtividade] + " - " + data[i].descricao + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#atividadeSelect').html(options.join(''));
                                                        $('#atividadeSelect').val(selecionado);
                                                        $('#atividadeSelect').removeAttr('disabled');
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao buscar atividade", "error");
                                                    }
                                                });
                                            }
                                            ;


                                            $(function () {
                                                //Date picker
                                                $('#datepickerLancarParcelas').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });

                                                //RECUPERA CAMPOS NO FORM DE EDIÇÃO
                                                if ('${contasReceber.idContasReceber}') {
                                                    if ($('#tipoPessoa').val() !== "0") {
                                                        buscaPessoa($('#tipoPessoa').val(), '${contasReceber.atividade.pessoa.idPessoa}');
                                                        buscaAtividade('${contasReceber.atividade.pessoa.idPessoa}', '${contasReceber.atividade.idAtividade}');
                                                    }
                                                }
                                            });
        </script>
    </body>
</html>