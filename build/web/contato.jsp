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
                <h1><a href="#">Contato</a></h1>
                <article class="formContato">
                    <div class="col60  bordaDir">
                        <h2>Preencha o formulário abaixo para entrar em contato conosco</h2>
                        <form action="#" name="formcontato" id="formcontato">
                            <div>
                                <label for="nome">Nome: </label>
                                <input type="text" id="nome" name="nome" required>
                            </div>
                            <div>
                                <label for="email">Email: </label>
                                <input type="email" id="email" name="email" required>
                            </div>
                            <div>
                                <label for="telefone">Telefone: </label>
                                <input type="tel" id="telefone" name="telefone" required>
                            </div>
                            <div>
                                <label for="mensagem">Mensagem: </label>
                                <textarea name="mensagem" id="mensagem" cols="30" rows="5" required></textarea>
                            </div>
                            <div>
                                <input type="submit" value="Enviar">
                            </div>
                        </form>
                    </div>
                    <div class="col40">
                        <h2>Interaja conosco nas redes sociais</h2>
                        <div>
                            <a href="https://www.facebook.com/siteencontreoferta" target="_blank"><img src="images/facebook.png" height="" width="140" alt="Encontre Oferta no Facebook"></a>
                        </div>
                        <div>
                            <a href="http://twitter.com/encontreoferta" target="_blank"><img src="images/Twitter_logo_blue.png" height="" width="140" alt="Encontre Oferta no Twitter"></a>
                        </div>
                        <div>
                            <a href="https://plus.google.com/+EncontreofertaBrasil/" target="_blank"><img src="images/gplus.png" height="" width="140" alt="Encontre Oferta no Google +"></a>
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
