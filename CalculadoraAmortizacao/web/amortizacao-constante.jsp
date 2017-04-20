<%@page import="java.text.DecimalFormat"%>;

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Sistema de Amortização Constante</title>
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
        
            <div class="container" style="align-content: center">
                <h2>Sistema de Amortização Constante </h2>
                <hr/>
              
                <%
                    int p = 0;
                    try {
                        p = Integer.parseInt(request.getParameter("p"));
                    } catch (Exception e) {
                    }
                    float v = 0;
                    try {
                        v = Float.parseFloat(request.getParameter("v"));
                    } catch (Exception e) {
                    }
                    float j = 0;
                    try {
                        j = Float.parseFloat(request.getParameter("j"));
                    } catch (Exception e) {
                    }
                    float asd = v;
                    float aj = v;
                    DecimalFormat cv = new DecimalFormat("#0.00");
                    DecimalFormat cj = new DecimalFormat("#0.00");
                    float totalJuros = 0;
                %>
                <div class="fundo container">
                    <br/>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="p" class="col-sm-2 control-label">Período(meses)</label>
                            <div class="col-sm-2">
                                    <input class="form-control" type="number" name="p" placeholder="ex: 12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="v" class="col-sm-2 control-label">Valor</label>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <div class="input-group-addon">$</div>
                                    <input class="form-control" type="number" step="0.01" name="v" placeholder="ex: 12000,67"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="j" class="col-sm-2 control-label">Juros(%a.m.)</label>
                            <div class="col-sm-2">
                                    <input class="form-control" type="number" step="0.01" name="j" placeholder="ex: 12,5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-success">Calcular</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="container">
                    <h2>Resultado:</h2>
                    <div class="row">
                        <div class="col-sm-6">
                            <table class="table">
                                <tr>
                                    <th> Mês </th>
                                        <th> Saldo Devedor (R$) </th>
                                            <th> Amortização (R$) </th>
                                                <th> Juros (R$) </th>
                                                    <th> Prestação (R$) </th>
                                                        </tr>
                                                        <tr>
                                                            <td>0</td>
                                                            <td><%=cv.format(v)%></td>
                                                            <td><%=cv.format(0)%></td>
                                                            <td><%=cv.format(0)%></td>
                                                            <td><%=cv.format(0)%></td>                
                                                        </tr>
                                                        <%for (int i = 1; i <= p; i++) {%>             
                                                        <tr>
                                                            <td><%=i%></td>
                                                            <%if (i == p) {
                                                                    out.println("<td>" + cv.format(0) + "</td>");
                                                                } else {
                                                                    out.println("<td>" + cv.format(asd = (asd - (v / p))) + "</td>");
                                                                }%>
                                                            <%if (i == p) {
                                                                    out.println("<td>" + cv.format(v / p) + "</td>");
                                                                } else {
                                                                    out.println("<td>" + cv.format(v / p) + "</td>");
                                                                }%>
                                                            <%if (i < p) {
                                                                    out.println("<td>" + cj.format((asd + (v / p)) * (j / 100)) + "</td>");
                                                                    totalJuros = totalJuros + ((asd + (v / p)) * (j / 100));
                                                                } else {
                                                                    out.println("<td>" + cj.format((v / p) * (j / 100)) + "</td>");
                                                                    totalJuros = totalJuros + ((v / p) * (j / 100));
                                                                }%>
                                                            <%if (i < p) {
                                                                    out.println("<td>" + cj.format((v / p) + (asd + (v / p)) * (j / 100)) + "</td>");
                                                                } else {
                                                                    out.println("<td>" + cj.format((v / p) + (v / p) * (j / 100)) + "</td>");
                                                                }%>

                                                        </tr>
                                                        <%}%>
                                                        </table>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <span><h4>O total de juros é de: <%= cj.format(totalJuros) %></h4></span>
                                                            <br/>
                                                            <span><h4>O total a pagar é de: <%= cv.format(totalJuros + v) %></h4></span>
                                                            
                                                        </div>
                                                        </div>
                                                        </div>
                                                        <br/>

                                                        </div>
                                                   
                                                        <br/>
                                                        <br/>
                                                        <%@include file="WEB-INF/jspf/footer.jspf"%>
                                                        <script src="assets/plugins/jquery-1.10.2.js"></script>
                                                        <!-- BOOTSTRAP SCRIPTS  -->
                                                        <script src="assets/plugins/bootstrap.js"></script>
                                                        <!-- CUSTOM SCRIPTS  -->
                                                        <script src="assets/js/custom.js"></script>
                                                        </body>
                                                        </html>
