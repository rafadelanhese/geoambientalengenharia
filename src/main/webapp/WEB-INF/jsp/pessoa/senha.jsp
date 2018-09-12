<%-- 
    Document   : senha
    Created on : 31/05/2018, 14:53:31
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
                Nova Senha
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
                    <h3 class="box-title">SENHA</h3>
                </div>
                <div class="box-body">                   
                    <form action="${linkTo[PessoaController].alteraSenha}" method="POST" >
                        <div class="box-body">                 
                            <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                            <input type="text" class="form-control" name="pessoa.idPessoa" value="${pessoa.idPessoa}" style="display: none"/>                                                 

                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <!--VERIFICA SE HÁ ERROS, SE HOUVER SETA UMA DIV, SENÃO SETA OUTRA DIV COM ERRO-->
                                <div class="col-sm-10" id="dNome">
                                    <input type="text" class="form-control" name="pessoa.nome" value="${pessoa.nome}" placeholder="Nome" readonly />
                                    <span class="help-block" style="color: red">${errors.from('pessoa.nome').join(' - ')}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Nova Senha</label>                                
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="senha"  placeholder="Senha" />
                                    <span class="help-block" style="color: red">${errors.from('pessoa.senha').join(' - ')}</span>
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
    </body>
</html>
