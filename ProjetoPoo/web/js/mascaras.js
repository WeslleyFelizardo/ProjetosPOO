/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#cpf").mask("999.999.999-99");
    $("#rg").mask("99.999.999-*");
    $("#telefone").mask("(99) 9999-9999");
})

function deletarFornecedor(id) {
    if (confirm('Deseja excluir o fornecedor?'))
    {
        window.location.href = "listagem-fornecedor.jsp?id=" + id;
        //window.location.href = "listagem-fornecedor.jsp?page=1";
    } else {
        window.location.href = "listagem-fornecedor.jsp?page=1";
    }
}

function deletarCliente(id) {
    if (confirm('Deseja excluir o cliente?'))
    {
        //alert('excluir');
        window.location.href = "listagem-cliente.jsp?id=" + id;
        //window.location.href = "listagem-cliente.jsp?page=1";
    } else {
        window.location.href = "listagem-cliente.jsp?page=1";
    }
}
