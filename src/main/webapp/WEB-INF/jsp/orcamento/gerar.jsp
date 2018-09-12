<%-- 
    Document   : gerar
    Created on : 22/01/2018, 15:58:11
    Author     : Rafael Delanhese
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    GERAR ORÇAMENTO<small>| Painel de Orçamento</small>
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
            </div>
            <form action="${linkTo[OrcamentoController].adiciona}" method="POST">
                <!-- COMEÇO PASSO 1-->
                <div class="col-md-12">
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block"> 
                                <img class="img-circle" src="../arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="Geoambiental" />
                                <span class="username"><a href="#">PASSO 1</a></span>    
                                <span class="description">Insira os dados do cliente, referência e a data da geração do orçamento</span>              
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">               
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="orcamento.idOrcamento" value="${orcamento.idOrcamento}" style="display: none"/>

                            <div class="form-group">                                                              
                                <div class="col-md-6">
                                    <label for="pessoa">Tipo de Pessoa</label>  
                                    <select class="form-control" name="orcamento.pessoa" id="tipoPessoa">
                                        <option value="">Selecione uma opção</option>
                                        <option value="PessoaFisica" ${orcamento.pessoa.getClass().getSimpleName() eq 'PessoaFisica' ? 'selected' : ''}>PESSOA FÍSICA</option>
                                        <option value="PessoaJuridica" ${orcamento.pessoa.getClass().getSimpleName() eq 'PessoaJuridica' ? 'selected' : ''}>PESSOA JURÍDICA</option>
                                    </select>
                                    <span class="help-block" id="sOpcao" />
                                </div>

                                <div class="col-md-6">
                                    <label>Pessoa</label>        
                                    <select class="form-control" id="pessoaSelect" name="orcamento.pessoa.idPessoa" disabled>

                                    </select>   
                                    <span class="help-block" style="color: red">${errors.from('orcamento.pessoa.idPessoa')}</span>
                                </div>

                            </div>                          

                            <div class="form-group">                                                        
                                <div class="col-md-6">
                                    <label>Tipo Orçamento</label>        
                                    <select class="form-control" name="orcamento.tipoOrcamento" id="tipoOrcamento">
                                        <option value="">Selecione um tipo</option>
                                        <c:forEach items="${tipoOrcamentoList}" var="tOrcamento">
                                            <option value="${tOrcamento.idTipoOrcamento}" ${orcamento.tipoOrcamento.idTipoOrcamento eq tOrcamento.idTipoOrcamento ? 'selected' : ''}>${tOrcamento.descricao}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('orcamento.tipoOrcamento.idTipoOrcamento')}</span>
                                </div>

                                <div class="col-md-6">
                                    <label>Data</label>  
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>                                        
                                        <input type="text" class="form-control pull-right" name="orcamento.dataorc" value="${orcamento.dataorc.toString("dd/MM/yyyy")}" id="datepickerDataOrcamento">                                        
                                    </div>  
                                    <span class="help-block" style="color: red">${errors.from('orcamento.dataorc')}</span>
                                </div>          
                            </div>      

                            <div class="form-group">                                                        
                                <div class="col-md-6">
                                    <label>Total</label>  
                                    <div>
                                        <div class="input-group">
                                            <span class="input-group-addon">R$</span>
                                            <input type="text" class="form-control" name="orcamento.total" value="${l[orcamento.total].custom("valorMonetario")}" id="valor" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                        </div>                                       
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('orcamento.total')}</span>
                                </div>

                                <div class="col-md-6">
                                    <label>Desconto</label>  
                                    <div>
                                        <div class="input-group">
                                            <span class="input-group-addon">R$</span>
                                            <input type="text" class="form-control" name="orcamento.desconto" value="${l[orcamento.desconto].custom("valorMonetario")}" id="valor" placeholder="Desconto" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                        </div>                                       
                                    </div>
                                    <span class="help-block" style="color: red">${errors.from('orcamento.desconto')}</span>
                                </div>          
                            </div>      

                            <div class="form-group">                                                              
                                <div class="col-md-6">
                                    <label>Setor</label>  
                                    <select class="form-control" name="" id="setor">
                                        <option value="Selecionar">Selecione um setor</option>
                                        <c:forEach items="${setorList}" var="setor">
                                            <option value="${setor.idSetor}">${setor.descricao}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('setor.descricao')}</span>
                                </div>

                                <div class="col-md-5">
                                    <label>Item</label>              
                                    <select class="form-control" id="itemSelect" name="itemSelecionado" disabled>

                                    </select>                                    
                                </div>
                                <span class="help-block" style="color: red">${errors.from('quantidadeItem')}</span>

                                <div class="col-md-1">
                                    <label>Quant.</label> 
                                    <div class="input-group input-group-sm">                                    
                                        <input type="text" class="form-control" id="quantidade" name="quantidade" value="1" onkeyup="somenteNumeros(this);">
                                        <span class="input-group-btn">                                        
                                            <button type="button" class="btn btn-info btn-flat"  id="" onclick="carregaLista();">+</button>
                                            <span class="help-block" style="color: red">${errors.from('quantidadeItem')}</span>
                                    </div>
                                </div>
                            </div>                                            

                            <div class="col-md-12" id="tabelaItens">                                

                            </div>

                        </div>    
                    </div><!-- /.box -->
                </div><!-- /.col -->
                <!-- FIM PASSO 1 -->           

                <!-- COMEÇO PASSO 3 -->
                <div class="col-md-12">
                    <!-- Box Comment -->
                    <div class="box box-widget">
                        <div class="box-header with-border">
                            <div class="user-block">               
                                <img class="img-circle" src="../arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="Geoambiental" />
                                <span class="username"><a href="#">PASSO 2</a></span>    
                                <span class="description">Insira os dados do orçamento</span>                             
                            </div>
                            <!-- /.user-block -->
                            <div class="box-tools">               
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>                
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group">
                                <label>Objetivo</label>                                
                                <div>
                                    <div class="box-body pad">                                       
                                        <textarea id="objetivo" name="orcamento.objetivo" value="${orcamento.objetivo}" rows="10" >${orcamento.objetivo}</textarea>                                    
                                    </div>
                                    <span class="help-block">${errors.from('orcamento.objetivo')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Proposta</label>                                
                                <div>
                                    <div class="box-body pad">                           
                                        <textarea id="editor1" name="orcamento.proposta" value="${orcamento.proposta}" rows="10">${orcamento.proposta}</textarea>                     
                                    </div>
                                    <span class="help-block">${errors.from('orcamento.proposta')}</span>
                                </div>
                            </div>


                            <div class="form-group">
                                <label>Forma de Pagamento</label>                                
                                <div>
                                    <div class="box-body pad">                                       
                                        <textarea id="editor1" name="orcamento.formapagamento" value="${orcamento.formapagamento}" rows="10">${orcamento.proposta}</textarea>                      
                                    </div>
                                    <span class="help-block">${errors.from('orcamento.formapagamento')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Taxas/Emolumentos</label>                                
                                <div>
                                    <div class="box-body pad">                                        
                                        <textarea id="editor1" name="orcamento.taxaseemolumentos" value="${orcamento.taxaseemolumentos}" rows="10">${orcamento.proposta}</textarea>                            
                                    </div>
                                    <span class="help-block">${errors.from('orcamento.taxaseemolumentos')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Início das Atividades</label>                                
                                <div>
                                    <div class="box-body pad">                                     
                                        <textarea id="editor1" name="orcamento.inicioatividades" value="${orcamento.inicioatividades}" rows="10">${orcamento.proposta}</textarea>              
                                    </div>
                                    <span class="help-block">${errors.from('orcamento.inicioatividades')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Validade da Proposta</label>                                
                                <div>
                                    <div class="box-body pad">                                        
                                        <textarea id="editor1" name="orcamento.validadeproposta" value="${orcamento.validadeproposta}" rows="10">${orcamento.validadeproposta}</textarea>                                 
                                    </div>
                                    <span class="help-block">${errors.from('orcamento.validadeproposta')}</span>
                                </div>
                            </div>     
                        </div> 

                        <div class="box-footer">
                            <a href="${linkTo[OrcamentoController].voltaLista}" class="btn btn-default">Voltar</a>
                            <button type="submit" class="btn btn-primary pull-right">Registrar</button>
                        </div>                                
                    </div><!-- /.box -->
                    <!-- /.box-body -->                    
                    <!-- /.box-footer -->
                </div><!-- /.col -->
                <!-- FIM PASSO 3 -->

            </form>
        </div>
        <!-- /.box --> 
        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>


        <script type="text/javascript">

                                                $('#tipoPessoa').on('change', function () {
                                                    var self = $(this);
                                                    var selecionado = self.val();
                                                    if (selecionado === "0") {
                                                        $('#pessoaSelect').attr('disabled', 'true');
                                                        $.notify("É necessário selecionar uma pessoa", "warn");
                                                    } else
                                                        buscaPessoa(selecionado, 0);
                                                });
                                                $('#setor').on('change', function () {
                                                    var self = $(this);
                                                    var selecionado = self.val();
                                                    if (selecionado === "Selecionar")
                                                        $('#itemSelect').attr('disabled', 'true');
                                                    else
                                                        buscaItemPorIdsetor(selecionado);
                                                });
                                                function buscaPessoa(tipoPessoa, selecionado) {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/orcamento/buscaPessoa/' + tipoPessoa,
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
                                                            alert('erro');
                                                        }
                                                    });
                                                }
                                                ;
                                                function buscaItemPorIdsetor(idSetor) {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/orcamento/buscaItem/' + idSetor,
                                                        //data: {estado: selecionado}, // Passa a variável ao server. O nome do parâmetro tem que ser estado, pois foi o nome colocado aqui.
                                                        dataType: 'json', // O Server vai retornar um JSON
                                                        success: function (data) {
                                                            // Precisa transformar de json para objeto html
                                                            var options = [];
                                                            options.push('<option value= "0">Selecione um item...</option>'); // colocando a primeira option...
                                                            for (var i = 0; i < data.length; i++) {
                                                                options.push('<option value="' + data[i].idItem + '">' + data[i].descricao + " - R$ " + data[i].valor + '</option>');
                                                            }
                                                            // Agora precisa juntar esses options dentro da combo de cidades
                                                            $('#itemSelect').html(options.join(''));
                                                            $('#itemSelect').removeAttr('disabled');
                                                        },
                                                        error: function () {
                                                            alert('erro');
                                                        }
                                                    });
                                                }
                                                ;
                                                function carregaLista() {
                                                    var itemSelecionado = $("#itemSelect option:selected").val();
                                                    var quantidade = $("#quantidade").val();
                                                    if (typeof itemSelecionado === "undefined" || itemSelecionado <= 0 || quantidade <= 0) {
                                                        $.notify("Item e/ou quantidade inválido", "error");
                                                    } else {
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/orcamento/carregalista/' + itemSelecionado + '/' + quantidade,
                                                            success: function () {
                                                                $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                                $.notify("Item adicionado com sucesso", "success");
                                                            },
                                                            error: function () {
                                                                $.notify("Item não adicionado", "error");
                                                            }
                                                        });
                                                    }
                                                }

                                                function removeLista(indiceItem) {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/orcamento/removelista/' + indiceItem,
                                                        success: function () {
                                                            $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                            $.notify("Item removido com sucesso", "success");
                                                        },
                                                        error: function () {
                                                            $.notify("Item não removido", "error");
                                                        }
                                                    });
                                                }

                                                function atualizaLista(posicao) {
                                                    var quantidade = $('#qtde' + posicao).val();
                                                    var valor = $('#valor' + posicao).val().replace(".", "");
                                                    var valorFormatado = valor.replace(",", ".");
                                                    var url = '${pageContext.request.contextPath}/orcamento/atualizaitens/' + posicao + '/' + quantidade + '/' + valorFormatado;
                                                    $.ajax({
                                                        url: url,
                                                        method: 'GET',
                                                        cache: false,
                                                        success: function () {
                                                            $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                            $.notify("Item atualizado com sucesso", "success");
                                                        },
                                                        error: function () {
                                                            $.notify("Item não foi atualizado", "error");
                                                        }
                                                    });
                                                }

                                                function somenteNumeros(num) {
                                                    var er = /[^0-9.]/;
                                                    er.lastIndex = 0;
                                                    var campo = num;
                                                    if (er.test(campo.value)) {
                                                        campo.value = "";
                                                    }
                                                }

                                                $(function () {
                                                    //Date picker
                                                    $('#datepickerDataOrcamento').datepicker({
                                                        format: 'dd/mm/yyyy',
                                                        autoclose: true
                                                    });

                                                    //RECUPERA CAMPOS NO FORM DE EDIÇÃO
                                                    if ('${orcamento.idOrcamento}') {
                                                        if ($('#tipoPessoa').val() !== "0") {
                                                            //BUSCA PESSOA E SELECIONA                                                        
                                                            buscaPessoa($('#tipoPessoa').val(), '${orcamento.pessoa.idPessoa}');

                                                        }

                                                        //LOAD DA TABELA DE ITENS
                                                        $("#tabelaItens").load("tabela #tabelaAtualiza");
                                                    }
                                                });

        </script> 
    </body>
</html>

