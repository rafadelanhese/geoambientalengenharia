<%-- 
    Document   : cadastro
    Created on : 19/10/2017, 18:02:09
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
                    <h3 class="box-title">SETOR</h3>
                </div>
                <div class="box-body">
                    <!-- form start -->
                    <form action="${linkTo[SetorController].salvar}" method="POST">
                        <div class="box-body">                 
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="setor.idSetor" value="${setor.idSetor}" style="display: none"/>

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Descrição do Setor</label>
                                <!--VERIFICA SE HÁ ERROS, SE HOUVER SETA UMA DIV, SENÃO SETA OUTRA DIV COM ERRO-->
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="setor.descricao" value="${setor.descricao}" placeholder="Setor" />
                                    <span class="help-block" style="color: red">${errors.from('setor.descricao').join(' - ')}</span>
                                </div>
                            </div>

                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="${linkTo[SetorController].lista}" class="btn btn-default">Voltar</a>
                    <button type="submit" class="btn btn-primary pull-right">Registrar</button>
                </div>
                <!-- /.box-footer -->
                </form>
            </div>
        </div>
        <!-- /.box -->     
    </body>
</html>