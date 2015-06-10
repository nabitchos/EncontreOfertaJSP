<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>    
    <meta charset="utf-8">
    <title>Encontre Oferta</title>
    <link rel="stylesheet" href="css/estilos.css" type="text/css">
    <!-- Banner -->
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/liquid-slider.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">
</head>

<body>
    <jsp:include page="header.jsp" /> 
    <section id="categorias">
        <div class="meio">
            <h1><a href="#">Acesse sua conta</a></h1>
            <article class="formContato">
                <div class="col50 bordaDir">
                    <h2>Acesse sua conta</h2>
                    <form name="formlogin" id="formlogin" action="criasession.jsp" method="post">                        
                        <div>
                            <label for="email">Email: </label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div>
                            <label for="senha">Senha: </label>
                            <input type="text" id="senha" name="senha" required>
                        </div>
                        <div>
                            <input type="button" value="Enviar" id="botform">
                            <input type="hidden" id="idUsuario" name="idUsuario">
                            <input type="hidden" id="nome" name="nome">
                        </div>
                        <div id="statuslogin"></div>
                    </form>
                </div>
                <div class="col50">
                    <h2>Cadastre-se</h2>
                    <div>
                        <input type="button" value="Preencha seus dados">
                    </div>                    
                </div>
                <div class="clear"></div>
            </article>
            <div class="clear"> &nbsp; </div>
        </div>
    </section>    
    <script src="js/jquery.min.js"></script>
    <script>
            $('#botform').click(function() {                
                $("#formlogin #statuslogin").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONpost = "";
                $.each($('#formlogin').serializeArray(), function(i, field) {
                    valores[field.name] = field.value;
                });                                
                JSONpost = JSON.stringify(valores);
                console.log(JSONpost);
                
                var urlLogin = "/api-encontreoferta/api/usuario/login/";
                //var urlGeraVoucher = "http://api-encontreoferta.jelasticlw.com.br/api-encontreoferta/voucher/gerar/";                
                $.ajax ({
                    url: urlLogin,
                    crossDomain: true,
                    type: "POST",
                    data: JSONpost,
                    dataType: "json",                    
                    contentType: "application/json; charset=utf-8",
                    success: function(login){                        
                        if (login){                            
                            $("#idUsuario").val(login.id);
                            $("#nome").val(login.nome);
                            $('#formlogin').submit();                            
                        }else{
                            $("#statuslogin").html('<strong>O e-mail ou a senha que você digitou estão incorretos.</strong>');
                        }
                    },
                    error: function(jqXHR){
                        var erroVoucher = '<br><strong>Houve um erro ao processar seu acesso.<br>Tente novamente mais tarde. ('+ jqXHR.status +')</strong>';
                        $("#formvoucher #statusvoucher").html(erroVoucher);                                                
                    }
                });                
            });
    </script>
    <jsp:include page="footer.jsp" />    
</body>
</html>
