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
@WebServlet(name = "ResultadoJurosSimples", urlPatterns = {"/resultadojurosimples"})
public class ResultadoJurosSimples extends HttpServlet {

      private JurosSimples juros;
      private boolean erro = false;

    public ResultadoJurosSimples() {
        this.juros = new JurosSimples();
    }
    
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
//             
            //out.println("<h1>Servlet ResultadoJurosSimples at " + request.getContextPath() + "</h1>");
            
            out.println("<div class='container'>");
            
       
             out.println(" <div id=\"page-wrapper\">");
             out.println("<div class=\"container-fluid\">");
             out.println("<center><h2>Resultado</h2></center>");
             //out.println(request.getParameter("capital"));
              try {
                this.juros.setCapital(Double.parseDouble(request.getParameter("capital")));
                this.juros.setTaxa(Double.parseDouble(request.getParameter("taxa")));
                this.juros.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                
                
            } catch (Exception e) {
                this.erro = true;
            };
            
            if(!this.erro){
             out.println("<div class='alert alert-success'>");
             out.println("O valor do juros simples acrescido do montante é: R$ " + this.juros.CalcularJurosSimples(juros));
             out.println("</div>");
            }else{
             out.println("<div class='alert alert-danger'>");
             out.println("Informe apenas numeros para calcular o juros simples");
             out.println("</div>");
            }
             out.println("<br/>");
             out.println("<center><a href='index.html' class='btn btn-danger'>Voltar</a></center>");
             this.erro = false;
             out.println("</div>");
             out.println("</div>");
             out.println("</div>");    
            
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
