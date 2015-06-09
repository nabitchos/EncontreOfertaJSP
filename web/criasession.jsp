<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String idUsuário = request.getParameter("idUsuario");
    String nome = request.getParameter("nome");
    
    if (session.getAttribute("email") == null) {
        session.setAttribute("email", email);        
    }
    if (session.getAttribute("idUsuario") == null) {
        session.setAttribute("idUsuario", idUsuário);        
    }
    if (session.getAttribute("nome") == null) {
        session.setAttribute("nome", nome);        
    }
    
    if (session.getAttribute("idUsuario") != null && session.getAttribute("email") != null){
       //out.print(session.getAttribute("idUsuario") +"<br>"+ session.getAttribute("email"));
        response.sendRedirect("minhaconta.jsp");
    };
%>
