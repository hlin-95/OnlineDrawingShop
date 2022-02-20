<nav id="mainNavbar" class="navbar navbar-dark navbar-expand-sm py-0 fixed-top">
    <a href="/onlineDrawingShop/admin/home" class="navbar-brand">LIN's</a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navLinks">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/onlineDrawingShop/admin/home" class="nav-link" id="home">HOME</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    MANAGE PRODUCTS
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <c:url value="/admin/getProducts" var="productUrl"></c:url>
                    <a class="dropdown-item" id="allThemes" href="/onlineDrawingShop/admin/shopAll">All themes</a>
                    <a class="dropdown-item" href="${productUrl}/Canal">Canal</a>
                    <a class="dropdown-item" href="${productUrl}/Time">Time</a>
                    <a class="dropdown-item" href="${productUrl}/Pushing-Garden">Pushing Garden</a>
                    <a class="dropdown-item" href="${productUrl}/Physical-Model">Physical Model</a>

                    <a class="dropdown-item" href="${productUrl}/Garden">Garden</a>
                    <a class="dropdown-item" href="${productUrl}/Pinkish-World">Pinkish World</a>
                    <a class="dropdown-item" href="${productUrl}/Reservoir">Reservoir</a>
                    <a class="dropdown-item" href="${productUrl}/Hand-Drawing">Hand Drawing</a>

                    <a class="dropdown-item" href="${productUrl}/Moment">Moment</a>
                    <a class="dropdown-item" href="${productUrl}/Boat">Boat</a>
                    <a class="dropdown-item" href="${productUrl}/Childhood">Childhood</a>
                    <a class="dropdown-item" href="${productUrl}/Daily-Life">Daily Life</a>
                </div>
            </li>
            <li class="nav-item">
                <a href="/onlineDrawingShop/admin/contact" class="nav-link" id="contact">CONTACT</a>
            </li>
        </ul>

        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/onlineDrawingShop/admin/profile" class="nav-link" id="account">
                    <img src='<c:url value="/resources/icon/account.webp"/>'/>ADMIN
                    </a>
            </li>
            <li class="nav-item">
                <form action="/onlineDrawingShop/logout" method="post" class="nav-link" id="logout">
                    <img src='<c:url value="/resources/icon/logout.webp"/>'/><button type="submit">LOG OUT</button>
                </form>
            </li>
        </ul>
    </div>
</nav>

<style>
    /* here is the navbar */
    #mainNavbar {
        background-color: rgb(222, 177, 222);
    }

    #mainNavbar .navbar-brand {
        color: rgb(227, 28, 131);
        font-family: 'Montserrat Alternates', sans-serif;
        font-weight: 600;
    }

    #navLinks .nav-link {
        opacity: 0.8;
    }

    #navLinks .nav-link, button{
        color: white;
        font-family: 'Nunito Sans', sans-serif;
        font-weight: 300;
        font-size: 1em;
        border: none;
        background-color: rgb(222, 177, 222);
    }

    button {
        padding: 0px;
    }

    #navLinks #currentPage {
        font-weight: 900;
        opacity: 1;
    }

    #navLinks .nav-link:hover {
        color: rgb(201, 30, 119);
        text-decoration: underline;
        opacity: 1;
    }

    button:hover {
        color: rgb(201, 30, 119);
        text-decoration: underline;
        opacity: 1;
        cursor: pointer;
        border: none;
    }

    button:focus {
        outline: 0;
    }

    #navLinks .nav-link img {
        width: 1.5em;
        height: auto;
    }

    .dropdown-item {
        color: rgb(152, 152, 152);
        font-family: 'Nunito Sans', sans-serif;
        font-size: 0.8em;
        border-bottom: 0.5px dashed rgb(211, 211, 211);
        padding-left: 1.5em;
        padding-top: 1.1em;
    }

    .dropdown-item:focus {
        background-color: rgb(228, 228, 228);
    }

    #allThemes {
        height: 4em;
        border-bottom: 3px double rgb(211, 211, 211);
        display: flex;
        flex-direction: row;
        justify-content: left;
        align-items: flex-end;
        padding-bottom: 0.5em;
    }

    .collapse {
        margin: 0 auto;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    @media(max-width: 768px) {

        /* here is the navbar */
        #navLinks .nav-link {
            font-size: 0.8em;
        }

        .dropdown-item {
            font-size: 0.65em;
            padding-left: 1.5em;
            padding-top: 1em;
        }
    }


    @media(max-width: 576px) {

        /* here is the navbar */
        .nav-link img {
            display: none;
        }

        .collapse {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .dropdown-menu {
            background-color: rgb(242, 219, 242);
        }
    }
</style>