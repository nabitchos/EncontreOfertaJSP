<header id="headeradm">
    <div class="meio">
        <div class="col50">
            <h1 class="h1adm"><a href="index.jsp">Encontre Oferta</a> </h1>            
        </div>
        <div class="col50">

        </div>
    </div>
    <div class="navbar bg555">
        <div class="meio">
            <nav>
                <ul>
                    <%if(session.getAttribute("nomeadm") != null && session.getAttribute("emailadm") != null){%>
                    <li> <a href="vendedores.jsp">Vendedores</a></li>
                    <li> <a href="categorias.jsp">Categorias</a></li>
                    <li> <a href="niveis.jsp">Níveis</a></li>
                    <li> <a href="promocoes.jsp">Promoções</a></li>
                    <li> <a href="usuarios.jsp">Usuários</a></li>
                    <li> <a href="vouchers.jsp">Vouchers</a></li>
                    <%};%>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="menuCategorias" id="menuCategorias">
    <div class="meio">
        <div><img src="images/loading_bar.gif" alt="Carregando..."></div>
    </div>
</div>