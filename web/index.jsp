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
    </head>

    <body>
        <jsp:include page="header.jsp" />    
        <section id="banner_destaque">
            <div class="meio">
                <div id="main-slider" class="liquid-slider">
                    <div>                            
                        <div><h1><img src="images/loading_bar.gif" alt="Carregando..."></h1></div>
                    </div>
                </div>
            </div>
        </section>
        <section id="ofertas_destaque">
            <div class="meio" id="ofertasHome">
                <div><br><br><br><br><br><img src="images/loading_bar.gif" alt="Carregando..."></div>
            </div>
            <div class="clear"> &nbsp; </div>
        </section>
        <script src="js/jquery.min.js"></script>        
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/jquery.touchSwipe.min.js"></script>
        <script src="js/jquery.liquid-slider.min.js"></script>        
        <script>
            $(document).ready(function() {
                /* definindo que não haverá cache */
                $.ajaxSetup({cache: false});
                var JSONbanner = "http://api-encontreoferta.jelasticlw.com.br/pub/api/promocao/nivel/1";
                $.getJSON("json-proxy.jsp?url=" + JSONbanner, function(dadosJSON) {
                    var banners = "";

                    /* loop pelo array do json*/
                    $.each(dadosJSON, function(i, banner) {
                        banners += '<h3 class="title">' + (i + 1) + '</h3>' +
                                '<div><a href="oferta.jsp\?id=' + banner.id + '" title="' + banner.descricao + ' ' + banner.oferta + '">' +
                                '<div class="col50"><h1>' + banner.nome + '</h1><h2>' + banner.oferta + '</h2></div>' +
                                '<div class="col50"><img src="' + banner.imagem + '" alt="'+ banner.descricao + ' ' + banner.oferta +'"></div>' +
                                '</a></div>';
                    });

                    $('#main-slider').html(banners);
                    $('#main-slider').liquidSlider();
                });
                
                var JSONdestaques = "http://api-encontreoferta.jelasticlw.com.br/pub/api/promocao/nivel/2";
                $.getJSON("json-proxy.jsp?url=" + JSONdestaques, function(destaques) {
                    var ofertasHome = "<h1>OFERTAS EM DESTAQUE</h1>";

                    /* loop pelo array do json*/
                    $.each(destaques, function(i, destaque) {
                        ofertasHome += '<article class="destaque">' +
                                '<img src="' + destaque.imagem + '" height="175" width="290" alt="'+ destaque.nome + '">' +
                                '<h1>' + destaque.nome + '</h1>' +
                                '<span class="desc_oferta">' + destaque.oferta + '</span>' +
                                '<a class="veja_mais" href="oferta.jsp\?id=' + destaque.id + '">Veja mais</a>' +
                                '</article>';
                    });
                    $("#ofertasHome").html(ofertasHome);
                });
            });
        </script>
        <jsp:include page="footer.jsp" />   
    </body>
</html>
