<%
    session.removeAttribute("nome");
    session.removeAttribute("email");
    session.removeAttribute("idUsuario");
    
    response.sendRedirect("index.jsp");
%>