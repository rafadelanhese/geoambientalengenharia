
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div>
            <h1>
                GERAR CONTAS
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
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">CONTAS À PAGAR</h3>
                </div>
                <div class="box-body">
                    <!-- form start -->
                    <form  class="form-horizontal" action="${linkTo[ContasPagarController].adiciona}" method="POST">
                        <div class="box-body">                     
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="contasPagar.idContasPagar" value="${contasPagar.idContasPagar}" style="display: none"/>

                            <div class="form-group">
                                <label for="estado" class="col-sm-2 control-label">Tipo Despesa</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" name="contasPagar.tipoDespesa.idTipoDespesa">
                                        <option value="">Selecione um tipo de despesa...</option>
                                        <c:forEach items="${tipoDespesaList}" var="despesa">
                                            <option value="${despesa.idTipoDespesa}" ${contasPagar.tipoDespesa.idTipoDespesa eq despesa.idTipoDespesa ? 'selected' : ''}>${despesa.descricao}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('contasPagar.tipoDespesa.idTipoDespesa')}</span>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="pessoa" class="col-sm-2 control-label">Tipo de Pessoa</label>                                
                                <div class="col-sm-10" id="dOpcao">
                                    <select class="form-control" name="contasPagar.pessoa" id="tipoPessoa">
                                        <option value="">Selecione uma opção</option>
                                        <option value="PessoaFisica" ${contasPagar.pessoa.getClass().getSimpleName() eq 'PessoaFisica' ? 'selected' : ''}>PESSOA FÍSICA</option>
                                        <option value="PessoaJuridica" ${contasPagar.pessoa.getClass().getSimpleName() eq 'PessoaJuridica' ? 'selected' : ''}>PESSOA JURÍDICA</option>
                                    </select>
                                    <span class="help-block" id="sOpcao" />
                                </div>
                            </div>

                            <div class="form-group" id="comboPessoa">
                                <label class="col-sm-2 control-label">Fornecedor</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" id="pessoaSelect" name="contasPagar.pessoa.idPessoa" disabled>

                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('contasPagar.pessoa.idPessoa')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Observações</label>                                
                                <div class="col-sm-7" >
                                    <input type="text" class="form-control" name="contasPagar.observacao" value="${contasPagar.observacao}" placeholder="Observações" />
                                    <span class="help-block" style="color: red">${errors.from('contaspagar.observacao')}</span>                                    
                                </div>

                                <label for="nome" class="col-sm-1 control-label">Lançar</label>                                
                                <div class="col-sm-2" id="dDataInicio">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>                                        
                                        <input type="text" class="form-control pull-right" name="lancarParcelas" value="${contasPagar.datalancamento.toString("dd/MM/yyyy")}" id="datepickerLancarParcelas">
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('lancarParcelas')}</span>
                                </div>              
                            </div>                                

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Valor Total</label>                                
                                <div class="col-sm-7" >
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" class="form-control" name="valor" value="${contasPagar.valorTotal()}" id="valor" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('valor')}</span>
                                </div>

                                <label class="col-sm-1 control-label">Parcelas</label>                                
                                <div class="col-sm-2">
                                    <select class="form-control" id="estadosSelect" name="qtdeParcelas">
                                        <option value="">Selecione...</option>
                                        <c:forEach begin="1" end="60" varStatus="qtdeParcelas">
                                            <option value="${qtdeParcelas.count}" ${contasPagar.parcelas.size() eq qtdeParcelas.count ? 'selected' : ''}>${qtdeParcelas.count}X</option>
                                        </c:forEach>
                                    </select>                                    
                                    <span class="help-block" style="color: red">${errors.from('qtdeParcelas')}</span>
                                </div>               
                            </div>
                        </div>                
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <a href="${linkTo[ContasPagarController].lista}" class="btn btn-default">Voltar</a>
                            <button type="submit" class="btn btn-primary pull-right">Registrar</button>
                        </div>
                        <!-- /.box-footer -->
                    </form>
                </div>
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
                                                if (selecionado === "Selecionar")
                                                     $('#pessoaSelect').attr('disabled', 'true');
                                                else
                                                    buscaPessoa(selecionado, "");
                                            });

                                            function buscaPessoa(tipoPessoa, selecionado) {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/contaspagar/buscaPessoa/' + tipoPessoa,
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
                                                        $.notify("Erro ao buscar fornecedores", "erros");
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
                                                if ('${contasPagar.idContasPagar}') {
                                                    if ($('#tipoPessoa').val() !== "0") {
                                                        //BUSCA PESSOA E SELECIONA                                                        
                                                        buscaPessoa($('#tipoPessoa').val(), '${contasPagar.pessoa.idPessoa}');
                                                    }
                                                }

                                            });
        </script>
    </body>
</html>