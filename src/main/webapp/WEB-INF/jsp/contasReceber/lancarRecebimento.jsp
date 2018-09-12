<%-- 
    Document   : lancarRecebimento
    Created on : 15/03/2018, 16:47:56
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                CONTAS À RECEBER
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
                    <h3 class="box-title">LANÇAR RECEBIMENTO DE CONTA</h3>
                </div>
                <div class="box-body">
                    <!-- form start -->
                    <form action="${linkTo[ContasReceberController].adicionaParcelaRecebida}" method="POST">
                        <div class="box-body">                           
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="parcelaReceber.idParcelaReceber" value="${parcelaReceber.idParcelaReceber}" style="display: none"/>                            

                            <div class="form-group">
                                <label for="pessoa" class="col-sm-2 control-label">Tipo de Pessoa</label>                                
                                <div class="col-sm-10" id="dOpcao">
                                    <select class="form-control"  id="tipoPessoa">
                                        <option value="">Selecione uma opção</option>
                                        <option value="PessoaFisica" ${parcelaReceber.contasReceber.atividade.pessoa.getClass().getSimpleName() eq 'PessoaFisica' ? 'selected' : ''}>PESSOA FÍSICA</option>
                                        <option value="PessoaJuridica" ${parcelaReceber.contasReceber.atividade.pessoa.getClass().getSimpleName() eq 'PessoaJuridica' ? 'selected' : ''}>PESSOA JURÍDICA</option>
                                    </select>
                                    <span class="help-block" id="sOpcao" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Pessoa</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" id="pessoaSelect" disabled>

                                    </select>
                                    <span class="help-block">${errors.from('pessoa')}</span>                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Atividade</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" id="atividadeSelect" name="idAtividade" disabled>

                                    </select>
                                    <span class="help-block">${errors.from('atividade')}</span>
                                </div>
                            </div> 

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Conta à Receber</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" id="crSelect" name="parcelaReceber.contasReceber.idContasReceber" disabled>

                                    </select>  
                                   <span class="help-block" style="color: red">${errors.from('parcelaReceber.contasReceber.idContasReceber')}</span>
                                </div>
                            </div> 

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Data Recebimento</label>                                
                                <div class="col-sm-10" id="dDataInicio">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>                                        
                                        <input type="text" class="form-control pull-right" name="parcelaReceber.dataRecebido" value="${parcelaReceber.dataRecebido.toString("dd/MM/yyyy")}" id="dtpDataRecebimento">
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('parcelaReceber.dataRecebido')}</span>
                                </div>                                    
                            </div>         


                            <div class="form-group">
                                <label class="col-sm-2 control-label">Valor Total</label>                                
                                <div class="col-sm-10" >
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" class="form-control" name="parcelaReceber.valorRecebido" value="${l[parcelaReceber.valorRecebido].custom("valorMonetario")}" id="valor" placeholder="Valor Recebido" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('parcelaReceber.valorRecebido')}</span>                                    
                                </div>
                            </div>

                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="${linkTo[ContasReceberController].listaParcelasRecebidas}" class="btn btn-default">Voltar</a>
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
                                                if (selecionado === "") {
                                                    $('#pessoaSelect').attr('disabled', 'true');
                                                    $.notify("É necessário selecionar um tipo de pessoa", "error");
                                                } else
                                                    buscaPessoa(selecionado, "");
                                            });
                                            $('#pessoaSelect').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "")
                                                {
                                                    $('#atividadeSelect').attr('disabled', 'true');
                                                    $.notify("Selecione uma pessoa", "error");
                                                } else
                                                    buscaAtividade(selecionado, "");
                                            });

                                            $('#atividadeSelect').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "")
                                                {
                                                    $('#crSelect').attr('disabled', 'true');
                                                    $.notify("Selecione uma atividade", "error");
                                                } else
                                                    buscaContasReceber(selecionado, "");
                                            });

                                            function buscaPessoa(tipoPessoa, selecionado) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/contasreceber/buscaPessoa/' + tipoPessoa,
                                                    //data: {estado: selecionado}, // Passa a variável ao server. O nome do parâmetro tem que ser estado, pois foi o nome colocado aqui.
                                                    dataType: 'json', // O Server vai retornar um JSON
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "">Selecione uma pessoa...</option>'); // colocando a primeira option...
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
                                                        options.push('<option value= "">Selecione uma atividade...</option>'); // colocando a primeira option...
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

                                            function buscaContasReceber(idContaReceber, selecionado) {
                                                $.ajax({
                                                    method: 'GET',
                                                    url: '${pageContext.request.contextPath}/contasreceber/buscaContaReceber/' + idContaReceber,                                                    
                                                    dataType: 'json', 
                                                    cache: false,
                                                    success: function (data) {
                                                        // Precisa transformar de json para objeto html
                                                        var options = [];
                                                        options.push('<option value= "">Selecione uma conta à receber...</option>'); // colocando a primeira option...
                                                        for (var i = 0; i < data.length; i++) {
                                                            options.push('<option value="' + data[i].idContasReceber + '">' + [data[i].idContasReceber] + " - " + data[i].observacoes + '</option>');
                                                        }
                                                        // Agora precisa juntar esses options dentro da combo de cidades
                                                        $('#crSelect').html(options.join(''));
                                                        $('#crSelect').val(selecionado);
                                                        $('#crSelect').removeAttr('disabled');
                                                    },
                                                    error: function () {
                                                        $.notify("Erro ao buscar conta à receber", "error");
                                                    }
                                                });
                                            }
                                            ;


                                            $(function () {
                                                //Date picker
                                                $('#dtpDataRecebimento').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });

                                                //RECUPERA CAMPOS NO FORM DE EDIÇÃO
                                                if ('${parcelaReceber.idParcelaReceber}') {
                                                    if ($('#tipoPessoa').val() !== "0") {
                                                        //BUSCA PESSOA E SELECIONA                                                        
                                                        buscaPessoa($('#tipoPessoa').val(), '${parcelaReceber.contasReceber.atividade.pessoa.idPessoa}');
                                                        buscaAtividade('${parcelaReceber.contasReceber.atividade.pessoa.idPessoa}', '${parcelaReceber.contasReceber.atividade.idAtividade}');
                                                        buscaContasReceber('${parcelaReceber.contasReceber.atividade.idAtividade}', '${parcelaReceber.contasReceber.idContasReceber}');
                                                    }
                                                }
                                            });
        </script>
    </body>
</html>