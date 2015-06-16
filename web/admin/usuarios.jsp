<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("nomeadm") == null || session.getAttribute("emailadm") == null) {
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
                <h1>Usuários (Clientes)</h1>
                <article class="formContato">                    
                    <div class="col25">
                        <div>
                            <h2>Menu</h2>
                            <ul>
                                <li><a href="#" id="vouchers"><strong>Listar usuários</strong></a></li>
                                <!--li><a href="#" id="novovend"><strong>Incluir novo</strong></a></li-->
                            </ul>
                        </div>
                    </div>
                    <div class="col75 bordaEsq" id="direita">                        
                        <div id="formDados">
                            <h2>Incluir usuário</h2>
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
                        <div id="listaVouchers-pagination">
                            <a id="listaVouchers-previous" href="#">&laquo; Anterior</a> 
                            <a id="listaVouchers-next" href="#">Próxima &raquo;</a> 
                        </div>
                    </div>
                    <div class="clear"> &nbsp; </div>
                </article>
            </div>
        </section>    
        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery.paginate.js"></script>
        <script>
            $(function(){
                $("#formDados").hide();
            });

            $('#novovend').click(function() {
                $("#formDados").slideDown();
                $("#listaVouchers").slideUp();
            });

            var JSONvendedores = "http://api-encontreoferta.jelasticlw.com.br/pub/api/usuario/";
            $('#vouchers').click(function() {
                $("#formDados").slideUp();
                $("#listaVouchers").html('<br><div align="center"><img src="../images/loading_bar.gif" alt="Carregando..."></div>');
                $.getJSON(JSONvendedores, function(dadosJSON) {
                var vouchers = '<h2>Uauários</h2>' ;
                    if (!$.isEmptyObject(dadosJSON)){
                        $.each(dadosJSON, function(i, usuario) {
                            var preCad = "";
                            if (!usuario.nome) {
                                preCad = "Sim";
                            } else {
                                preCad = "Não";
                            }
                        vouchers += '<article class="vendedorLista">'+
                                    '<div class="col50"><strong>Código: </strong>'+ usuario.id +
                                    '<br><strong>Nome: </strong>'+ usuario.nome +
                                    '<br><strong> Email: </strong>'+ usuario.email +'</div>'+                                    
                                    '<div class="col50"><strong> Telefone: </strong>'+ usuario.telefone +
                                    '<br><strong> Endereço: </strong>'+ usuario.endereco +
                                    '<br><strong> Pré cadastro: </strong>'+ preCad +
                                    '</div><div class="clear"></div><br></article>';
                        });
                    }else{
                        vouchers += '<h2>Não há usuários cadastrados.</h2>';
                    }
                    vouchers += '<div class="clear"> &nbsp; </div>';
                    $("#listaVouchers").html(vouchers);
                    $("#listaVouchers").slideDown();
                    $('#listaVouchers').paginate({itemsPerPage: 9});
                });
            });

            $('#botFormCadastro').click(function() {
                $("#statuscadastro").html('<br><img src="../images/loading_bar.gif" alt="Carregando...">');
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
