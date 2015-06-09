<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("nome") == null){
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
            <br><br><br>
                <div><img src="images/loading_bar.gif" alt="Carregando"></div>
                <br><br><br>            
            <div class="clear"> &nbsp; </div>
        </div>
    </section>    
    <script src="js/jquery.min.js"></script>
        <script>
            var JSONcat = "http://api-encontreoferta.jelasticlw.com.br/pub/api/voucher/usuario/<%=(session.getAttribute("idUsuario"))%>";
            $.getJSON("json-proxy.jsp?url=" + JSONcat, function(dadosJSON) {
                var vouchers = '<h1>Meus vouchers</h1>';                
                $.each(dadosJSON, function(i, voucher) {                    
                        vouchers += '<article class="produtoCategoria"><div class="fotoProduto">' +
                            '<img src="'+ voucher.promocao.imagem +'" alt="Encontre Oferta"></div>' +
                            '<div class="descProdutoCat"><h2>'+ voucher.promocao.nome +'</h2>' +
                            '<div class="desc_oferta"><br><br><strong>Código do voucher: </strong>'+ voucher.codigo +'</div></div>' +
                            '<div class="clear"></div></article>';                    
                });                
                $("#categorias .meio").html(vouchers);
            });
        </script>
    <jsp:include page="footer.jsp" />    
</body>
</html>
