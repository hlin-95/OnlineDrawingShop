<nav id="mainNavbar" class="navbar navbar-dark navbar-expand-sm py-0 fixed-top">
    <a href="/onlineDrawingShop/home" class="navbar-brand">LIN's</a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navLinks">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/onlineDrawingShop/home" class="nav-link" id="home">HOME</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span id="shop">SHOP</span>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <c:url value="/guest/getProducts" var="productUrl"></c:url>
                    <a class="dropdown-item" id="allThemes" href="/onlineDrawingShop/shopAll">All themes</a>
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
                <a href="/onlineDrawingShop/contact" class="nav-link" id="contact">CONTACT</a>
            </li>
        </ul>

        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/onlineDrawingShop/registration" class="nav-link" id="signup">
                    <img src='<c:url value="/resources/icon/account.webp"/>'/>SIGN UP
                </a>
            </li>
            <li class="nav-item">
                <a href="/onlineDrawingShop/login" class="nav-link" id="login">
                    <img src='<c:url value="/resources/icon/login.webp"/>'/>LOG IN
                </a>
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
        color: white;
        font-family: 'Nunito Sans', sans-serif;
        font-weight: 300;
        font-size: 1em;
        opacity: 0.8;
    }

    #navLinks .nav-link:hover {
        color: rgb(201, 30, 119);
        text-decoration: underline;
        opacity: 1;
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