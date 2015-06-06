<%
/*  JSON proxy. Para ler o JSON de dommínios que exigem "CORS 'Access-Control-Allow-Origin'"
    e não suportam JSONP ou callbacks.
    Adaptado de https://www.codemagi.com/blog/post/190   */
%>
<%@ page import="java.io.*, java.net.*"%>
<%@ page contentType="charset=utf-8" pageEncoding="utf-8" %>
<%/* contentType definido para tratar encoding do JSON da API */%>
<%    
    String urlJSON = request.getParameter("url");

    StringBuffer sbf = new StringBuffer();    
    try {
        URL url = new URL(urlJSON);
        BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            sbf.append(inputLine);
        }
        in.close();
    } catch (MalformedURLException e) {
    } catch (IOException e) {
    }
%>
<%= sbf.toString()%>