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

                $.getJSON("json/banner.json", function(data) {
                    var banners = "";

                    /* loop pelo array do json*/
                    $.each(data, function(index, d) {
                        banners += '<h3 class="title">' + (index + 1) + '</h3>' +
                                '<div><a href="oferta.jsp\?id=' + d.id + '">' +
                                '<div class="col50"><h1>' + d.nome + '</h1><h2>' + d.oferta + '</h2></div>' +
                                '<div class="col50"><img src="images/ofertas/' + d.imagem + '" alt="'+ d.nome + '"></div>' +
                                '</a></div>';
                    });

                    $('#main-slider').html(banners);
                    $('#main-slider').liquidSlider();
                });

                $.getJSON("json/ofertashome.json", function(data) {
                    var ofertasHome = "<h1>OFERTAS EM DESTAQUE</h1>";

                    /* loop pelo array do json*/
                    $.each(data, function(index, d) {
                        ofertasHome += '<article class="destaque">' +
                                '<img src="images/ofertas/' + d.imagem + '" height="175" width="290" alt="'+ d.nome + '">' +
                                '<h1>' + d.nome + '</h1>' +
                                '<span class="desc_oferta">' + d.oferta + '</span>' +
                                '<a class="veja_mais" href="oferta.jsp\?id=' + d.id + '">Veja mais</a>' +
                                '</article>';
                    });
                    $("#ofertasHome").html(ofertasHome);
                });
            });
        </script>
        <jsp:include page="footer.jsp" />   
    </body>
</html>
