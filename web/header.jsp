<header>
    <div class="meio">
        <div class="col50">
            <h1><a href="index.jsp">Encontre Oferta</a> </h1>
            <!--DIV id="dimensions">aaaaa</DIV-->
        </div>
        <div class="col50">
            <div class="col50">
                <div id="linkminhaconta"><%if(session.getAttribute("nome") != null){%>
                    Olá, <%=session.getAttribute("nome")%>!<br>
                    <a href="minhaconta.jsp">Acesse sua conta</a>
                    <%};%>
                </div>
            </div>
            <div class="col50">
                <form name="formpesquisa" method="get" id="formpesquisa" action="busca.jsp">
                    <input type="text" name="s" id="pesquisa" required="required">
                    <input type="submit" name="pesquisar" value="Pesquisar" id="pesquisar">
                </form>
            </div>
        </div>
    </div>
    <div class="navbar">
        <div class="meio">
            <nav>
                <ul>
                    <li> <a href="/">Início</a></li>                        
                    <li> <a href="#" id="linkCategorias">Categorias</a> </li>
                    <%if(session.getAttribute("nome") != null){%>
                    <li><a href="minhaconta.jsp">Sua conta</a> </li>                   
                    <%}else{%>
                    <li> <a href="acesso.jsp">Acesso | Cadastro</a> </li>
                    <%};%>
                    <li> <a href="quem_somos.jsp">Quem Somos</a> </li>
                    <li> <a href="contato.jsp">Contato</a> </li>
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