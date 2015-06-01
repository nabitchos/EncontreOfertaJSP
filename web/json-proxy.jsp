<%@ page import="java.io.*, java.net.*" %>
<%@ page contentType="application/json" pageEncoding="utf-8" %>
<%
    String urlJSON = request.getParameter("url");

    StringBuffer sbf = new StringBuffer();
    //Access the page
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