<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String idUsuario = request.getParameter("idUsuario");
    String nome = request.getParameter("nome");
    
    if(email!=null && idUsuario!=null && nome!=null){
        session.setAttribute("email", email);        
        session.setAttribute("idUsuario", idUsuario);        
        session.setAttribute("nome", nome);
        response.sendRedirect("minhaconta.jsp");
    }else{
        response.sendRedirect("acesso.jsp");
    };
%>
