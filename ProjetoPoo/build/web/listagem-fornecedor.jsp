<%-- 
    Document   : cliente
    Created on : 29/04/2017, 02:17:49
    Author     : Cleide
--%>

<%@page import="br.com.fatecpg.model.Fornecedor"%>
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
            ArrayList<Fornecedor> fornecedorPaginados;
            fornecedorPaginados = new ArrayList<>();
            Fornecedor fornecedor = null;
            int paginaSelecionada = 1;
            Float links = 0.0f;
            try {
                fornecedor = new Fornecedor();
                links = fornecedor.gerarLinks();
            } catch (Exception e) {
            }
        %>

        <div class="container">
            <h2>Listagem de fornecedores</h2><br><br>
            <a href="novoFornecedor.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>

            <%
                if (request.getParameter("page") != null) {
                    links = fornecedor.gerarLinks();
                    paginaSelecionada = Integer.parseInt(request.getParameter("page")); %>
            <table>
                <thead>
                    <tr>
                        <th>Razão Social</th>
                        <th>Nome Fantasia</th>
                        <th>Cnpj</th>
                        <th>Email</th>
                        <th>Telefone</th>
                        <th>Endereco</th>
                        <th>Editar/Remover</th>
                    </tr>
                </thead>

                <tbody>
                    <%

                        //System.out.println(cliente.proximoAnterior);
                        fornecedorPaginados = fornecedor.listarPaginado(paginaSelecionada);
                        for (Fornecedor fornecedores : fornecedorPaginados) {
                            Fornecedor fornecedorAtual = fornecedores;
                    %>
                    <tr>
                       <td><%= fornecedorAtual.getrSocial()%></td>
                        <td><%= fornecedorAtual.getNomeFantasia()%></td>
                        <td><%= fornecedorAtual.getCnpj()%></td>
                        <td><%= fornecedorAtual.getEmail()%></td>
                        <td><%= fornecedorAtual.getTelefone()%></td>
                        <td><%= fornecedorAtual.getEndereco()%></td>
                        
                        
                        <td>
                            <a href="novoFornecedor.jsp?id=<%= fornecedorAtual.getId()%>" class="small material-icons">mode_edit</a>

                            <a onclick="deletarFornecedor(<%= fornecedorAtual.getId()%>)" href="#" class="small material-icons">delete</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <% if (links > 0) {%>
            <div class="center-align">
                <ul class="pagination">
                    <li class="waves-effect <%= (paginaSelecionada == 1) ? "disabled" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= 1%>"><i class="material-icons">fast_rewind</i></a></li>
                    <li class="waves-effect <%= (paginaSelecionada == 1) ? "disabled" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= (paginaSelecionada == 1) ? paginaSelecionada : paginaSelecionada - 1%>"><i class="material-icons">chevron_left</i></a></li>
                        <% if (paginaSelecionada != 1) {%>
                    <li class="<%= (paginaSelecionada == paginaSelecionada - 1) ? "active" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= paginaSelecionada - 1%>"><%= paginaSelecionada - 1%></a></li>
                        <% }%>
                    <li class="<%= (paginaSelecionada == paginaSelecionada) ? "active" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= paginaSelecionada%>"><%= paginaSelecionada%></a></li>
                        <% if (paginaSelecionada != links) {%>
                    <li class="<%= (paginaSelecionada == paginaSelecionada + 1) ? "active" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= paginaSelecionada + 1%>"><%= paginaSelecionada + 1%></a></li>
                        <% }%>
                    <li class="waves-effect <%= (paginaSelecionada == links) ? "disabled" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= (paginaSelecionada == links) ? paginaSelecionada : paginaSelecionada + 1%>"><i class="material-icons">chevron_right</i></a></li>
                    <li class="waves-effect <%= (paginaSelecionada == links) ? "disabled" : ""%>"><a href="listagem-fornecedor.jsp?page=<%= new Integer(links.intValue())%>"><i class="material-icons">fast_forward</i></a></li>
                </ul> 
                Total de registros: <%= fornecedor.listar().size()%> <br>
                Total de paginas: <%= new Integer(links.intValue())%>
            </div>
            <% } %>

            <% } %>
            <%
                try {
                    if (request.getParameter("id") != null) {
                        fornecedor.deletar(Integer.parseInt(request.getParameter("id")));
                        links = fornecedor.gerarLinks();
                        response.sendRedirect("http://localhost:8084/ProjetoPoo/listagem-fornecedor.jsp?page=1");
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
