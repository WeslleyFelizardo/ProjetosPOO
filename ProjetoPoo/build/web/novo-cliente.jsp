<%-- 
    Document   : novo
    Created on : 29/04/2017, 03:50:31
    Author     : Cleide
--%>


<%@page import="java.io.FileReader"%>
<%@page import="javax.script.Invocable"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="javax.script.ScriptEngine"%>
<%@page import="java.net.URL"%>
<%@page import="br.com.fatecpg.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <title>Cadastro Cliente</title>
    </head>
    <body>

        <%@ include file="WEB-INF/menu.jspf" %>
        <%
            Cliente acessoCliente = null;
            Cliente clienteSelecionado = null;
            String acao = "";

            try {
                acessoCliente = new Cliente();

                if (request.getParameter("id") != null) {
                    clienteSelecionado = acessoCliente.getPorId(Integer.parseInt(request.getParameter("id")));
                    acao = "atualizar";
                } else {
                    acao = "inserir";
                }
            } catch (Exception e) { %>
        <div>
            Erro ao solicitar a operação
        </div>
        <% }

        %>
       
        <div class="container">
            <h1>Cliente</h1>
            <hr>
            <div class="row">
                <form class="col s12" method="post" action="">
                    <input type="hidden" name="sucesso" value="<%=acao%>"/>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">label</i>
                            <input id="nome" name="nome" value="<%= (clienteSelecionado != null) ? clienteSelecionado.getNome() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Nome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">recent_actors</i>
                            <input id="cpf" name="cpf" value="<%= (clienteSelecionado != null) ? clienteSelecionado.getCpf() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Cpf</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="rg" name="rg" value="<%= (clienteSelecionado != null) ? clienteSelecionado.getRg() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Rg</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">email</i>
                            <input id="email" name="email" value="<%= (clienteSelecionado != null) ? clienteSelecionado.getEmail() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">phone</i>
                            <input id="telefone" name="telefone" value="<%= (clienteSelecionado != null) ? clienteSelecionado.getTelefone() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Telefone</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <i class="material-icons prefix">location_on</i>
                            <input id="endereco" name="endereco" value="<%= (clienteSelecionado != null) ? clienteSelecionado.getEndereco() : ""%>" id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Endereço</label>
                        </div>
                    </div>
                    <div class="row">
                        <input type="hidden" name="acao" value="<%= (clienteSelecionado == null) ? "inserir" : "atualizar"%>">
                        <button class="btn waves-effect waves-light" type="submit"><%= (clienteSelecionado == null) ? "Cadastrar" : "Atualizar"%>
                            <i class="material-icons right">send</i>
                        </button>
                        <a href="listagem-cliente.jsp?page=1" class="btn waves-effect red darken-3">Voltar</a>
                    </div>

                </form>
            </div>

        </div>        
        <%
            String opcao = request.getParameter("acao");
            if (opcao != null) {
                Cliente novo = new Cliente(request.getParameter("nome"),
                        request.getParameter("telefone"),
                        request.getParameter("email"),
                        request.getParameter("endereco"),
                        request.getParameter("rg"),
                        request.getParameter("cpf"));
                if (opcao.equals("inserir")) {
                    if (acessoCliente.inserir(novo)) { 
                    //response.sendRedirect("http://localhost:8084/ProjetoPoo/listagem-cliente.jsp?page=1");
            %>
                      <script>alert("Cadastrado com sucesso");window.location.href = "listagem-cliente.jsp?page=1";</script>  
                    <%    
                    }
                } else {
                    novo.setId(clienteSelecionado.getId());
                    acessoCliente.editar(novo); %>
                     <script>alert("Atualizado com sucesso");window.location.href = "listagem-cliente.jsp?page=1";</script>  
                <% }
            }
        %>
        <%@ include file="WEB-INF/rodape.jspf" %>

        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <script src="js/jquery.maskedinput.js"></script>

        <script type="text/javascript" src="js/mascaras.js">

        </script>
    </body>
</html>
