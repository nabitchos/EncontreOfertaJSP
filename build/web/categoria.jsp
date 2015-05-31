<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String categoria = request.getParameter("id");
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
                <br><br><br>
                <div><img src="images/loading_bar.gif" alt="Carregando"></div>
                <br><br><br>
            </div>
        </section>        
        <script src="js/jquery.min.js"></script>
        <script>
            $.getJSON("json/categoria.json", function(data) {
                var ofertas = '<h1><a href="#">Categorias</a> \&gt; <a href="#">'+ data.categoria +'</a></h1>';
                /* loop pelo array do json*/
                $.each(data.ofertas, function(index, d) {
                    ofertas += '<article class="produtoCategoria"><div class="fotoProduto">'+
                               '<img src="images/ofertas/'+ d.imagem +'" height="175" width="290" alt="'+ d.nome + '"></div>'+
                               '<div class="descProdutoCat"><div class="esquerdaProd"><h2>'+ d.nome +'</h2><div class="desc_oferta">'+ d.oferta +'</div></div>'+
                               '<div class="linksProd"><img src="images/anunciantes/'+ data.id +'.png" height="" width="290" alt="'+ data.id +'">'+
                               '<span class="veja_mais"><a href="oferta.jsp\?id='+ d.id +'">Veja mais</a></span>'+
                               '</div></div><div class="clear"></div></article>';
                    $("#categorias .meio").html(ofertas);
                });
            });

        </script>
        <jsp:include page="footer.jsp" />
    </body>

</html>
