<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>    
        <meta charset="utf-8">
        <title>Encontre Oferta</title>
        <link rel="stylesheet" href="css/estilos.css" type="text/css">
    </head>

    <body>
        <jsp:include page="header.jsp" /> 
        <section id="categorias">
            <div class="meio">
                <h1><a href="#">Contato</a></h1>
                <article class="formContato">
                    <div class="col60  bordaDir">
                        <h2>Preencha o formulário abaixo para entrar em contato conosco</h2>
                        <form action="email.jsp" name="formcontato" id="formcontato" method="post">
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
                                <input type="hidden" name="assunto" value="Form do site Encontre Oferta">
                                <input type="hidden" name="destinatario" value="encontreoferta@encontreoferta.com.br">
                            </div>
                            <div>
                                <input type="button" value="Enviar" id="botformcontato">
                            </div>
                            <div id="statuscadastro"><br>&nbsp;</div>
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
        <script>
            $('#botformcontato').click(function() {
                $("#statuscadastro").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONcontato = "";
                var formInvalido = 0;
                
                JSONcontato = $('#formcontato').serialize();
                $.each($('#formcontato').serializeArray(), function(i, field) {                    
                    if (field.value == ''){
                        formInvalido ++;
                    }
                });
                console.log("Contato " + JSONcontato);
                console.log("Form inválido " + formInvalido);
                var urlLogin = "email.jsp"; 
                
                if(formInvalido == 0){
                    $.ajax ({
                        url: urlLogin,                    
                        type: "POST",
                        data: JSONcontato,                                        
                        success: function(envio){
                            if(envio.statusenvio == 'ok'){
                                $("#statuscadastro").html('<br><strong>' + envio.msg + '<strong>');
                                $("#formcontato")[0].reset();
                            }else{
                                $("#statuscadastro").html('<br><strong>' + envio.msg + '<strong>');
                            }
                        },
                        error: function(jqXHR){
                            var erroVoucher = '<br><strong>Houve problema erro ao enviar sua mensagem. ('+ jqXHR.status +')</strong>';
                            $("#statuscadastro").html(erroVoucher);                            
                        }
                    });
                }else{
                    $("#statuscadastro").html("<br><strong>Por favor preencha todos os campos do formulário.</strong>");   
                }
            });
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
