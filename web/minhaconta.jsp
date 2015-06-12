<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("nome") == null || session.getAttribute("email") == null || session.getAttribute("idUsuario") == null) {
        response.sendRedirect("acesso.jsp");
    };
%>
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
                <h1>Minha conta</h1>
                <article class="formContato">                    
                    <div class="col25">
                        <div>
                            <h2>Menu</h2>
                            <ul>
                                <li><a href="#" id="vouchers"><strong>Meus vouchers</strong></a></li>
                                <li><a href="#" id="dados"><strong>Meus dados</strong></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col75 bordaEsq" id="direita">                        
                        <div id="formDados">
                            <h2>Meus dados</h2>
                            <form name="formatualiza" id="formatualiza" action="criasession.jsp" method="post">
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
                                    <input type="hidden" value="" id="id" name="id">
                                </div>
                                <div>
                                    <input type="button" value="Enviar" id="botFormCadastro">
                                    
                                </div>
                                <div id="statuscadastro"></div>
                            </form>
                        </div>
                        <div id="listaVouchers"></div>
                    </div>
                    <div class="clear"> &nbsp; </div>
                </article>
            </div>
        </section>    
        <script src="js/jquery.min.js"></script>
        <script>
            $(function(){
                $("#formDados").hide();
            });
            var JSONuser = "http://api-encontreoferta.jelasticlw.com.br/pub/api/usuario/<%=(session.getAttribute("idUsuario"))%>";
            $('#dados').click(function() {
                $("#formDados").slideDown();
                $("#listaVouchers").slideUp();
                $("#statuscadastro").html('<br><div align="center"><img src="images/loading_bar.gif" alt="Carregando..."></div>');                
                $.getJSON(JSONuser, function(dadosJSON) {
                        var dados = '';                                        
                        $("#nome").val(dadosJSON.nome);
                        $("#email").val(dadosJSON.email);
                        $("#telefone").val(dadosJSON.telefone);
                        $("#endereco").val(dadosJSON.endereco);
                        $("#senha").val(dadosJSON.senha);
                        $("#id").val(dadosJSON.id);
                        $("#statuscadastro").html('');
                }).fail(function(jqXHR) {                    
                    $("#statuscadastro").html('Erro ao carregar os dados.<br>Por favor tente novamente.('+jqXHR.status+')');
                });                
            });
            var JSONvouchers = "http://api-encontreoferta.jelasticlw.com.br/pub/api/voucher/usuario/<%=(session.getAttribute("idUsuario"))%>";
            $('#vouchers').click(function() {
                $("#formDados").slideUp();
                $("#listaVouchers").slideDown();
                $("#listaVouchers").html('<br><div align="center"><img src="images/loading_bar.gif" alt="Carregando..."></div>');
                $.getJSON(JSONvouchers, function(dadosJSON) {
                    var vouchers = '<h2>Meus vouchers</h2>';
                    if(!$.isEmptyObject(dadosJSON)){
                    $.each(dadosJSON, function(i, voucher) {
                        vouchers += '<article class="produtoCategoria"><div class="fotoProduto">' +
                                '<img src="' + voucher.promocao.imagem + '" alt="Encontre Oferta"></div>' +
                                '<div class="descProdutoVoucher"><h2>' + voucher.promocao.nome + '</h2>' +
                                '<div class="desc_oferta"><strong>&nbsp;&nbsp;Código do voucher: </strong>' + voucher.codigo + '</div>'+
                                '<div class="col50"><a href="oferta.jsp?id='+ voucher.promocao.id +'" class="veja_mais">Veja a oferta</a></div>'+
                                '<div class="col50"><img src="images/anunciantes/'+voucher.promocao.vendedor.id+'.png"></div>'+
                                '</div><div class="clear"></div></article>';
                    });
                    }else{
                        vouchers +='<h2>Você ainda não gerou nenhum voucher.</h2>';
                    }
                    vouchers += '<div class="clear"> &nbsp; </div>';
                    $("#listaVouchers").html(vouchers);
                });
            });
            $('#botFormCadastro').click(function() {
                $("#statuscadastro").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONcadastro = "";
                var formInvalido = 0;                
                $.each($('#formatualiza').serializeArray(), function(i, field) {
                    valores[field.name] = field.value;
                    if (field.value == ''){
                        formInvalido ++;
                    }
                });                                
                JSONcadastro = JSON.stringify(valores);
                console.log("JSONcadastro: " + JSONcadastro);
                console.log("Form inválido? " + formInvalido);
                var urlCadastro = "http://api-encontreoferta.jelasticlw.com.br/pub/api/usuario/<%=(session.getAttribute("idUsuario"))%>";
                if(formInvalido == 0){                    
                    $.ajax ({
                        url: urlCadastro,
                        crossDomain: true,
                        type: "PUT",
                        data: JSONcadastro,
                        dataType: "json",                    
                        contentType: "application/json; charset=utf-8",
                        success: function(){                           
                                $("#statuscadastro").html('<strong>Cadastro atualizado com sucesso.</strong>');
                        },
                        error: function(jqXHR){
                            var erroCadastro = '<br><strong>Houve um erro ao processar seu cadastro.<br>Tente novamente mais tarde. ('+ jqXHR.status +')</strong>';
                            $("#statuscadastro").html(erroCadastro);                                                
                        }
                    });
                }else{
                    $("#statuscadastro").html("<stPor favor preencha todos os campos.");
                }
            });
        </script>
        <jsp:include page="footer.jsp" />    
    </body>
</html>
