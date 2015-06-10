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
                <div class="col50">
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
                            <input type="button" value="Enviar" id="botFormAcesso">
                            <input type="hidden" id="idUsuario" name="idUsuario">
                            <input type="hidden" id="nome" name="nome">
                        </div>
                        <div id="statuslogin"></div>
                    </form>
                </div>
                <div class="col50 bordaEsq">
                    <h2>Cadastre-se</h2>
                    <form name="formcadastro" id="formcadastro" action="criasession.jsp" method="post">
                        <div>
                            <label for="nome">Nome: </label>
                            <input type="text" id="nome" name="nome" required>
                        </div>
                        <div>
                            <label for="telefone">Telefone: </label>
                            <input type="tel" id="telefone" name="telefone" required>
                        </div>
                        <div>
                            <label for="email">Email: </label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div>
                            <label for="endereco">Endereço: </label>
                            <input type="text" id="endereco" name="endereco" required>
                        </div>
                        <div>
                            <label for="senha">Senha: </label>
                            <input type="text" id="senha" name="senha" required>
                        </div>
                        <div>
                            <input type="button" value="Enviar" id="botFormCadastro">                            
                        </div>
                        <div id="statuscadastro"></div>
                    </form>
                </div>                
                <div class="clear"></div>
            </article>
            <div class="clear"> &nbsp; </div>
        </div>
    </section>    
    <script src="js/jquery.min.js"></script>
    <script>
            $('#botFormCadastro').click(function() {
                $("#formcadastro #statuscadastro").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONcadastro = "";
                var formInvalido = 0;                
                $.each($('#formcadastro').serializeArray(), function(i, field) {
                    valores[field.name] = field.value;
                    if (field.value == ''){
                        formInvalido ++;
                    }
                });                                
                JSONcadastro = JSON.stringify(valores);
                console.log("JSONcadastro: " + JSONcadastro);
                console.log("Form inválido? " + formInvalido);
                var urlCadastro = "/api-encontreoferta/api/usuario/";
                if(formInvalido == 0){                    
                    $.ajax ({
                        url: urlCadastro,
                        crossDomain: true,
                        type: "POST",
                        data: JSONcadastro,
                        dataType: "json",                    
                        contentType: "application/json; charset=utf-8",
                        success: function(cadastro){                        
                            if (cadastro){
                                $("#statuscadastro").html('<strong>'+ cadastro.cause +'<br>'+ cadastro.message +'</strong>');
                                $("#formcadastro")[0].reset()
                            }else{
                                $("#statuscadastro").html('<strong>Erro!.</strong>');
                            }
                        },
                        error: function(jqXHR){
                            var erroCadastro = '<br><strong>Houve um erro ao processar seu cadastro.<br>Tente novamente mais tarde. ('+ jqXHR.status +')</strong>';
                            $("#statuslogin").html(erroCadastro);                                                
                        }
                    });
            }
            });
            $('#botFormAcesso').click(function() {
                $("#formlogin #statuslogin").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONlogin = "";
                $.each($('#formlogin').serializeArray(), function(i, field) {
                    valores[field.name] = field.value;
                });                                
                JSONlogin = JSON.stringify(valores);
                console.log("JSONlogin: " + JSONlogin);
                
                var urlLogin = "/api-encontreoferta/api/usuario/login/";                
                $.ajax ({
                    url: urlLogin,
                    crossDomain: true,
                    type: "POST",
                    data: JSONlogin,
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
                        $("#statuslogin").html(erroVoucher);                                                
                    }
                });                
            });
    </script>
    <jsp:include page="footer.jsp" />    
</body>
</html>
