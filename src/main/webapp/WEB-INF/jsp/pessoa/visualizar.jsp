<%-- 
    Document   : visualizar
    Created on : 15/06/2018, 17:53:52
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>   
    <body>
        <div class="row">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Perfil de Usuário
                </h1>      
            </section>
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/arquivos/dist/img/logoGeoambientalAtividade.jpg" alt="User profile picture">

                        <h3 class="profile-username text-center">${pessoa.nome}</h3>

                        <p class="text text-center">${pessoa.setor.descricao}</p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>Telefone</b> <a class="pull-right">${pessoa.telefone[0].telefone}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Celular</b> <a class="pull-right">${pessoa.telefone[1].telefone}</a>
                            </li>                
                        </ul> 

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Nível de Acesso</strong>
                        <c:forEach items="${pessoa.tipousuario}" var="tipousuario">
                            <p class="text"> - ${tipousuario.descricao}</p> 
                        </c:forEach>                         
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

            </div>
            <!-- /.col --> 

            <div class="col-md-9">
                <!-- About Me Box -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Sobre</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">             
                        <strong><i class="fa fa-map-marker margin-r-5"></i> E-mail</strong>
                        <p class="text">${pessoa.email}</p>                            
                        <strong><i class="fa fa-map-marker margin-r-5"></i> Dados Pessoais</strong>

                        <p class="text"><strong>Nome:</strong> ${pessoa.nome}</p>
                        <c:choose>
                            <c:when test="${pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                <p class="text"><strong>RG:</strong> ${pessoa.cpf}</p>
                                <p class="text"><strong>CPF:</strong> ${pessoa.rg}</p>
                            </c:when>                            
                            <c:otherwise>
                                <p class="text"><strong>CNPJ:</strong> ${pessoa.cnpj}</p>
                                <p class="text"><strong>Inscr. Estadual:</strong> ${pessoa.ie}</p>
                            </c:otherwise>
                        </c:choose> 
                        <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>
                        <p class="text"><strong>Logradouro:</strong> ${pessoa.endereco.rua}, ${pessoa.endereco.numero}</p>                        
                        <p class="text"><strong>Bairro:</strong> ${pessoa.endereco.bairro}</p>
                        <p class="text"><strong>CEP:</strong> ${pessoa.endereco.cep}</p>
                        <p class="text"><strong>Complemento:</strong> ${pessoa.endereco.complemento}</p>
                        <p class="text"><strong>Cidade:</strong> ${pessoa.endereco.cidade.nome}</p>
                        <p class="text"><strong>Estado:</strong> ${pessoa.endereco.cidade.estado.nome} - ${pessoa.endereco.cidade.estado.sigla}</p>               
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <a href="${linkTo[PessoaController].lista}" class="btn btn-default">Voltar</a>                        
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
            </div>	
        </div>
    </body>
</html>
