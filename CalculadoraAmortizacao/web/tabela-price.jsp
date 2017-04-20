<%-- 
    Document   : tabela-price
    Created on : 17/04/2017, 13:50:16
    Author     : Cleide
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="br.com.fatecpg.tabelaPrice.TabelaPrice"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Tabela Price</title>
        <!-- BOOTSTRAP CORE STYLE CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLE CSS -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLE CSS -->
        <link href="assets/css/style.css" rel="stylesheet" />    
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>    
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <br/><br/><br/>
        <div class="container">
            <h2>Cálculo Financiamento PRICE</h2>
            <hr/>
        </div>
        
        <%
            TabelaPrice tabelaPrice = null;
            DecimalFormat decimalFormat = new DecimalFormat("#0.00");
            int numeroParcelas = 0;
            double valorParcela = 0;
            double entrada = 0;
            boolean erro = false;

            try {
                double valor = Double.parseDouble(request.getParameter("txtValor"));
                entrada = (!request.getParameter("txtEntrada").isEmpty()) ? Double.parseDouble(request.getParameter("txtEntrada")) : 0.0;
                numeroParcelas = Integer.parseInt(request.getParameter("txtPrestacoes"));
                double taxa = Double.parseDouble(request.getParameter("txtTaxa"));

                tabelaPrice = new TabelaPrice(valor, entrada, taxa, numeroParcelas);
                valorParcela = tabelaPrice.calcularParcelas();
            } catch (Exception e) {
                erro = true;
                //entrada = 0;
            }
        %>

        <div class="fundo container">
            <br/>
            <form class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="txtValor" class="col-sm-2 control-label">Valor</label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <div class="input-group-addon">$</div>
                            <input type="number" class="form-control" step="0.01" name="txtValor" placeholder="ex: 12000,67">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtEntrada" class="col-sm-2 control-label">Entrada</label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <div class="input-group-addon">$</div>
                            <input type="number" class="form-control" step="0.01" name="txtEntrada" placeholder="ex: 120,67">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPrestacoes" class="col-sm-2 control-label">Número de prestações</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" name="txtPrestacoes" placeholder="ex: 12">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtTaxa" class="col-sm-2 control-label">Taxa de Juros (%a.m.)</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" step="0.01" name="txtTaxa" placeholder="ex: 12,5">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success">Calcular</button>
                    </div>
                </div>
            </form>
        </div>

        <% if (!erro) { %>
        <div class="container">
            <h2>Resultado:</h2>
            <div class="row">
                <div class="col-sm-6">
                    <table class="table">
                        <tr>
                            <th>Mês</th>
                            <th>Prestação</th>
                            <th>Juros</th>
                            <th>Amortização</th>
                            <th>Saldo devedor</th>
                        </tr>

                        <% for (int i = 0; i <= numeroParcelas; i++) {%>
                        <tr>
                            <td><%= (i)%></td>
                            <td><%= (i != 0) ? decimalFormat.format(valorParcela) : 0.0 %></td>
                            <td><%= (i != 0) ? decimalFormat.format(tabelaPrice.calcularJuros()) : 0.0 %></td>
                            <td><%= (i != 0) ? decimalFormat.format(tabelaPrice.calcularAmortizacao()) : 0.0 %></td>
                            <td><%= decimalFormat.format(tabelaPrice.calcularSaldoDevedor())%></td>
                        </tr>
                        <% }%>
                    </table>
                </div>
                <div class="col-sm-4">
                    <span><h4>Total prestação: <%= decimalFormat.format(numeroParcelas * valorParcela)%></h4></span>
                    <span><h4>Total juros: <%= decimalFormat.format(tabelaPrice.getTotalJuros())%> </h4></span>
                    <span><h4>Total amortização: <%= decimalFormat.format(tabelaPrice.getTotalAmortizacao())%> </h4></span>
                </div>
            </div>
        </div>
        <% } %>
        
        <br/><br/><br/>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
        <script src="assets/plugins/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/plugins/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="assets/js/custom.js"></script>
    </body>

</html>
