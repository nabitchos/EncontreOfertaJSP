<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String IDoferta = request.getParameter("id");
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
        <div id="fb-root"></div>
        <script>
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.3";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <script src="https://apis.google.com/js/platform.js" async defer>
            {
                lang: 'pt-BR'
            }
        </script>
        <jsp:include page="header.jsp" /> 
        <section id="produto">
            <div class="meio">
                <h1 id="breadcrumb"><a href="#">Categorias</a>  &gt; </h1>
                <div class="colEsq">
                    <div class="fotoProduto"></div>
                    <div class="desc_ofertaProd"></div>
                    <div class="fotoProduto"></div>
                    <a class="linkVoucher" href="#" id="opener">Clique aqui para gerar o Voucher</a>
                </div>
                <div class="descProduto" id="descProduto">
                    <div class="textoProduto" id="textoProduto">
                        <h2><p><img src="images/loading_bar.gif" alt="Carregando..."></p></h2>
                        <p></p>                        
                    </div>
                    <div class="sociasOferta">
                        <strong>Compartilhe</strong>
                        <div class="fb-share-button" data-href="<%=request.getRequestURL() + "?" + request.getQueryString()%>" data-layout="button"></div>&nbsp;&nbsp;
                        <div class="g-plus" data-action="share" data-annotation="none" data-height="24"></div>&nbsp;&nbsp;
                        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="pt" data-size="large" data-count="none">Tweetar</a>&nbsp;&nbsp;
                        <script>!function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                                if (!d.getElementById(id)) {
                                    js = d.createElement(s);
                                    js.id = id;
                                    js.src = p + '://platform.twitter.com/widgets.js';
                                    fjs.parentNode.insertBefore(js, fjs);
                                }
                            }(document, 'script', 'twitter-wjs');</script>                                                
                    </div>
                </div>                
                <div class="clear"> &nbsp; </div>
            </div>
        </section>
        <div id="voucher" title="Gerar o voucher">            
            <h3></h3>
            <form name="formvoucher" id="formvoucher" action="#">
                <strong>Informe seu email para gerar o voucher desta oferta:</strong><br><br>
                <label for="emailvoucher">Email:</label>
                <input type="email" name="email" id="email" required="required">
                <input type="hidden" name="idPromocao" id="idPromocao" value="<%=(IDoferta)%>">
                <input type="submit" name="geravoucher" value="Gerar o voucher">
                <div id="statusvoucher"></div>
            </form>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script>
            $(function() {
                $("#voucher").dialog({
                    autoOpen: false,
                    show: {effect: "puff", duration: 200},
                    hide: {effect: "puff", duration: 200},
                    modal: true,
                    buttons: {
                        Fechar: function() {
                            $(this).dialog("close");
                        }
                    }
                });               
                $("#opener").click(function() {                    
                    //$("#voucher h3").html('P85M5LDA6883MYR');
                    $("#voucher").dialog("option", "width", 500);
                    $("#voucher").dialog("open");                    
                });                
            });
            
            $('#formvoucher').submit(function() {                
                $("#formvoucher #statusvoucher").html('<br><img src="images/loading_bar.gif" alt="Carregando...">');
                var valores = {};
                var JSONpost = "";
                $.each($('#formvoucher').serializeArray(), function(i, field) {
                    valores[field.name] = field.value;
                });                                
                JSONpost = JSON.stringify(valores);
                console.log(JSONpost);

                var urlGeraVoucher = "/api-encontreoferta/api/voucher/gerar/";
                //var urlGeraVoucher = "http://api-encontreoferta.jelasticlw.com.br/api-encontreoferta/voucher/gerar/";                
                $.ajax ({
                    url: urlGeraVoucher,
                    crossDomain: true,
                    type: "POST",
                    data: JSONpost,
                    dataType: "json",                    
                    contentType: "application/json; charset=utf-8",
                    success: function(voucher){                        
                        var htmlVoucher = "<strong>Voucher gerado com sucesso.<br><br>" +
                        "Seu código é:</strong>" +
                                "<h3>"+ voucher.codigo +"</h3>";
                        $("#formvoucher").html(htmlVoucher);                        
                    },
                    error: function(jqXHR){
                        var erroVoucher = '<br><strong>Houve um erro ao gerar o voucher.<br>Tente novamente mais tarde. ('+ jqXHR.status +')</strong>';
                        $("#formvoucher #statusvoucher").html(erroVoucher);                                                
                    }
                });
                
                return false;
            });
            
            var JSONoferta = "http://api-encontreoferta.jelasticlw.com.br/pub/api/promocao/<%=(IDoferta)%>/";
            $.getJSON("json-proxy.jsp?url=" + JSONoferta, function(dadosJSON) {
                $("#breadcrumb").append('<a href="categorias.jsp\?id=' + dadosJSON.categoria.id + '">' + dadosJSON.categoria.nome + '</a>');
                $("#descProduto h2").html(dadosJSON.nome);
                $("#textoProduto p").html(dadosJSON.descricao);
                $(".fotoProduto:first").html('<img src="' + dadosJSON.imagem + '" alt="' + dadosJSON.nome + '">');
                $(".desc_ofertaProd").html(dadosJSON.oferta);
                $(".fotoProduto:last").html('<img src="images/anunciantes/' + dadosJSON.vendedor.id + '.png" alt="' + dadosJSON.vendedor.nome + '">');
            });
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
