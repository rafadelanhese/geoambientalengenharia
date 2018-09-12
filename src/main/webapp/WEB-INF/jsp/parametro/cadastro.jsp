<%-- 
    Document   : cadastro
    Created on : 29/04/2018, 15:26:28
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
                CADASTRO
                <small>| Painel de Cadastro</small>
            </h1>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">PARÂMETRO</h3>
                </div>
                <form class="form-horizontal" action="${linkTo[ParametroController].salvar}" method="POST">
                    <div class="box-body">                                        
                        <div class="box-body">                 
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="parametro.idParametro" value="${parametro.idParametro}" style="display: none"/>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Nome da Empresa</label>                                
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="parametro.nome" value="${parametro.nome}" placeholder="Nome da Empresa"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.nome').join(' - ')}</span>
                                </div>
                            </div>

                            <!--TELEFONE-->
                            <div class="form-group">                                                                                 
                                <label class="col-sm-2 control-label">Telefone</label>                                                               
                                <div class="col-sm-5" id="divTel">                                    
                                    <input type="text" class="form-control" name="parametro.telefone" value="${parametro.telefone}" id="numeroTelefone" placeholder="Telefone"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.telefone').join(' - ')}</span>
                                </div> 

                                <label class="col-sm-1 control-label">CNPJ</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="parametro.cnpj" value="${parametro.cnpj}" id="cnpj" placeholder="CNPJ" onblur="validaCampoCNPJ()"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.cnpj').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">E-mail</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="parametro.email" value="${parametro.email}" placeholder="E-mail" />
                                    <span class="help-block" style="color: red">${errors.from('parametro.email').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">Site</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="parametro.site" value="${parametro.site}" placeholder="Site"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.site').join(' - ')}</span>
                                </div>
                            </div>                  

                            <!--ENDEREÇO-->                            
                            <input type="text" class="form-control" name="parametro.endereco.idEndereco" value="${parametro.endereco.idEndereco}" style="display: none"/>                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Estado</label>                                
                                <div class="col-sm-5">
                                    <select class="form-control" id="estadosSelect">
                                        <option>Selecione um estado...</option>
                                        <c:forEach items="${estadoList}" var="estado">
                                            <option value="${estado.idEstado}">${estado.nome}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('parametro.estado').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">Cidade</label>                                
                                <div class="col-sm-4">
                                    <select class="form-control" id="cidadesSelect" name="parametro.endereco.cidade" disabled>

                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('parametro.endereco.cidade.idCidade').join(' - ')}</span>
                                </div>
                            </div>                      

                            <div class="form-group">
                                <label for="rua" class="col-sm-2 control-label">Rua</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="parametro.endereco.rua" value="${parametro.endereco.rua}" placeholder="Rua" id="rua"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.endereco.rua').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">Número</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="parametro.endereco.numero" value="${parametro.endereco.numero}" placeholder="Número" onkeyup="somenteNumeros(this);" />
                                    <span class="help-block" style="color: red">${errors.from('parametro.endereco.numero').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Bairro</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="parametro.endereco.bairro" value="${parametro.endereco.bairro}" placeholder="Bairro" id="bairro"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.endereco.bairro').join(' - ')}</span>
                                </div>

                                <label  class="col-sm-1 control-label">CEP</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="parametro.endereco.cep" value="${parametro.endereco.cep}" placeholder="CEP" id="cep" />
                                    <span class="help-block" style="color: red">${errors.from('parametro.endereco.cep').join(' - ')}</span>
                                </div>         
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Complemento</label>                                
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="parametro.endereco.complemento" value="${parametro.endereco.complemento}" placeholder="Complemento" id="complemento"/>
                                    <span class="help-block" style="color: red">${errors.from('parametro.endereco.complemento').join(' - ')}</span>
                                </div>
                            </div>                           

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <a href="${linkTo[ParametroController].lista}" class="btn btn-default">Voltar</a>
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

        <!-- BUSCA ENDEREÇO PELO CEP  -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" 
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>        
        <script type="text/javascript" src="../arquivos/js/parametroJS.js"></script>    

        <script>
                                        $(function () {
                                            //VERIFICA SE É FORMULÁRIO DE EDIÇÃO
                                            if ('${parametro.idParametro}') {
                                                $('#estadosSelect').val('${parametro.endereco.cidade.estado.idEstado}');
                                                buscaCidade('${parametro.endereco.cidade.estado.idEstado}');
                                                setTimeout(function () {
                                                    $('#cidadesSelect').val('${parametro.endereco.cidade.idCidade}');
                                                }, 1000);
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

//Quando o campo cep perde o foco.
                                        $("#cep").blur(function () {

//Nova variável "cep" somente com dígitos.
                                            var cep = $(this).val().replace(/\D/g, '');
                                            //Verifica se campo cep possui valor informado.
                                            if (cep !== "") {

                                                //Expressão regular para validar o CEP.
                                                var validacep = /^[0-9]{8}$/;
                                                //Valida o formato do CEP.
                                                if (validacep.test(cep)) {

                                                    //Preenche os campos com "..." enquanto consulta webservice.
                                                    $("#rua").val("Buscando endereço");
                                                    $("#bairro").val("Buscando endereço");
                                                    $.notify("Buscando CEP: " + $("#cep").val(), "info");
                                                    //Consulta o webservice viacep.com.br/
                                                    $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                                                        if (!("erro" in dados)) {
                                                            //Atualiza os campos com os valores da consulta.
                                                            $("#rua").val(dados.logradouro);
                                                            $("#bairro").val(dados.bairro);
                                                            $("#complemento").val(dados.complemento);
                                                            selecionaEstadoECidade(dados.localidade);
                                                            $.notify("CEP encontrado", "success");
                                                        } //end if.
                                                        else {
                                                            //CEP pesquisado não foi encontrado.
                                                            limpa_formulario_cep();
                                                            $.notify("CEP não encontrado", "error");
                                                        }
                                                    });
                                                } //end if.
                                                else {
//cep é inválido.
                                                    limpa_formulario_cep();
                                                    $.notify("Formato de CEP inválido", "error");
                                                }
                                            } //end if.
                                            else {
//cep sem valor, limpa formulário.
                                                limpa_formulario_cep();
                                            }
                                        });

                                        function limpa_formulario_cep() {
                                            // Limpa valores do formulário de cep.
                                            $("#rua").val("");
                                            $("#bairro").val("");
                                            $("#cidade").val("");
                                            $("#uf").val("");
                                            $("#ibge").val("");
                                            $("#complemento").val("");
                                        }

                                        function selecionaEstadoECidade(nomeCidade) {
                                            //FUNÇÃO QUE BUSCA CIDADE POR NOME E SELECIONA A CIDADE
                                            $.ajax({
                                                url: '${pageContext.request.contextPath}/parametro/buscaCidadePorNome/' + nomeCidade,
                                                method: 'GET',
                                                cache: false,
                                                dataType: 'json', // O Server vai retornar um JSON
                                                success: function (data) {
                                                    $("#estadosSelect").val(data.estado.idEstado);
                                                    carregaCidadeIdEstado(data.estado.idEstado, data.idCidade);
                                                    $.notify("Cidade selecionada com sucesso", "success");
                                                },
                                                error: function () {
                                                    $.notify("Erro ao selecionar Cidade", "erros");
                                                }
                                            });
                                        }

                                        function carregaCidadeIdEstado(idEstado, idCidade) {
                                            $.ajax({
                                                url: '${pageContext.request.contextPath}/parametro/buscaCidades/' + idEstado,
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
        </script>
    </body>
</html>
