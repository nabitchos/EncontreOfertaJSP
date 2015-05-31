package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class contato_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"pt-br\">\r\n");
      out.write("    <head>    \r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <title>Encontre Oferta</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilos.css\" type=\"text/css\">\r\n");
      out.write("        <!-- Banner -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/liquid-slider.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/jquery-ui.min.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write(" \r\n");
      out.write("        <section id=\"categorias\">\r\n");
      out.write("            <div class=\"meio\">\r\n");
      out.write("                <h1><a href=\"#\">Contato</a></h1>\r\n");
      out.write("                <article class=\"formContato\">\r\n");
      out.write("                    <div class=\"col60  bordaDir\">\r\n");
      out.write("                        <h2>Preencha o formulário abaixo para entrar em contato conosco</h2>\r\n");
      out.write("                        <form action=\"#\" name=\"formcontato\" id=\"formcontato\">\r\n");
      out.write("                            <div>\r\n");
      out.write("                                <label for=\"nome\">Nome: </label>\r\n");
      out.write("                                <input type=\"text\" id=\"nome\" name=\"nome\" required>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div>\r\n");
      out.write("                                <label for=\"email\">Email: </label>\r\n");
      out.write("                                <input type=\"email\" id=\"email\" name=\"email\" required>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div>\r\n");
      out.write("                                <label for=\"telefone\">Telefone: </label>\r\n");
      out.write("                                <input type=\"tel\" id=\"telefone\" name=\"telefone\" required>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div>\r\n");
      out.write("                                <label for=\"mensagem\">Mensagem: </label>\r\n");
      out.write("                                <textarea name=\"mensagem\" id=\"mensagem\" cols=\"30\" rows=\"5\" required></textarea>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div>\r\n");
      out.write("                                <input type=\"submit\" value=\"Enviar\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col40\">\r\n");
      out.write("                        <h2>Interaja conosco nas redes sociais</h2>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <a href=\"https://www.facebook.com/siteencontreoferta\" target=\"_blank\"><img src=\"images/facebook.png\" height=\"\" width=\"140\" alt=\"Encontre Oferta no Facebook\"></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <a href=\"http://twitter.com/encontreoferta\" target=\"_blank\"><img src=\"images/Twitter_logo_blue.png\" height=\"\" width=\"140\" alt=\"Encontre Oferta no Twitter\"></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <a href=\"https://plus.google.com/+EncontreofertaBrasil/\" target=\"_blank\"><img src=\"images/gplus.png\" height=\"\" width=\"140\" alt=\"Encontre Oferta no Google +\"></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"clear\"></div>\r\n");
      out.write("                </article>\r\n");
      out.write("                <div class=\"clear\"> &nbsp; </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>    \r\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function() {\r\n");
      out.write("                $(\"#formcontato\").submit(function() {\r\n");
      out.write("                    var formData = JSON.stringify($(\"#formcontato\").serializeArray());\r\n");
      out.write("                    console.log(formData);\r\n");
      out.write("                    return false;\r\n");
      out.write("                });\r\n");
      out.write("            });           \r\n");
      out.write("            $('#formcontato').submit(function() {\r\n");
      out.write("                var values = {};\r\n");
      out.write("                $.each($('#formcontato').serializeArray(), function(i, field) {\r\n");
      out.write("                    values['\"' + field.name + '\"'] = field.value;\r\n");
      out.write("                });\r\n");
      out.write("                console.log(values);\r\n");
      out.write("                return false;\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
