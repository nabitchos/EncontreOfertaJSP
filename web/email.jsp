<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="java.io.*, java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="org.json.simple.JSONObject"%>
<%
    final String username = "encontreoferta@encontreoferta.com.br";
    final String password = "Senh@123";
    String serverSMTP = "email-ssl.com.br";       
    
    JSONObject result = new JSONObject();  
    
    String assunto = request.getParameter("assunto");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String destinatario = request.getParameter("destinatario");    
    String telefone = request.getParameter("telefone");
    String mensagem = request.getParameter("mensagem");

    String corpoEmail = "<strong>Mensagem de:</strong> " + nome + " - " + email + "<br>";
    if (telefone != null && telefone != "") {
        corpoEmail += "<br><strong>Telefone:</strong> " + telefone + "<br>";
    }
    corpoEmail += "<br>" + mensagem;

    try {
        Properties props = new Properties();
        props.put("mail.smtp.host", serverSMTP);
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session emailSession = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        emailSession.setDebug(true);
        Message message = new MimeMessage(emailSession);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
        message.setSubject(assunto);
        message.setContent(corpoEmail, "text/html");

        Transport transport = emailSession.getTransport("smtps");
        transport.connect(serverSMTP, username, password);
        transport.sendMessage(message, message.getAllRecipients());

        result.put("msg","Mensagem enviada com sucesso.");
        result.put("statusenvio","ok");        
        
    } catch (MessagingException e) {        
        result.put("msg","Houve um problema ao enviar sua mensagem.");
        result.put("statusenvio","erro");
    }
    
    out.print(result);
%>