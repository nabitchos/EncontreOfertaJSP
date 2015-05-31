<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String oferta = request.getParameter("id");
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
        <div id="voucher" title="Voucher gerado com sucesso!">
            <h1></h1>
            <a href="#" target="_blank">Ir até o site do vendedor</a>
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
                    $("#voucher h1").html('P85M5LDA6883MYR');
                    $("#voucher").dialog("option", "width", 500);
                    $("#voucher").dialog("open");
                });
            });

            $.getJSON("json/oferta.json", function(data) {
                $("#breadcrumb").append('<a href="categorias.jsp\?id=' + data.idcat + '">' + data.nomecat + '</a>');
                $("#descProduto h2").html(data.nome);
                $("#textoProduto p").html(data.descricao);
                $(".fotoProduto:first").html('<img src="images/ofertas/' + data.imagem + '" alt="' + data.nome + '">');
                $(".desc_ofertaProd").html(data.oferta);
                $(".fotoProduto:last").html('<img src="images/anunciantes/' + data.vendedor + '.png" alt="' + data.vendedor + '">');
            });
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
