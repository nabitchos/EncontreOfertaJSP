<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String idUsuario = request.getParameter("idUsuario");
    String nome = request.getParameter("nome");
    
    if(email!=null && idUsuario!=null && nome!=null){
        session.setAttribute("emailadm", email);        
        session.setAttribute("idUsuarioadm", idUsuario);        
        session.setAttribute("nomeadm", nome);
        response.sendRedirect("principal.jsp");
    }else{
        response.sendRedirect("index.jsp");
    };
%>
