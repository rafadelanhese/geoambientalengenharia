<%-- 
    Document   : visualizar
    Created on : 07/02/2018, 18:19:03
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>    
    <body>
        <div class="row">                             
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i> Geoambiental Engenharia - Orçamento - ID: #${orcamento.idOrcamento}
                            <small class="pull-right">Presidente Prudente, ${dataAtual.toString("dd/MM/yyyy")}</small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-12 invoice-col">
                        Contratado
                        <address>
                            <strong>${parametro.nome}</strong><br/>
                            CNPJ: ${parametro.cnpj}<br/>
                            ${parametro.endereco.rua}, ${parametro.endereco.numero}<br/>                            
                            ${parametro.endereco.bairro} - ${parametro.endereco.cep}<br/>
                            ${parametro.endereco.cidade.nome}/${parametro.endereco.cidade.estado.sigla}<br/>                                                        
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-12 invoice-col">
                        Contratante
                        <address>
                            <strong>${orcamento.pessoa.nome}</strong><br>
                            <c:choose>
                                <c:when test="${orcamento.pessoa.getClass().getSimpleName() eq 'PessoaFisica'}">
                                    RG: ${orcamento.pessoa.cpf}<br/>
                                    CPF: ${orcamento.pessoa.rg}<br/>
                                </c:when>                            
                                <c:otherwise>
                                    CNPJ: ${orcamento.pessoa.cnpj}<br/>
                                    Inscr. Estadual: ${orcamento.pessoa.ie}<br/>
                                </c:otherwise>
                            </c:choose>             
                            ${orcamento.pessoa.endereco.rua} - ${orcamento.pessoa.endereco.numero}<br/>
                            ${orcamento.pessoa.endereco.bairro} - ${orcamento.pessoa.endereco.cidade.nome}<br/>                    
                        </address>
                    </div>
                    <!-- /.col -->                   
                </div>
                <!-- /.row -->
                <div>
                    <!-- Referencia -->
                    <div>
                        <strong>Ref.: </strong>${orcamento.tipoOrcamento.descricao}               
                    </div>
                    <!-- /.row -->

                    <!-- OBJETIVO -->
                    <div class="form-group">
                        <br>
                        <b>1. Objetivo</b>                        
                        ${orcamento.objetivo}
                        <hr/>
                        <b>2. Do valor total da proposta</b>                        
                        ${orcamento.proposta}
                        <hr/>
                        <b>3. Forma de pagamento</b>                        
                        ${orcamento.formapagamento}
                        <hr/>
                        <b>4. Taxas e Emolumentos</b>                        
                        ${orcamento.taxaseemolumentos}
                        <hr/>
                        <b>5. Início das atividades</b>                        
                        ${orcamento.inicioatividades}
                        <hr/>
                        <b>6. Da validade da proposta</b>                        
                        ${orcamento.validadeproposta}
                    </div>
                    <!-- /.row -->                                  
                </div>

                <!-- this row will not appear when printing -->
                <div class="row no-print">
                    <div class="col-xs-12"> 
                        <a href="${linkTo[OrcamentoController].lista}" class="btn btn-default">Voltar</a>
                        <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
                            <a href="${linkTo[OrcamentoController].relatorio(orcamento.idOrcamento)}" target="_blank" style="color: white">  <i class="fa fa-download"></i> Imprimir</a>
                        </button>
                    </div>
                </div>
            </section>             
        </div>
    </body>
</html>
