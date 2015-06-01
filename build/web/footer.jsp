<script>
    jQuery(document).ready(function() {
        $("#menuCategorias").hide();
        $("#linkCategorias").click(function() {
            $("#linkCategorias").toggleClass("abaLaranja");//muda a classe do link categorias
            $("#menuCategorias").slideToggle(200);//mostra e oculta ativa e desativa o menu
        });
        var URLJson = "http://api-encontreoferta.jelasticlw.com.br/pub/api/categoria";
        $.getJSON("json-proxy.jsp?url=" + URLJson, function(data) {
            var menuCats = "";

            /* loop pelo array do json*/
            $.each(data, function(index, d) {
                menuCats += '<div class="categoria">' +
                            '<a href="categoria.jsp\?id=' + d.id + '" title="'+ d.descricao +'">' +
                            '<span class="iconeCategoria iconeCat' + d.id + '"></span>' + d.nome +
                            '</a></div>';
            });            
            $("#menuCategorias").children().html(menuCats);
        });
    });
</script>
<footer>
    <div class="meio">
        <ul>
            <li>© 2015 Encontre Oferta</li>
            <li><br><strong>Este site é um projeto acadêmico. Todas as informações nele contidas são fictícias.</h4></strong>
        </ul>
    </div>
</footer>