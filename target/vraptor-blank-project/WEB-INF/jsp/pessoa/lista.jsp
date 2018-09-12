<%-- 
    Document   : lista
    Created on : 16/11/2017, 21:49:20
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div>
            <h1>
                Lista de Usuários/Pessoas
                <small>| Painel de Listagem</small>
            </h1>
            <c:if test="${not empty errors}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                    <c:forEach items="${errors}" var="error">
                        ${error.message}<br />
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${not empty validacao}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                    ${validacao}
                </div>
            </c:if>
            <c:if test="${not empty mensagem}">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-check"></i> Sucesso</h4>
                    ${mensagem}
                </div>
            </c:if>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <a href="${linkTo[PessoaController].cadastro}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Incluir</a>
                </div>
                <div class="box-body">   
                    <table id="tabela_setor" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Tipo Pessoa</th>
                                <th>Setor</th>
                                <th>Tipo Usuário</th>                                     
                                <th style="width: 5%">Visualizar</th>
                                <th style="width: 5%">Editar</th>
                                <th style="width: 5%">Senha</th>
                                <th style="width: 5%">Remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${pessoaList}" var="pessoa">
                                <tr>
                                    <td>${pessoa.nome}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                                Pessoa Física
                                            </c:when>                            
                                            <c:otherwise>
                                                Pessoa Jurídica
                                            </c:otherwise>
                                        </c:choose>          
                                    </td>
                                    <td>${pessoa.setor.descricao}</td>  
                                    <td>
                                        <c:forEach items="${pessoa.tipousuario}" var="tipousuario">
                                            ${tipousuario.descricao}<br/>
                                        </c:forEach>
                                    </td>  
                                    <td><a href="${linkTo[PessoaController].visualizar(pessoa.getClass().getSimpleName(), pessoa.idPessoa)}"><i class="fa fa-search" /></a></td>
                                    <td><a href="${linkTo[PessoaController].edita('Edita',pessoa.idPessoa)}"><i class="fa fa-edit" style="color: green"/></a></td>
                                    <td><a href="${linkTo[PessoaController].edita('Senha',pessoa.idPessoa)}"><i class="fa fa-unlock-alt" style="color: black"/></a></td>
                                    <td><a href="${linkTo[PessoaController].remove(pessoa.getClass().getSimpleName(), pessoa.idPessoa)}"><i class="fa fa-remove" style="color: red"/></a></td>                                    
                                </tr>          
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.box -->          
    </body>
</html>
