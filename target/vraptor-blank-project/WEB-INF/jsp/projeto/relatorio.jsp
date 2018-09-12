
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
                            <i class="fa fa-globe"></i> Geoambiental Engenharia - Projeto         
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <div class="col-xs-6 table-responsive">

                            <strong><i class="fa fa-book margin-r-5"></i> Pessoal</strong>

                            <p class="text"><strong>Nome:</strong> ${projeto.pessoa.nome}</p>
                            <c:choose>
                                <c:when test="${projeto.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                    <p class="text"><strong>RG:</strong> ${projeto.pessoa.cpf}</p>
                                    <p class="text"><strong>CPF:</strong> ${projeto.pessoa.rg}</p>
                                </c:when>                            
                                <c:otherwise>
                                    <p class="text"><strong>CNPJ:</strong> ${projeto.pessoa.cnpj}</p>
                                    <p class="text"><strong>Inscr. Estadual:</strong> ${projeto.pessoa.ie}</p>
                                </c:otherwise>
                            </c:choose>                        
                            <p class="text"><strong>Telefone:</strong> ${projeto.pessoa.telefone[0].telefone} - (${projeto.pessoa.telefone[0].descricao})</p>
                            <p class="text"><strong>Celular:</strong> ${projeto.pessoa.telefone[1].telefone} - (${projeto.pessoa.telefone[1].descricao})</p>
                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>

                            <p class="text"><strong>Logradouro:</strong> ${projeto.pessoa.endereco.rua}, ${projeto.pessoa.endereco.numero}</p>
                            <p class="text"><strong>Complemento:</strong> ${projeto.pessoa.endereco.complemento}</p>
                            <p class="text"><strong>Bairro:</strong> ${projeto.pessoa.endereco.bairro}</p>
                            <p class="text"><strong>CEP:</strong> ${projeto.pessoa.endereco.cep}</p>
                            <p class="text"><strong>Cidade:</strong> ${projeto.pessoa.endereco.cidade.nome}</p>
                            <p class="text"><strong>Estado:</strong> ${projeto.pessoa.endereco.cidade.estado.nome} - ${projeto.pessoa.endereco.cidade.estado.sigla}</p>
                            <hr>

                        </div> 
                        <div class="col-xs-6 table-responsive">

                            <strong><i class="fa fa-calendar margin-r-5"></i> Datas</strong>

                            <p class="text"><strong>Data Inicial:</strong> ${projeto.dataInicio.toString("dd/MM/yyyy")}</p>
                            <p class="text"><strong>Data Final:</strong> ${projeto.dataFinal.toString("dd/MM/yyyy")}</p>                       
                            <p class="text"><strong>Data Prev. Fim:</strong> ${projeto.dataPrevistaFim.toString("dd/MM/yyyy")}</p>                                                                 
                            <hr>

                            <strong><i class="fa fa-book margin-r-5"></i> Dados Cadastrais</strong>

                            <p class="text"><strong>ART:</strong> ${projeto.art}</p>
                            <p class="text"><strong>Área Total:</strong> ${projeto.areaTotal}</p>
                            <p class="text"><strong>Área Terreno:</strong> ${projeto.areaTerreno}</p>
                            <p class="text"><strong>Ref. Cadastral:</strong> ${projeto.referenciaCadastral}</p>
                            <p class="text"><strong>Cad. Anterior:</strong> ${projeto.cadastroAnterior}</p>
                            <p class="text"><strong>Zoneamento:</strong> ${projeto.zoneamento}</p>
                            <p class="text"><strong>Núm. Matrícula:</strong> ${projeto.numeroMatricula}</p>
                            <p class="text"><strong>Lote/Quadra:</strong> ${projeto.loteQuadra}</p>

                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço da Obra</strong>

                            <p class="text"><strong>Logradouro:</strong> ${projeto.endereco.rua}, ${projeto.endereco.numero}</p>
                            <p class="text"><strong>Complemento:</strong> ${projeto.endereco.complemento}</p>
                            <p class="text"><strong>Bairro:</strong> ${projeto.endereco.bairro}</p>
                            <p class="text"><strong>CEP:</strong> ${projeto.endereco.cep}</p>
                            <p class="text"><strong>Cidade:</strong> ${projeto.endereco.cidade.nome}</p>
                            <p class="text"><strong>Estado:</strong> ${projeto.endereco.cidade.estado.nome} - ${projeto.endereco.cidade.estado.sigla}</p>
                            <hr>                          
                        </div>   
                        <div>
                            <c:choose>
                                <c:when test="${empty projeto.atividadeItem}">
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

                                        <c:forEach items="${projeto.atividadeItem}" var="aI" varStatus="seqItens">
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
                            <c:forEach items="${projeto.contasReceber}" var="contasReceber" varStatus="seqItens">
                                <div class="box">                           
                                    <div class="">
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