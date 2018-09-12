<%-- 
    Document   : cadastro
    Created on : 11/09/2017, 22:26:39
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                CADASTRO<small>| Painel de Cadastro</small>
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
                    <h3 class="box-title">PESSOAS</h3>
                </div>
                <div class="box-body">                   
                    <form action="${linkTo[PessoaController].adiciona}" method="POST" id="formSalva">
                        <div class="box-body">                 
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="pessoa.idPessoa" value="${pessoa.idPessoa}" style="display: none"/>

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <!--VERIFICA SE HÁ ERROS, SE HOUVER SETA UMA DIV, SENÃO SETA OUTRA DIV COM ERRO-->
                                <div class="col-sm-10" id="dNome">
                                    <input type="text" class="form-control" name="pessoa.nome" value="${pessoa.nome}" id="nome" placeholder="Nome" onblur="validaCampoNome()" />
                                    <span class="help-block" style="color: red">${errors.from('pessoa.nome').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Opção</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" name="pessoa" id="opcaoPessoa">
                                        <option value="">Selecione uma opção</option>
                                        <option value="PessoaFisica" ${pessoa.getClass().getSimpleName() eq 'PessoaFisica' ? 'selected' : ''}>PESSOA FÍSICA</option>
                                        <option value="PessoaJuridica" ${pessoa.getClass().getSimpleName() eq 'PessoaJuridica' ? 'selected' : ''}>PESSOA JURÍDICA</option>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('tipoUsuario').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group" id="pessoaFisica" style="display: none">
                                <label class="col-sm-2 control-label">CPF</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="pessoa.cpf" value="${pessoafisica.cpf}" id="cpf" placeholder="CPF" onblur="validaCampoCPF()"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.cpf').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">RG</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="pessoa.rg" value="${pessoafisica.rg}" id="rg" placeholder="RG" onblur="validaCampoRG()"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.rg').join(' - ')}</span>
                                </div>
                            </div>                  

                            <div class="form-group" id="pessoaJuridica" style="display: none">
                                <label class="col-sm-2 control-label">CNPJ</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="pessoa.cnpj" value="${pessoajuridica.cnpj}" id="cnpj" placeholder="CNPJ" onblur="validaCampoCNPJ()"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.cnpj').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">I. E.</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="pessoa.ie" value="${pessoajuridica.ie}" id="ie" placeholder="Inscrição Estadual" onblur="validaCampoIE()"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.ie').join(' - ')}</span>
                                </div>
                            </div>

                            <!--TELEFONE-->
                            <div class="form-group">
                                <!--Campo id necessário para executar o mesmo form para criar e atualizar-->                                                           
                                <label for="telefone" class="col-sm-2 control-label">Telefone</label>                                
                                <input type="text" class="form-control" name="telefone" style="display: none"/>
                                <div class="col-sm-3" id="divTel">
                                    <input type="text" class="form-control" name="pessoa.telefone[0].idTelefone" value="${pessoa.telefone[0].idTelefone}" style="display: none"/>
                                    <input type="text" class="form-control" name="pessoa.telefone[0].telefone" value="${pessoa.telefone[0].telefone}" id="numeroTelefone" placeholder="Telefone"/>
                                    <span class="help-block">${errors.from('telefone.telefone')}</span>
                                </div>

                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="pessoa.telefone[0].descricao" value="${pessoa.telefone[0].descricao}" placeholder="Telefone Descrição, ex: Casa, Trabalho"/>
                                    <span class="help-block">${errors.from('telefone.descricao')}</span>
                                </div>                                
                            </div>

                            <div class="form-group">
                                <!--Campo id necessário para executar o mesmo form para criar e atualizar-->                                                           
                                <label for="telefone" class="col-sm-2 control-label">Celular </label>                                

                                <div class="col-sm-3" id="divTel">
                                    <input type="text" class="form-control" name="pessoa.telefone[1].idTelefone" value="${pessoa.telefone[1].idTelefone}" style="display: none"/>
                                    <input type="text" class="form-control" name="pessoa.telefone[1].telefone" value="${pessoa.telefone[1].telefone}" id="celular" placeholder="Telefone"/>
                                    <span class="help-block">${errors.from('telefone.telefone')}</span>
                                </div>

                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="pessoa.telefone[1].descricao" value="${pessoa.telefone[1].descricao}" placeholder="Telefone Descrição, ex: Casa, Trabalho"/>
                                    <span class="help-block">${errors.from('telefone.descricao')}</span>
                                </div>                               
                            </div>


                            <!--TELEFONE-->
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="pessoa.endereco.idEndereco" value="${pessoa.endereco.idEndereco}" style="display: none"/>
                            <input type="text" class="form-control" name="pessoa.endereco" value="endereco" style="display: none"/>
                            <div class="form-group">
                                <label for="estado" class="col-sm-2 control-label">Estado</label>                                
                                <div class="col-sm-5">
                                    <select class="form-control" id="estadosSelect">
                                        <option value="">Selecione um estado...</option>
                                        <c:forEach items="${estadoList}" var="estado">
                                            <option value="${estado.idEstado}" ${pessoa.endereco.cidade.estado.idEstado eq estado.idEstado ? 'selected' : '0'}>${estado.nome}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block">${errors.from('estado.nome')}</span>
                                </div>

                                <!--CIDADE-->
                                <label class="col-sm-1 control-label">Cidade</label>                                
                                <div class="col-sm-4">
                                    <select class="form-control" id="cidadesSelect" name="pessoa.endereco.cidade" disabled>

                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.endereco.cidade').join(' - ')}</span>
                                </div>
                            </div>       

                            <div class="form-group">
                                <label for="rua" class="col-sm-2 control-label">Rua</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="pessoa.endereco.rua" value="${pessoa.endereco.rua}" placeholder="Rua" id="rua"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.endereco.rua').join(' - ')}</span>
                                </div>

                                <label for="numero" class="col-sm-1 control-label">Número</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="pessoa.endereco.numero" value="${pessoa.endereco.numero}" placeholder="Número" onkeyup="somenteNumeros(this);" />
                                    <span class="help-block" style="color: red">${errors.from('pessoa.endereco.numero').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="bairro" class="col-sm-2 control-label">Bairro</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="pessoa.endereco.bairro" value="${pessoa.endereco.bairro}" placeholder="Bairro" id="bairro"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.endereco.bairro').join(' - ')}</span>
                                </div>

                                <label for="cep" class="col-sm-1 control-label">CEP</label>                                
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="pessoa.endereco.cep" value="${pessoa.endereco.cep}" placeholder="CEP" id="cep" />
                                    <span class="help-block" style="color: red">${errors.from('pessoa.endereco.cep').join(' - ')}</span>
                                </div>         
                            </div>

                            <div class="form-group">
                                <label for="complemento" class="col-sm-2 control-label">Complemento</label>                                
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="pessoa.endereco.complemento" value="${pessoa.endereco.complemento}" placeholder="Complemento" id="complemento"/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.endereco.complemento').join(' - ')}</span>
                                </div>
                            </div>                           

                            <div class="form-group">
                                <label for="setor" class="col-sm-2 control-label">Setor</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" name="pessoa.setor">
                                        <option value="">Selecione um Setor...</option>
                                        <c:forEach items="${setorList}" var="setor">
                                            <option value="${setor.idSetor}" ${pessoa.setor.idSetor eq setor.idSetor ? 'selected' : ''}>${setor.descricao}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.setor.idSetor').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">E-mail</label>                                
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="pessoa.email" value="${pessoa.email}" placeholder="E-mail" />
                                    <span class="help-block" style="color: red">${errors.from('pessoa.email').join(' - ')}</span>
                                </div>

                                <label class="col-sm-1 control-label">Senha</label>                                
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" name="pessoa.senha" value="${pessoa.senha}" placeholder="Senha" <c:if test="${not empty pessoa.idPessoa}">  readonly </c:if>/>
                                    <span class="help-block" style="color: red">${errors.from('pessoa.senha').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tipo Usuário</label>                                
                                <div class="col-sm-10">                                                                          
                                    <c:forEach items="${tipoList}" var="tipo_usuario" varStatus="s">
                                        <input type="checkbox" class="minimal"  name="tipo_usuario[${s.index}]" value="${tipo_usuario.idTipoUsuario}" <c:if test="${fn:contains(pessoa.tipousuario, tipo_usuario)}">  checked="checked" </c:if> /> ${tipo_usuario.descricao}<br/>                                            
                                    </c:forEach> 
                                    <span class="help-block" style="color: red">${errors.from('pessoa.tipousuario').join(' - ')}</span>                                   
                                </div>
                            </div>                                                      
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <a href="${linkTo[PessoaController].lista}" class="btn btn-default">Voltar</a>
                            <button type="submit" class="btn btn-primary pull-right">Registrar</button>
                        </div>
                        <!-- /.box-footer -->
                    </form>
                </div>
            </div>
            <!-- /.box --> 
        </div>       

        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>

        <!-- BUSCA ENDEREÇO PELO CEP  -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" 
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>        
        <script type="text/javascript" src="../arquivos/js/pessoaJS.js"></script>  
        <script>
                                        $("#opcaoPessoa").change(function () {
                                            mudaOpcaoPessoa();
                                        });

                                        $('#estadosSelect').on('change', function () {
                                            var self = $(this);
                                            var selecionado = self.val(); // pega o ID do estado
                                            if (selecionado === "") {
                                                $('#cidadesSelect').attr('disabled', 'true');
                                                $.notify("É necessário selecionar um estado", "error");
                                            } else
                                                carregaCidadeIdEstado(selecionado, 0);
                                        });

                                        function carregaCidadeIdEstado(idEstado, idCidade) {
                                            $.ajax({
                                                url: '${pageContext.request.contextPath}/pessoa/buscaCidades/' + idEstado,
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
                                                    $('#cidadesSelect').removeAttr('disabled');
                                                    $('#cidadesSelect').val(idCidade);
                                                },
                                                error: function () {
                                                    $.notify("Erro ao buscar cidade", "error");
                                                }
                                            });
                                        }
                                        ;

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
                                            $("#complemento").val("");
                                            $("#uf").val("");
                                            $("#ibge").val("");
                                        }

                                        function selecionaEstadoECidade(nomeCidade) {
                                            //FUNÇÃO QUE BUSCA CIDADE POR NOME E SELECIONA A CIDADE
                                            $.ajax({
                                                url: '${pageContext.request.contextPath}/pessoa/buscaCidadePorNome/' + nomeCidade,
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

                                        /*
                                         * AO CARREGAR A PÁGINA VERIFICA SE NÃO É PARA ATUALIZAR A ENTIDADE
                                         * 
                                         */
                                        $(function () {
                                            //RECUPERA CAMPOS NO FORM DE EDIÇÃO
                                            if ('${pessoa.idPessoa}') {
                                                if ($('#opcaoPessoa').val() !== "0") {
                                                    mudaOpcaoPessoa();
                                                }

                                                if ($("#estadosSelect").val() !== "0") {
                                                    carregaCidadeIdEstado($("#estadosSelect").val(), '${pessoa.endereco.cidade.idCidade}');
                                                }

                                                //LOAD DA TABELA DE ITENS
                                                $("#tabelaItens").load("tabela #tabelaAtualiza");
                                            }
                                        });
        </script>
    </body>
</html>
