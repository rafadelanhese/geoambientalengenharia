
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Relatório Geoambiental - Licença</title>
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
                            <i class="fa fa-globe"></i> Geoambiental Engenharia - Licença         
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <div class="col-xs-6 table-responsive">

                            <strong><i class="fa fa-book margin-r-5"></i> Pessoal</strong>

                            <p class="text"><strong>Nome:</strong> ${licenca.pessoa.nome}</p>
                            <c:choose>
                                <c:when test="${licenca.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                    <p class="text"><strong>RG:</strong> ${licenca.pessoa.cpf}</p>
                                    <p class="text"><strong>CPF:</strong> ${licenca.pessoa.rg}</p>
                                </c:when>                            
                                <c:otherwise>
                                    <p class="text"><strong>CNPJ:</strong> ${licenca.pessoa.cnpj}</p>
                                    <p class="text"><strong>Inscr. Estadual:</strong> ${licenca.pessoa.ie}</p>
                                </c:otherwise>
                            </c:choose>                        
                            <p class="text"><strong>Telefone:</strong> ${licenca.pessoa.telefone[0].telefone} - (${licenca.pessoa.telefone[0].descricao})</p>
                            <p class="text"><strong>Celular:</strong> ${licenca.pessoa.telefone[1].telefone} - (${licenca.pessoa.telefone[1].descricao})</p>
                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>

                            <p class="text"><strong>Logradouro:</strong> ${licenca.pessoa.endereco.rua}, ${licenca.pessoa.endereco.numero}</p>
                            <p class="text"><strong>Complemento:</strong> ${licenca.pessoa.endereco.complemento}</p>
                            <p class="text"><strong>Bairro:</strong> ${licenca.pessoa.endereco.bairro}</p>
                            <p class="text"><strong>CEP:</strong> ${licenca.pessoa.endereco.cep}</p>
                            <p class="text"><strong>Cidade:</strong> ${licenca.pessoa.endereco.cidade.nome}</p>
                            <p class="text"><strong>Estado:</strong> ${licenca.pessoa.endereco.cidade.estado.nome} - ${licenca.pessoa.endereco.cidade.estado.sigla}</p>
                            <hr>

                        </div> 
                        <div class="col-xs-6 table-responsive">

                            <strong><i class="fa fa-calendar margin-r-5"></i> Datas</strong>

                            <p class="text"><strong>Data Inicial:</strong> ${licenca.dataInicio.toString("dd/MM/yyyy")}</p>
                            <p class="text"><strong>Data Final:</strong> ${licenca.dataFinal.toString("dd/MM/yyyy")}</p>                       
                            <p class="text"><strong>Data Prev. Fim:</strong> ${licenca.dataPrevistaFim.toString("dd/MM/yyyy")}</p>                                                                 
                            <hr>

                            <strong><i class="fa fa-book margin-r-5"></i> Dados Cadastrais</strong>

                            <p class="text"><strong>CNAE:</strong> ${licenca.cnae}</p>
                            <p class="text"><strong>Núm. Proc.:</strong> ${licenca.numeroProcesso}</p>                       
                            <p class="text"><strong>Núm. Licença:</strong> ${licenca.numeroLicenca}</p>                       
                            <p class="text"><strong>Versão:</strong> ${licenca.versao}</p>
                            <p class="text"><strong>Órgão:</strong> ${licenca.orgao}</p>                        
                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço da Obra</strong>

                            <p class="text"><strong>Logradouro:</strong> ${licenca.endereco.rua}, ${licenca.endereco.numero}</p>
                            <p class="text"><strong>Complemento:</strong> ${licenca.endereco.complemento}</p>
                            <p class="text"><strong>Bairro:</strong> ${licenca.endereco.bairro}</p>
                            <p class="text"><strong>CEP:</strong> ${licenca.endereco.cep}</p>
                            <p class="text"><strong>Cidade:</strong> ${licenca.endereco.cidade.nome}</p>
                            <p class="text"><strong>Estado:</strong> ${licenca.endereco.cidade.estado.nome} - ${licenca.endereco.cidade.estado.sigla}</p>
                            <hr>                          
                        </div>                                                  
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <div>
                            <strong><i class="fa fa-map-marker margin-r-5"></i> Serviços</strong>
                            <c:choose>
                                <c:when test="${empty licenca.atividadeItem}">
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

                                        <c:forEach items="${licenca.atividadeItem}" var="aI" varStatus="seqItens">
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
                            <strong><i class="fa fa-map-marker margin-r-5"></i> Renovação</strong>
                            <c:choose>
                                <c:when test="${empty licenca.renovacao}">
                                    <p>Não há renovações cadastradas</p>
                                </c:when>
                                <c:otherwise>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Seq.</th>
                                            <th>Data Inicial</th>
                                            <th>Data Vencimento</th>    
                                            <th>Excluir</th>    
                                        </tr>

                                        <c:forEach items="${licenca.renovacao}" var="renovacao" varStatus="seqItens">
                                            <tr>
                                                <td>${seqItens.index + 1}</td>
                                                <td>${renovacao.dataInicial.toString("dd/MM/yyyy")}</td>
                                                <td>${renovacao.dataVencimento.toString("dd/MM/yyyy")}</td> 
                                                <td><a href="${linkTo[LicencaController].removeRenovacao(licenca.idAtividade,renovacao.idRenovacao)}"><i class="fa fa-trash-o" style="color: red"/></a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:otherwise>
                            </c:choose>        
                        </div> 
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <div>
                            <strong><i class="fa fa-map-marker margin-r-5"></i> Contas à Receber</strong>
                            <c:forEach items="${licenca.contasReceber}" var="contasReceber" varStatus="seqItens">
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