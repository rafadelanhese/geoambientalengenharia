/*
 * 
 * FUNÇÕES DA PÁGINA /ATIVIDADE/CADASTRO.JSP
 */
function mostraCamposProjeto() {
    $("#projetoBloco1").css("display", "block");
    $("#projetoBloco2").css("display", "block");
    $("#projetoBloco3").css("display", "block");
    $("#projetoBloco4").css("display", "block");
}

function mostraCamposLicenca() {
    $("#licencaBloco1").css("display", "block");
    $("#licencaBloco2").css("display", "block");
    $("#licencaBloco3").css("display", "block");
}

function mostraCamposServico() {
    $("#servicoBloco1").css("display", "block");
}

function desabilitaTodosCamposAtividade() {
    $("#projetoBloco1").css("display", "none");
    $("#projetoBloco2").css("display", "none");
    $("#projetoBloco3").css("display", "none");
    $("#projetoBloco4").css("display", "none");

    $("#licencaBloco1").css("display", "none");
    $("#licencaBloco2").css("display", "none");
    $("#licencaBloco3").css("display", "none");

    $("#servicoBloco1").css("display", "none");
}

function somenteNumeros(num) {
    var er = /[^0-9.]/;
    er.lastIndex = 0;
    var campo = num;
    if (er.test(campo.value)) {
        campo.value = "";
    }
}

function mudaOpcaoAtividade() {
    desabilitaTodosCamposAtividade();
    if ($("#opcaoAtividade").val() === "0") {
        $.notify("Selecione um tipo de atividade", "error");
    } else {
        if ($("#opcaoAtividade").val() === "LICENCA") {
            mostraCamposLicenca();
        } else {
            if ($("#opcaoAtividade").val() === "PROJETO") {
                mostraCamposProjeto();
            } else {
                if ($("#opcaoAtividade").val() === "SERVICO") {
                    mostraCamposServico();
                }
            }
        }
    }
}