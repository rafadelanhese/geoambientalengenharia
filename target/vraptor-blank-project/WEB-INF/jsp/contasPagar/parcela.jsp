<%-- 
    Document   : parcela
    Created on : 21/01/2018, 11:34:20
    Author     : Rafael Delanhese
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div class="row">
            <h1>
                LANÇAR PAGAMENTO
                <small>| Painel de Contas</small>
            </h1>
            <div class="col-lg-7">
                <!-- TABLE: LATEST ORDERS -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Parcela</h3>                        
                        <div class="box-tools pull-right">                            
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <form action="${linkTo[ContasPagarController].lancaPagamentoParcela}" method="POST" class="form-horizontal">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div>

                                <c:forEach var="error" items="${errors}">
                                    <p style="color : red">${error.category} - ${error.message}</p>
                                </c:forEach>

                                <!--Campo id necessário para executar o mesmo form para criar e atualizar-->
                                <input type="text" class="form-control" name="pcl.idParcela" value="${pcl.idParcela}" style="display: none"/>
                                <input type="text" class="form-control" name="pcl.contasPagar.idContasPagar" value="${pcl.contasPagar.idContasPagar}" style="display: none"/>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Fornecedor</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" value="${pcl.contasPagar.pessoa.nome}" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Despesa</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" value="${pcl.contasPagar.tipoDespesa.descricao}" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Parcela Nº</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="pcl.qtdeParcelas" value="${pcl.qtdeParcelas}" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Valor</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="pcl.valor" value="${pcl.valor}"  onclick="return(MascaraMoeda(this, '.', ',', event))" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Vencimento</label>
                                    <div class="col-sm-10">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>                                        
                                            <input type="text" class="form-control pull-right" name="pcl.datavencimento" value="${pcl.datavencimento.toString("dd/MM/yyyy")}" id="datepickerVencimento" readonly/>
                                        </div>
                                        <span class="help-block" id="sAreaTotal">${errors.from('pcl.datavencimento')}</span>
                                    </div>                     
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Valor Pago</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="pcl.valorpago" value="${pcl.valorpago}" placeholder="Valor Pago" onKeyPress="return(MascaraMoeda(this, '.', ',', event))" />
                                    </div>
                                    <span class="help-block" id="sAreaTotal">${errors.from('pcl.valorpago')}</span>                                    
                                </div>

                                <div class="form-group">
                                    <label for="nome" class="col-sm-2 control-label">Data Pagto</label>                                
                                    <div class="col-sm-10">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>                                        
                                            <input type="text" class="form-control pull-right" name="pcl.datapagamento" id="datepickerInicial" />
                                        </div>
                                        <span class="help-block" id="sAreaTotal">${errors.from('pcl.datapagamento')}</span>
                                    </div>                                    
                                </div>        

                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">
                            <a href="${linkTo[ContasPagarController].listaParcelas}" class="btn btn-sm btn-primary btn-flat pull-left">Voltar</a>
                            <button type="submit" class="btn btn-primary pull-right">Pagar</button>
                        </div>
                        <!-- /.box-footer -->
                    </form>
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-5">
                <!-- PRODUCT LIST -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Próximas parcelas</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <ul class="products-list product-list-in-box">
                            <c:set var="total" value=""/>
                            <c:forEach items="${proximasParcelasList}" var="proxparc"> 
                                <c:set var="total" value="${total + proxparc.valor}"/>
                                <li class="item">                            
                                    <div class="product-list-in-box" onscroll="auto">                                
                                        <a href="${linkTo[ContasPagarController].parcela(proxparc.idParcela)}" class="product-title">${proxparc.qtdeParcelas}</a> - ${proxparc.contasPagar.pessoa.nome}
                                        <span class="label label-danger pull-right">R$ ${proxparc.valor}</span>
                                        <span class="product-description">
                                            Despesa: ${proxparc.contasPagar.tipoDespesa.descricao}
                                        </span>  
                                        <span class="product-description">
                                            Data: ${proxparc.datavencimento.toString("dd/MM/yyyy")}
                                        </span>     
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="box-footer text-center">
                            <p><strong>Total a pagar: ${total}</strong></p>
                        </div>
                        <!-- /.box-footer -->
                    </div>               
                </div>
                <!-- /.box -->
            </div>
        </div>
        <!-- /.box -->  
        <!-- Arquivos usados em algumas funções Jquery  -->
        <script type="text/javascript" src="../arquivos/arqWeb/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../arquivos/arqWeb/jquery.validate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript">
                                            $(function () {

                                                var currentDate = $(".selector").datepicker("getDate");
                                                //Date picker
                                                $('#datepickerInicial').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true,
                                                });

                                                $('#datepickerVencimento').inputmask('dd/mm/yyyy', {'placeholder': 'dd/mm/yyyy'});
                                                //Date picker
                                                $('#datepickerVencimento').datepicker({
                                                    format: 'dd/mm/yyyy',
                                                    autoclose: true
                                                });
                                            });

                                            $(document).ready(function () {
                                                // $('#datepickerVencimento').val();
                                                //$('#datepickerVencimento').val('${pcl.datavencimento}');
                                            });


        </script>
    </body>
</html>
