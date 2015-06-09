<script>
    jQuery(document).ready(function() {        
        $("#menuCategorias").hide();
        $("#linkCategorias").click(function() {
            $("#linkCategorias").toggleClass("abaLaranja");//muda a classe do link categorias
            $("#menuCategorias").slideToggle(200);//mostra e oculta ativa e desativa o menu
        });
        var JSONCats = "http://api-encontreoferta.jelasticlw.com.br/pub/api/categoria";
        $.getJSON("json-proxy.jsp?url=" + JSONCats, function(dadosJSON) {
            var menuCats = "";

            $.each(dadosJSON, function(i, cat) {
                menuCats += '<div class="categoria">' +
                            '<a href="categoria.jsp\?id=' + cat.id + '" title="'+ cat.descricao +'">' +
                            '<span class="iconeCategoria iconeCat' + cat.id + '"></span>' + cat.nome +
                            '</a></div>';
            });            
            $("#menuCategorias").children().html(menuCats);
        });
    });
</script>
<footer>
    <div class="meio">
        <ul>
            <li>© 2015 Encontre Oferta </li>
            <li><br><strong>Este site é um projeto acadêmico. Todas as informações nele contidas são fictícias.</strong>
        </ul>
    </div>
</footer>