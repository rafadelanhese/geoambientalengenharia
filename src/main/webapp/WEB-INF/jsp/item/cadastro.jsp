<%-- 
    Document   : cadastro
    Created on : 01/02/2018, 09:55:24
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
                    <h3 class="box-title">ITENS DE SERVIÇOS</h3>
                </div>
                <div class="box-body">
                    <!-- form start -->
                    <form action="${linkTo[ItemController].salvar}" method="POST">
                        <div class="box-body">                 
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="item.idItem" value="${item.idItem}" style="display: none"/>

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Descrição do Item</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="item.descricao" value="${item.descricao}" placeholder="Item" />
                                    <span class="help-block" style="color: red">${errors.from('item.descricao').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Valor Total</label>                                
                                <div class="col-sm-10" >
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" class="form-control" name="item.valor" value="${item.valor}" id="valor" placeholder="Valor Total" onKeyPress="return(MascaraMoeda(this, '.', ',', event))"/>
                                    </div>
                                    <span class="help-block" style="color: red" id="sObservacoes">${errors.from('item.valor').join(' - ')}</span>                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Setor</label>                                
                                <div class="col-sm-10">
                                    <select class="form-control" name="item.setor.idSetor" id="sltSetor">
                                        <option value="">Selecione um Setor...</option>
                                        <c:forEach items="${setorList}" var="setor">
                                            <option value="${setor.idSetor}">${setor.descricao}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="help-block" style="color: red">${errors.from('item.setor.idSetor').join(' - ')}</span>
                                </div>
                            </div>
                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="${linkTo[ItemController].lista}" class="btn btn-default">Voltar</a>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
                                            $(function () {
                                                if ('${item.setor.idSetor}') {
                                                    $('#sltSetor').val('${item.setor.idSetor}');
                                                }
                                            });

                                            $('#sltSetor').on('change', function () {
                                                var self = $(this);
                                                var selecionado = self.val();
                                                if (selecionado === "0")
                                                    $.notify("Selecione um setor", "error");
                                            });
        </script>
    </body>
</html>
