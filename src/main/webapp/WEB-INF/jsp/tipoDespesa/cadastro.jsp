<%-- 
    Document   : cadastro
    Created on : 25/11/2017, 18:24:34
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
                    <h3 class="box-title">TIPO DESPESA</h3>
                </div>
                <div class="box-body">
                    <!-- form start -->
                    <form action="${linkTo[TipoDespesaController].salvar}" method="POST">
                        <div class="box-body">                 
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="tipodespesa.idTipoDespesa" value="${tipodespesa.idTipoDespesa}" style="display: none"/>

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Descrição Tipo Despesa</label>                                
                                <div class="col-sm-10" id="dDescricao">
                                    <input type="text" class="form-control" name="tipodespesa.descricao" value="${tipodespesa.descricao}" placeholder="Tipo Despesa" id="descricao" onblur="validaCampoDescricao()"/>
                                    <span class="help-block" style="color: red" id="sDescricao">${errors.from('tipodespesa.descricao').join(' - ')}</span>
                                </div>
                            </div>

                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="${linkTo[TipoDespesaController].lista}" class="btn btn-default">Voltar</a>
                    <button type="submit" class="btn btn-primary pull-right">Registrar</button>
                </div>
                <!-- /.box-footer -->
                </form>
            </div>
        </div>
        <!-- /.box -->     
    </body>
</html>
