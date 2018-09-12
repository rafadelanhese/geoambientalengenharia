
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Relatório Geoambiental - Projeto</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="../../arquivos/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../../arquivos/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="../../arquivos/bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../../arquivos/dist/css/AdminLTE.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">      
    </head>
    <body onload="window.print();">
        <div class="">
            <!-- Main content -->
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i> Geoambiental Engenharia - Serviço         
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <div class="col-xs-6 table-responsive">

                            <strong><i class="fa fa-book margin-r-5"></i> Pessoal</strong>

                            <p class="text"><strong>Nome:</strong> ${servico.pessoa.nome}</p>
                            <c:choose>
                                <c:when test="${servico.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                    <p class="text"><strong>RG:</strong> ${servico.pessoa.cpf}</p>
                                    <p class="text"><strong>CPF:</strong> ${servico.pessoa.rg}</p>
                                </c:when>                            
                                <c:otherwise>
                                    <p class="text"><strong>CNPJ:</strong> ${servico.pessoa.cnpj}</p>
                                    <p class="text"><strong>Inscr. Estadual:</strong> ${servico.pessoa.ie}</p>
                                </c:otherwise>
                            </c:choose>                        
                            <p class="text"><strong>Telefone:</strong> ${servico.pessoa.telefone[0].telefone} - (${servico.pessoa.telefone[0].descricao})</p>
                            <p class="text"><strong>Celular:</strong> ${servico.pessoa.telefone[1].telefone} - (${servico.pessoa.telefone[1].descricao})</p>
                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>

                            <p class="text"><strong>Logradouro:</strong> ${servico.pessoa.endereco.rua}, ${servico.pessoa.endereco.numero}</p>
                            <p class="text"><strong>Complemento:</strong> ${servico.pessoa.endereco.complemento}</p>
                            <p class="text"><strong>Bairro:</strong> ${servico.pessoa.endereco.bairro}</p>
                            <p class="text"><strong>CEP:</strong> ${servico.pessoa.endereco.cep}</p>
                            <p class="text"><strong>Cidade:</strong> ${servico.pessoa.endereco.cidade.nome}</p>
                            <p class="text"><strong>Estado:</strong> ${servico.pessoa.endereco.cidade.estado.nome} - ${servico.pessoa.endereco.cidade.estado.sigla}</p>
                            <hr>

                        </div> 
                        <div class="col-xs-6 table-responsive">

                            <strong><i class="fa fa-calendar margin-r-5"></i> Datas</strong>

                            <p class="text"><strong>Data Inicial:</strong> ${servico.dataInicio.toString("dd/MM/yyyy")}</p>
                            <p class="text"><strong>Data Final:</strong> ${servico.dataFinal.toString("dd/MM/yyyy")}</p>                       
                            <p class="text"><strong>Data Prev. Fim:</strong> ${servico.dataPrevistaFim.toString("dd/MM/yyyy")}</p>                                                                 
                            <hr>

                            <strong><i class="fa fa-book margin-r-5"></i> Dados Cadastrais</strong>

                            <p class="text"><strong>Tipo:</strong> ${servico.tipo}</p>
                            <p class="text"><strong>Obs.:</strong> ${servico.observacoes}</p>                                              
                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço da Obra</strong>

                            <p class="text"><strong>Logradouro:</strong> ${servico.endereco.rua}, ${servico.endereco.numero}</p>
                            <p class="text"><strong>Complemento:</strong> ${servico.endereco.complemento}</p>
                            <p class="text"><strong>Bairro:</strong> ${servico.endereco.bairro}</p>
                            <p class="text"><strong>CEP:</strong> ${servico.endereco.cep}</p>
                            <p class="text"><strong>Cidade:</strong> ${servico.endereco.cidade.nome}</p>
                            <p class="text"><strong>Estado:</strong> ${servico.endereco.cidade.estado.nome} - ${servico.endereco.cidade.estado.sigla}</p>
                            <hr>         
                        </div>   
                        <div>
                             <strong><i class="fa fa-map-marker margin-r-5"></i> Serviços</strong>
                            <c:choose>
                                <c:when test="${empty servico.atividadeItem}">
                                    <p>Não há serviços cadastrados</p>
                                </c:when>
                                <c:otherwise>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Seq.</th>
                                            <th>Item</th>
                                            <th>Quantidade</th>
                                            <th>Valor</th>                                
                                            <th>Sub. Total</th>                                
                                        </tr>

                                        <c:forEach items="${servico.atividadeItem}" var="aI" varStatus="seqItens">
                                            <tr>
                                                <td>${seqItens.index + 1}</td>
                                                <td>${aI.item.descricao}</td>
                                                <td>${aI.quantidade}</td>
                                                <td>${aI.valor}</td>
                                                <td>R$ ${l[aI.quantidade * aI.valor].custom("valorMonetario")}</td> 
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:otherwise>
                            </c:choose>                         
                        </div> 
                        <div>
                            <c:forEach items="${servico.contasReceber}" var="contasReceber" varStatus="seqItens">
                                <div class="box-group" id="accordion">                           
                                    <div class="panel box">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                 ID: ${contasReceber.idContasReceber} - Descrição: ${contasReceber.observacoes}                                     
                                                <div class="description-block" style="font-size: 15px; color: gray;"> 
                                                    <span class="description">Valor Total: R$ ${l[contasReceber.valor].custom("valorMonetario")} | Data de Recebimento: ${contasReceber.dataReceber.toString("dd/MM/yyyy")} | Qtde Parc. Lançadas: ${contasReceber.parcelaReceber.size()}</span> 
                                                </div>                                            
                                            </h4>
                                        </div>

                                        <div id="${seqItens.index}">
                                            <div class="box-body">
                                                <table class="table table-striped">
                                                    <c:choose>
                                                        <c:when test="${empty contasReceber.parcelaReceber }">
                                                            <p>Não foi lançada nenhuma parcela de recebimento para esta conta.</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <th>Nº Parcela</th>
                                                                <th>Valor Recebido</th>
                                                                <th>Data Pag.</th>                                            
                                                            </tr>
                                                            <c:forEach items="${contasReceber.parcelaReceber}" var="parcela" varStatus="seqParcela">

                                                                <tr>
                                                                    <td>${seqParcela.index + 1}</td>
                                                                    <td>R$ ${l[parcela.valorRecebido].custom("valorMonetario")}</td>
                                                                    <td>${parcela.dataRecebido.toString("dd/MM/yyyy")}</td>                                               
                                                                </tr>                                                                             
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>
                            </c:forEach>              
                        </div>   
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- ./wrapper -->
    </body>
</html>