<%-- 
    Document   : home
    Created on : 23/04/2018, 16:16:48
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <body>         
        <!-- Info boxes -->
        <div class="row">           
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="fa fa-angle-up"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Recebimentos</span>
                        <span class="info-box-number">R$ ${l[totalRecebidoMesAtual].custom("valorMonetario")}</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="fa fa-angle-down"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Pagamentos</span>
                        <span class="info-box-number">R$ ${l[totalPagoMesAtual].custom("valorMonetario")}</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Usuários Registrados</span>
                        <span class="info-box-number">${qtdePessoas}</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->            
        </div>
        <!-- /.row -->           

        <!-- Contas Pagas -->
        <div class="row">
            <!-- Left col -->
            <div class="col-md-12">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Contas à Pagar</h3>
                        <span class="description"> - Lista de parcelas à pagar</span>
                        <span></span>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <c:choose>
                            <c:when test="${empty listParcela}">
                                <p>Você não tem parcelas à pagar</p>
                            </c:when>    
                            <c:otherwise>
                                <table id="tabelaParcela" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">ID</th>                                                                        
                                            <th>Valor</th>
                                            <th>Dt. Venc.</th>                                            
                                            <th>Parcela</th>
                                            <th>Tipo Desp.</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listParcela}" var="parcelaPagar">
                                            <tr>
                                                <td>${parcelaPagar.idParcela}</td>
                                                <td>R$ ${l[parcelaPagar.valor].custom("valorMonetario")}</td>
                                                <td>${parcelaPagar.datavencimento.toString("dd/MM/yyyy")}</td>                                                
                                                <td>${parcelaPagar.qtdeParcelas}</td>
                                                <td>${parcelaPagar.contasPagar.tipoDespesa.descricao}</td>
                                            </tr>      
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>                        
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>

        <!-- Contas Recebidas -->
        <div class="row">
            <!-- Left col -->
            <div class="col-md-12">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">Contas Recebidas</h3>
                        <span class="description"> - Lista as parcelas recebidas</span>
                        <span></span>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <c:choose>
                            <c:when test="${empty listParcelaReceber}">
                                <p>Você não tem lançamento de conta recebida</p>
                            </c:when>                            
                            <c:otherwise>
                                <table id="tabelaParcela" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">ID</th>  
                                            <th>Cliente</th>
                                            <th>Valor</th>
                                            <th>Dt. Recebimento</th>
                                            <th>Atividade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listParcelaReceber}" var="parcela">
                                            <tr>
                                                <td>${parcela.idParcelaReceber}</td>
                                                <td>${parcela.contasReceber.atividade.pessoa.getNomeAbreviado()}</td>
                                                <td>R$ ${l[parcela.valorRecebido].custom("valorMonetario")}</td>
                                                <td>${parcela.dataRecebido.toString("dd/MM/yyyy")}</td>
                                                <td>                                        
                                                    <c:choose>
                                                        <c:when test="${parcela.contasReceber.atividade.getClass().getSimpleName() eq 'Projeto'}">
                                                            <span class="label label-success" >PROJETO</span>
                                                        </c:when>
                                                        <c:when test="${parcela.contasReceber.atividade.getClass().getSimpleName() eq 'Licenca'}">
                                                            <span class="label label-primary">LICENÇA</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="label label-danger">SERVIÇO</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>            
                                            </tr>          
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
        <!-- jQuery 3 -->  

        <!-- Contas Pagas -->
        <div class="row">
            <!-- Left col -->
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Licenças</h3>
                        <span class="description"> - Lista de licenças com vencimento próximo</span>
                        <span></span>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <c:choose>
                            <c:when test="${empty listLicenca}">
                                <p>Não tem nenhuma licença com vencimento próximo</p>
                            </c:when>    
                            <c:otherwise>
                                <table id="tabelaParcela" class="table table-bordered table-striped">                                    
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">ID</th>                                                                        
                                            <th>Dt. Início</th>
                                            <th>Dt. Venc.</th>                                            
                                            <th>Status</th>
                                            <th>Cliente</th>
                                            <th>Setor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listLicenca}" var="licenca">
                                            <tr>
                                                <td>${licenca.idAtividade}</td>
                                                <td>${licenca.dataInicio.toString("dd/MM/yyyy")}</td>
                                                <td>${licenca.dataFinal.toString("dd/MM/yyyy")}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${licenca.status == true}">
                                                            Ativo
                                                        </c:when>
                                                        <c:otherwise>
                                                            Fechado
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${licenca.pessoa.nome}</td>
                                                <td>${licenca.setor.descricao}</td>                                                
                                            </tr>          
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>                        
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </body>
</html>
