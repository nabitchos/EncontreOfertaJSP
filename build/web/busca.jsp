<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String StrBusca = request.getParameter("s");
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
            var JSONcat = "http://api-encontreoferta.jelasticlw.com.br/pub/api/promocao/";
            $.getJSON("json-proxy.jsp?url=" + JSONcat, function(dadosJSON) {
                var ofertas = '<h1>Resultado da busca por: <%=(StrBusca)%></h1>';
                /* loop pelo array do json*/
                $.each(dadosJSON, function(i, prod) {                   
                    if (prod.nome.match(/<%=(StrBusca)%>/i)) {                    
                        ofertas += '<article class="produtoCategoria"><div class="fotoProduto">' +
                                '<img src="' + prod.imagem + '" alt="' + prod.nome + '"></div>' +
                                '<div class="descProdutoCat"><div class="esquerdaProd"><h2>' + prod.nome + '</h2><div class="desc_oferta">' + prod.oferta + '</div></div>' +
                                '<div class="linksProd"><img src="images/anunciantes/' + dadosJSON[i].vendedor.id + '.png"  alt="' + dadosJSON[i].vendedor.nome  + '">' +
                                '<span class="veja_mais"><a href="oferta.jsp\?id=' + prod.id + '">Veja mais</a></span>' +
                                '</div></div><div class="clear"></div></article>';
                    }else{
                        
                    }
                });
                $("#categorias .meio").html(ofertas);
            });

        </script>
        <jsp:include page="footer.jsp" />
    </body>

</html>
