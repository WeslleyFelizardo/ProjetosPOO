<%-- 
    Document   : cliente
    Created on : 29/04/2017, 02:17:49
    Author     : Cleide
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.model.Pessoa"%>
<%@page import="br.com.fatecpg.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <title>Clientes</title>
    </head>
    <body>
        <%@ include file="WEB-INF/menu.jspf" %>
        <%
            boolean proximo = false;
            ArrayList<Cliente> clientePaginados;
            clientePaginados = new ArrayList<>();
            Cliente cliente = null;
            int paginaSelecionada = 1;
            Float links = 0.0f;
            try {
                cliente = new Cliente();
                links = cliente.gerarLinks();
            } catch (Exception e) {
            }
        %>

        <div class="container">
            <h2>Listagem de clientes</h2><br><br>
            <a href="novo-cliente.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>

            <%
                if (request.getParameter("page") != null) {
                    links = cliente.gerarLinks();
                    paginaSelecionada = Integer.parseInt(request.getParameter("page")); %>
            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Cpf</th>
                        <th>Rg</th>
                        <th>Email</th>
                        <th>Telefone</th>
                        <th>Endereco</th>
                        <th>Editar/Remover</th>
                    </tr>
                </thead>

                <tbody>
                    <%

                        //System.out.println(cliente.proximoAnterior);
                        clientePaginados = cliente.listarPaginado(paginaSelecionada);
                        for (Cliente clientes : clientePaginados) {
                            Cliente clienteAtual = (Cliente) clientes;
                    %>
                    <tr>
                        <td><%= clienteAtual.getNome()%></td>
                        <td><%= clienteAtual.getCpf()%></td>
                        <td><%= clienteAtual.getRg()%></td>
                        <td><%= clienteAtual.getEmail()%></td>
                        <td><%= clienteAtual.getTelefone()%></td>
                        <td><%= clienteAtual.getEndereco()%></td>

                        <td>
                            <a href="novo-cliente.jsp?id=<%= clienteAtual.getId()%>" class="small material-icons">mode_edit</a>

                            <a href="#" onclick="deletarCliente(<%= clienteAtual.getId() %>)" class="small material-icons">delete</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <% if (links > 0) {%>
            <div class="center-align">
                <ul class="pagination">
                    <li class="waves-effect <%= (paginaSelecionada == 1) ? "disabled" : ""%>"><a href="listagem-cliente.jsp?page=<%= 1%>"><i class="material-icons">fast_rewind</i></a></li>
                    <li class="waves-effect <%= (paginaSelecionada == 1) ? "disabled" : ""%>"><a href="listagem-cliente.jsp?page=<%= (paginaSelecionada == 1) ? paginaSelecionada : paginaSelecionada - 1%>"><i class="material-icons">chevron_left</i></a></li>
                        <% if (paginaSelecionada != 1) {%>
                    <li class="<%= (paginaSelecionada == paginaSelecionada - 1) ? "active" : ""%>"><a href="listagem-cliente.jsp?page=<%= paginaSelecionada - 1%>"><%= paginaSelecionada - 1%></a></li>
                        <% }%>
                    <li class="<%= (paginaSelecionada == paginaSelecionada) ? "active" : ""%>"><a href="listagem-cliente.jsp?page=<%= paginaSelecionada%>"><%= paginaSelecionada%></a></li>
                        <% if (paginaSelecionada != links) {%>
                    <li class="<%= (paginaSelecionada == paginaSelecionada + 1) ? "active" : ""%>"><a href="listagem-cliente.jsp?page=<%= paginaSelecionada + 1%>"><%= paginaSelecionada + 1%></a></li>
                        <% }%>
                    <li class="waves-effect <%= (paginaSelecionada == links) ? "disabled" : ""%>"><a href="listagem-cliente.jsp?page=<%= (paginaSelecionada == links) ? paginaSelecionada : paginaSelecionada + 1%>"><i class="material-icons">chevron_right</i></a></li>
                    <li class="waves-effect <%= (paginaSelecionada == links) ? "disabled" : ""%>"><a href="listagem-cliente.jsp?page=<%= new Integer(links.intValue())%>"><i class="material-icons">fast_forward</i></a></li>
                </ul> 
                Total de registros: <%= cliente.listar().size()%> <br>
                Total de paginas: <%= new Integer(links.intValue())%>
            </div>
            <% } %>

            <% } %>
            <%
                try {
                    if (request.getParameter("id") != null) {
                        cliente.deletar(Integer.parseInt(request.getParameter("id")));
                        links = cliente.gerarLinks();
                        response.sendRedirect("http://localhost:8084/ProjetoPoo/listagem-cliente.jsp?page=1");
                    }
                } catch (Exception e) {
                }
            %>
        </div>
      
        <br><br><br><br>

        <%@ include file="WEB-INF/rodape.jspf" %>


        <!--  Scripts-->
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.js"></script>
        <script type="text/javascript" src="js/init.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="js/mascaras.js"></script>
       

    </body>
</html>
