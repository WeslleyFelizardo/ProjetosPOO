/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.servlet;

import br.com.fatecpg.jurosSimples.jurosSimples.JurosSimples;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cleide
 */
@WebServlet(name = "JurosSimplesServlet", urlPatterns = {"/jurossimples.html"})
public class JurosSimplesServlet extends HttpServlet { 
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            
            
            out.println("<title>Calculadora de Juros</title>\n" +
            "\n" +
            "    <!-- Bootstrap Core CSS -->\n" +
            "    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
            "\n" +
            "    <!-- Custom CSS -->\n" +
            "    <link href=\"css/sb-admin.css\" rel=\"stylesheet\">\n" +
            "\n" +
            "    <!-- Morris Charts CSS -->\n" +
            "    <link href=\"css/plugins/morris.css\" rel=\"stylesheet\">\n" +
            "\n" +
            "    <!-- Custom Fonts -->\n" +
            "    <link href=\"font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">");
            
         
            
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"wrapper\">");
            out.println("<nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n" +
            "          \n" +
            "            <div class=\"navbar-header\">\n" +
            "                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\n" +
            "                    <span class=\"sr-only\">Toggle navigation</span>\n" +
            "                    <span class=\"icon-bar\"></span>\n" +
            "                    <span class=\"icon-bar\"></span>\n" +
            "                    <span class=\"icon-bar\"></span>\n" +
            "                </button>\n" +
            "                <a class=\"navbar-brand\" href=\"index.html\"><i class=\"glyphicon glyphicon-hourglass\"></i> Calculadora de Juros</a>\n" +
            "            </div>\n" +
            "            <!-- Top Menu Items -->\n" +
            "            <ul class=\"nav navbar-right top-nav\">\n" +
            "                <li class=\"dropdown\">\n" +
            "                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-envelope\"></i> <b></b></a>\n" +
            "                    \n" +
            "                </li>\n" +
            "                <li>\n" +
            "                    <a href=\"#\" ><i class=\"fa fa-bell\"></i> <b></b></a>\n" +
            "                  \n" +
            "                </li>\n" +
            "                <li class=\"dropdown\">\n" +
            "                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-user\"></i> Grupo 7 <b></b></a>\n" +
            "                    \n" +
            "                </li>\n" +
            "            </ul>\n" +
            "            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->\n" +
            "            <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\n" +
            "                <ul class=\"nav navbar-nav side-nav\">\n" +
            "                    <li class=\"active\">\n" +
            "                        <a href=\"jurossimples.html\">Juros Simples</a>\n" +
            "                    </li>\n" +
            "                    <li>\n" +
            "                        <a href=\"juroscomposto.html\">Juros Composto</a>\n" +
            "                        \n" +
            "                    </li>\n" +
            "                </ul>\n" +
            "            </div>\n" +
            "            <!-- /.navbar-collapse -->\n" +
"        </nav>");
             
         
             out.println(" <div id=\"page-wrapper\">");
             out.println("<div class=\"container-fluid\">");
             out.println("<center><h2> Calcular Juros Simples</h2></center>");
             out.println("<form action='resultadojurosimples'>");
             out.println("<div class='row'>");
             
             out.println("<div class='col-6'>");
             out.println("<div class='form-group'>");
             out.println("<label for='capital'>Capital</label>");
             out.println("<input class=\"form-control\" type='text' name='capital' placeholder='Informe o valor do capital'/>");
             out.println("</div>");
             out.println("</div>");
             
             out.println("<div class='form-group'>");
             out.println("<label for='taxa'>Taxa</label>");
             out.println("<input class=\"form-control\" type='text' name='taxa' placeholder='Informe o valor da taxa'/>");
             out.println("</div>");
             
             out.println("<div class='form-group'>");
             out.println("<label for='periodo'>Periodo</label>");
             out.println("<input class=\"form-control\" type='text' name='periodo'  placeholder='Informe o periodo em meses'/>");
             out.println("</div>");
             
             out.println("<div class='form-group'>");
             out.println("<input class='btn btn-primary' type='submit' value='Calcular' />");
             out.println("</div>");
             
             out.println("</div>");
             out.println("</form>");
             //out.println(this.juros.CalcularJurosSimples(juros));
             out.println("</div>");
             out.println("</div>");
             out.println("</div>");    
            
             out.println("  <script src=\"js/jquery.js\"></script>\n" +
"\n" +
"    <!-- Bootstrap Core JavaScript -->\n" +
"    <script src=\"js/bootstrap.min.js\"></script>\n" +
"\n" +
"    <!-- Morris Charts JavaScript -->\n" +
"    <script src=\"js/plugins/morris/raphael.min.js\"></script>\n" +
"    <script src=\"js/plugins/morris/morris.min.js\"></script>\n" +
"    <script src=\"js/plugins/morris/morris-data.js\"></script>");
             
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
