/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validaCampoNome() {
    if ($("#nome").val() === "") {
        $("#dNome").removeClass().addClass("col-sm-10 has-error");
        $("#sNome").html("Campo Nome não pode ser vazio.");
    } else {
        if ($("#nome").val().length < 3) {
            $("#dNome").removeClass().addClass("col-sm-10 has-error");
            $("#sNome").html("Campo Nome deve conter no minímo 3 e no máximo 200 caracteres.");
        } else {
            $("#dNome").removeClass().addClass("col-sm-10 has-success");
            $("#sNome").html("");
        }
    }
}

function validaCampoCPF() {
    if ($("#cpf").val().length < 14) {
        $("#iCPF").removeClass().addClass("col-sm-10 has-error");
        $("#sCPF").html("Campo CPF deve conter no minímo 20 caracteres.");
    } else {
        $("#iCPF").removeClass().addClass("col-sm-10 has-success");
        $("#sCPF").html("");
    }
}

function validaCampoRG() {
    if ($("#rg").val().length < 12) {
        $("#iRG").removeClass().addClass("col-sm-10 has-error");
        $("#sRG").html("Campo RG deve conter no minímo 12 caracteres.");
    } else {
        $("#iRG").removeClass().addClass("col-sm-10 has-success");
        $("#sRG").html("");
    }
}

function validaCampoCNPJ() {
    if ($("#cnpj").val().length < 18) {
        $("#dCNPJ").removeClass().addClass("col-sm-10 has-error");
        $("#sCNPJ").html("Campo CNPJ deve conter no minímo 18 caracteres.");
    } else {
        $("#dCNPJ").removeClass().addClass("col-sm-10 has-success");
        $("#sCNPJ").html("");
    }
}

function validaCampoIE() {
    if ($("#ie").val().length < 18) {
        $("#dIE").removeClass().addClass("col-sm-10 has-error");
        $("#sIE").html("Campo Inscrição Estadual deve conter no minímo 18 caracteres.");
    } else {
        $("#dIE").removeClass().addClass("col-sm-10 has-success");
        $("#sIE").html("");
    }
}

function validaCampoSenha() {
    if ($("#senha").val().length < 6) {
        $("#dSenha").removeClass().addClass("col-sm-10 has-error");
        $("#sSenha").html("Campo Senha deve conter no minímo 6 caracteres.");
    } else {
        $("#dSenha").removeClass().addClass("col-sm-10 has-success");
        $("#sSenha").html("");
    }
}

$("#opcao").change(function () {
    if ($("#opcao").val() === "Selecionar") {
        $("#pessoaFisica").css("display", "none");
        $("#pessoaJuridica").css("display", "none");
    } else {
        if ($("#opcao").val() === "PessoaFisica") {
            $("#pessoaFisica").css("display", "block");
            $("#pessoaJuridica").css("display", "none");
        } else {
            $("#pessoaJuridica").css("display", "block");
            $("#pessoaFisica").css("display", "none");
        }
    }
});



function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e) {
    var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode === 13 || whichCode === 8)
        return true;
    key = String.fromCharCode(whichCode); // Valor para o código da Chave  
    if (strCheck.indexOf(key) === -1)
        return false; // Chave inválida  
    len = objTextBox.value.length;
    for (i = 0; i < len; i++)
        if ((objTextBox.value.charAt(i) !== '0') && (objTextBox.value.charAt(i) !== SeparadorDecimal))
            break;
    aux = '';
    for (; i < len; i++)
        if (strCheck.indexOf(objTextBox.value.charAt(i)) !== -1)
            aux += objTextBox.value.charAt(i);
    aux += key;
    len = aux.length;
    if (len === 0)
        objTextBox.value = '';
    if (len === 1)
        objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
    if (len === 2)
        objTextBox.value = '0' + SeparadorDecimal + aux;
    if (len > 2) {
        aux2 = '';
        for (j = 0, i = len - 3; i >= 0; i--) {
            if (j === 3) {
                aux2 += SeparadorMilesimo;
                j = 0;
            }
            aux2 += aux.charAt(i);
            j++;
        }
        objTextBox.value = '';
        len2 = aux2.length;
        for (i = len2 - 1; i >= 0; i--)
            objTextBox.value += aux2.charAt(i);
        objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
    }
    return false;
}  