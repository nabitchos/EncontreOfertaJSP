<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("nomeadm") == null || session.getAttribute("emailadm") == null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>    
        <meta charset="utf-8">
        <title>Encontre Oferta</title>
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">        
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <section id="categorias">
            <div class="meio">
                <h1><a href="#">Área administrativa</a></h1>
                <article class="formContato">
                    <div class="col50 bordaDir">
                        <img src="../images/eo_logo-boneco-pq.png" alt="Encontre Oferta">
                    </div>
                    <div class="col50">
                        <h2>Bem vindo!</h2>
                        <strong>Utilize o menu acima para navegar pela área<br>
                            administrativa do Encontre Oferta.</strong>
                    </div>                
                    <div class="clear"></div>
                </article>
                <div class="clear"> &nbsp; </div>
            </div>
        </section>    
        <script src="../js/jquery.min.js"></script>
        <script>
            $('#botFormAcesso').click(function() {
                $("#formlogin #statuslogin").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONlogin = "";
                $.each($('#formlogin').serializeArray(), function(i, field) {
                    valores[field.name] = field.value;
                });
                JSONlogin = JSON.stringify(valores);
                console.log("JSONlogin: " + JSONlogin);

                var urlLogin = "http://api-encontreoferta.jelasticlw.com.br/pub/api/usuario/login/";
                $.ajax({
                    url: urlLogin,
                    crossDomain: true,
                    type: "POST",
                    data: JSONlogin,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(login) {
                        if (login) {
                            $("#idUsuario").val(login.id);
                            $("#nome").val(login.nome);
                            $('#formlogin').submit();
                        } else {
                            $("#statuslogin").html('<strong>O e-mail ou a senha que você digitou estão incorretos.</strong>');
                        }
                    },
                    error: function(jqXHR) {
                        var erroVoucher = '<br><strong>Houve um erro ao processar seu acesso.<br>Tente novamente mais tarde. (' + jqXHR.status + ')</strong>';
                        $("#statuslogin").html(erroVoucher);
                    }
                });
            });

        </script>
        <jsp:include page="footer.jsp" />    
    </body>
</html>
