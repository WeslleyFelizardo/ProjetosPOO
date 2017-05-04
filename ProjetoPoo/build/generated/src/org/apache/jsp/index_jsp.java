package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/WEB-INF/menu.jspf");
    _jspx_dependants.add("/WEB-INF/rodape.jspf");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/materialize.css\" type=\"text/css\" rel=\"stylesheet\" media=\"screen,projection\"/>\n");
      out.write("        <link href=\"css/style.css\" type=\"text/css\" rel=\"stylesheet\" media=\"screen,projection\"/>\n");
      out.write("        <title>Home</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("         <nav class=\"light-blue lighten-1\" role=\"navigation\">\r\n");
      out.write("             <div class=\"nav-wrapper container\"><a id=\"logo-container\" href=\"../ProjetoPoo/index.jsp\" class=\"brand-logo\">Home</a>\r\n");
      out.write("      <ul class=\"right hide-on-med-and-down\">\r\n");
      out.write("          <li><a href=\"listagem-cliente.jsp?page=1\" style=\"font-size: 160%\">Cliente</a></li>\r\n");
      out.write("        <li><a href=\"cliente/novoFornecedor.jsp#\" style=\"font-size: 160%\">Fornecedor</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("\r\n");
      out.write("      <ul id=\"nav-mobile\" class=\"side-nav\">\r\n");
      out.write("        <li><a href=\"#\">Navbar Link</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("      <a href=\"#\" data-activates=\"nav-mobile\" class=\"button-collapse\"><i class=\"material-icons\">menu</i></a>\r\n");
      out.write("    </div>\r\n");
      out.write("  </nav>\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <img src=\"img/image.jpg\" style=\"align-content: center\" >\n");
      out.write("              \n");
      out.write("        ");
      out.write("\r\n");
      out.write("<footer class=\"page-footer orange\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("      <div class=\"row\">\r\n");
      out.write("        <div class=\"col l6 s12\">\r\n");
      out.write("          <h5 class=\"white-text\">Projeto Controle Cadastral</h5>\r\n");
      out.write("          <p class=\"grey-text text-lighten-4\">Cadastro de CLIENTES e FORNECEDORES que permite listagem, inclusão, alteração e remoção de dados cadastrais.</p>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col l3 s12\">\r\n");
      out.write("          <h5 class=\"white-text\">Colaboradores</h5>\r\n");
      out.write("          <ul>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">Anderson Orsogna</a></li>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">Otávio Guimarães</a></li>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">Roberta Reis</a></li>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">Weslley Felizardo</a></li>\r\n");
      out.write("          </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col l3 s12\">\r\n");
      out.write("          <h5 class=\"white-text\">Contatos</h5>\r\n");
      out.write("          <ul>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">andersonorso@gmail.com</a></li>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">otaviogui@@gmail.com</a></li>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">robertareis@gmail.com</a></li>\r\n");
      out.write("            <li><a class=\"white-text\" href=\"#!\">wesllwyfeliz@gmail.com</a></li>\r\n");
      out.write("          </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"footer-copyright\">\r\n");
      out.write("      <div class=\"container center-align\" >\r\n");
      out.write("          <p>Desenvolvido por Grupo 4 - POO - ADS Noturno</p>\r\n");
      out.write("          &copy; 2017 - Todos os direitos reservados.\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </footer>");
      out.write("\n");
      out.write("        <!--  Scripts-->\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n");
      out.write("        <script src=\"../js/materialize.js\"></script>\n");
      out.write("        <script src=\"../js/init.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
