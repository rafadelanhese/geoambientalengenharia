/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function somenteNumeros(num) {
    var er = /[^0-9.]/;
    er.lastIndex = 0;
    var campo = num;
    if (er.test(campo.value)) {
        campo.value = "";
    }
}

function mostraCamposPessoaFisica() {
    $("#pessoaFisica").css("display", "block");
}

function mostraCamposPessoaJuridica() {
    $("#pessoaJuridica").css("display", "block");
}

function ocultaCamposPessoa() {
    $("#pessoaFisica").css("display", "none");
    $("#pessoaJuridica").css("display", "none");
}

function mudaOpcaoPessoa() {
    ocultaCamposPessoa();
    if ($("#opcaoPessoa").val() === "0") {
        $.notify("Selecione um tipo de atividade", "error");
    } else {
        if ($("#opcaoPessoa").val() === "PessoaFisica") {
            mostraCamposPessoaFisica();
        } else {
            if ($("#opcaoPessoa").val() === "PessoaJuridica") {
                mostraCamposPessoaJuridica();
            }
        }
    }
}