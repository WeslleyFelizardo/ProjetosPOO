<%-- 
    Document   : novoFornecedor
    Created on : May 2, 2017, 11:51:25 PM
    Author     : O77O
--%>
<%@page import="br.com.fatecpg.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <title>Fornecedor</title>
    </head>
    <body>

        <%@ include file="WEB-INF/menu.jspf" %>
        <%
            Fornecedor acessoFornecedor = null;
            Fornecedor fornecedorSelecionado = null;
            String acao = "";
            try {
                acessoFornecedor = new Fornecedor("", "", "", "", "", "");

                if (request.getParameter("id") != null) {
                    acao = "atualizar";
                    fornecedorSelecionado = acessoFornecedor.getPorId(Integer.parseInt(request.getParameter("id")));
                } else {
                    acao = "inserir";
                }
            } catch (Exception e) { %>

        <% }%>

        %>

        <div class="container">
            <h1>Fornecedor</h1>
            <hr>
            <div class="row">
                <form class="col s12" method="post" action="">
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">label</i>
                            <input name="razaoSocial" value="<%= (fornecedorSelecionado != null) ? fornecedorSelecionado.getrSocial() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Razão Social</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">label</i>
                            <input name="nome" value="<%= (fornecedorSelecionado != null) ? fornecedorSelecionado.getNomeFantasia() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Nome Fantasia</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">recent_actors</i>
                            <input id="cnpj" name="cnpj" value="<%= (fornecedorSelecionado != null) ? fornecedorSelecionado.getCnpj() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Cnpj</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">email</i>
                            <input name="email" value="<%= (fornecedorSelecionado != null) ? fornecedorSelecionado.getEmail() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">phone</i>
                            <input id="telefoneFornecedor" name="telefone" value="<%= (fornecedorSelecionado != null) ? fornecedorSelecionado.getTelefone() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Telefone</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">location_on</i>
                            <input name="endereco" value="<%= (fornecedorSelecionado != null) ? fornecedorSelecionado.getEndereco() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Endereço</label>
                        </div>
                    </div>
                    <div class="row">
                        <input type="hidden" name="acao" value="<%= (fornecedorSelecionado == null) ? "inserir" : "atualizar"%>">
                        <button class="btn waves-effect waves-light" type="submit"><%= (fornecedorSelecionado == null) ? "Cadastrar" : "Atualizar"%>
                            <i class="material-icons right">send</i>
                        </button>
                        <a href="listagem-fornecedor.jsp?page=1" class="btn waves-effect red darken-3">Voltar</a>
                    </div>

                </form>
            </div>

        </div>             
        <%
            String opcao = request.getParameter("acao");
            if (opcao != null) {
                Fornecedor novo = new Fornecedor(request.getParameter("nome"),
                        request.getParameter("telefone"),
                        request.getParameter("endereco"),
                        request.getParameter("email"),
                        request.getParameter("cnpj"),
                        request.getParameter("razaoSocial"));
                if (opcao.equals("inserir")) {
                    if (acessoFornecedor.inserir(novo)) {
                        //response.sendRedirect("http://localhost:8084/ProjetoPoo/listagem-fornecedor.jsp?page=1");
        %>
        <script>alert("Cadastrado com sucesso");window.location.href = "listagem-fornecedor.jsp?page=1";</script>  
        <% }
        } else {
            novo.setId(fornecedorSelecionado.getId());
            acessoFornecedor.editar(novo);
            //response.sendRedirect("http://localhost:8084/ProjetoPoo/listagem-fornecedor.jsp?page=1");
        %>
        <script>alert("Atualizado com sucesso");window.location.href = "listagem-fornecedor.jsp?page=1";</script>  
        <% }
        }
        %>
        <%@ include file="WEB-INF/rodape.jspf" %>

        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <script src="js/jquery.maskedinput.js"></script>

        <script type="text/javascript">
                             $(document).ready(function () {
                                 $("#telefoneFornecedor").mask("(99) 9999-9999");
                                 $("#cnpj").mask("99.999.999/9999-99");
                             })
        </script>
    </body>
</html>
