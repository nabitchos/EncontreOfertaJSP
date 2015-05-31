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
            <h1><a href="#">Anuncie aqui</a></h1>
            <article class="formContato">
                <div class="col60 bordaDir">
                    <h2>Acesse sua conta</h2>
                    <form action="#">                        
                        <div>
                            <label for="email">Email: </label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div>
                            <label for="senha">Senha: </label>
                            <input type="password" id="senha" name="senha" required>
                        </div>                        
                        <div>
                            <input type="submit" value="Enviar">
                        </div>
                    </form>
                </div>
                <div class="col40">
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
    <jsp:include page="footer.jsp" />    
</body>
</html>
