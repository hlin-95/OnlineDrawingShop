<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Shop</title>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbarUser.jsp" %>

        <main>
            <c:url value="/user/getProducts" var="url"></c:url>
            <section class="currentTitle">
                <div id="highlight">ALL THEMES</div>
                <!-- <p>Let's discover something unique and powerful here. See various themes below. Begin to get inspired!</p> -->
            </section>
            <section class="row">
                <div class="container">
                    <a href="${url}/Canal" class="theme">
                        <img src='<c:url value="/resources/themes/1canal.webp"/>'/>
                        <div class="themeTitle">Canal</div>
                        <div class="themeDetail">canal city in phoenix</div>
                    </a>
                    <a href="${url}/Time" class="theme">
                        <img src='<c:url value="/resources/themes/2time.webp"/>'/>
                        <div class="themeTitle">Time</div>
                        <div class="themeDetail">change over time</div>
                    </a>

                </div>
                <div class="container">
                    <a href="${url}/Pushing-Garden" class="theme">
                        <img src='<c:url value="/resources/themes/3pushingGarden.webp"/>'/>
                        <div class="themeTitle">Pushing Garden</div>
                        <div class="themeDetail">garden along the milwaukee river</div>
                    </a>
                    <a href="${url}/Physical-Model" class="theme">
                        <img src='<c:url value="/resources/themes/4model.webp"/>'/>
                        <div class="themeTitle">Physical Model</div>
                        <div class="themeDetail">wood, 3d printing, laser cut</div>
                    </a>

                </div>
            </section>

            <section class="row">
                <div class="container">
                    <a href="${url}/Garden" class="theme">
                        <img src='<c:url value="/resources/themes/5garden.webp"/>'/>
                        <div class="themeTitle">Garden</div>
                        <div class="themeDetail">elegant garden design</div>
                    </a>
                    <a href="${url}/Pinkish-World" class="theme">
                        <img src='<c:url value="/resources/themes/6pinkish.webp"/>'/>
                        <div class="themeTitle">Pinkish World</div>
                        <div class="themeDetail">dreamy stage</div>
                    </a>
                </div>
                <div class="container">
                    <a href="${url}/Reservoir" class="theme">
                        <img src='<c:url value="/resources/themes/7reservoir.webp"/>'/>
                        <div class="themeTitle">Reservoir</div>
                        <div class="themeDetail">redesigned reservoir park</div>
                    </a>
                    <a href="${url}/Hand-Drawing" class="theme">
                        <img src='<c:url value="/resources/themes/8handDrawing.webp"/>'/>
                        <div class="themeTitle">Hand Drawing</div>
                        <div class="themeDetail">sketch and line works</div>
                    </a>
                </div>
            </section>

            <section class="row">
                <div class="container">
                    <a href="${url}/Moment" class="theme">
                        <img src='<c:url value="/resources/themes/9moment.webp"/>'/>
                        <div class="themeTitle">Moment</div>
                        <div class="themeDetail">simple moment</div>
                    </a>
                    <a href="${url}/Boat" class="theme">
                        <img src='<c:url value="/resources/themes/10boat.webp"/>'/>
                        <div class="themeTitle">Boat</div>
                        <div class="themeDetail">village on the water</div>
                    </a>
                </div>
                <div class="container">
                    <a href="${url}/Childhood" class="theme">
                        <img src='<c:url value="/resources/themes/11childhood.webp"/>'/>
                        <div class="themeTitle">Childhood</div>
                        <div class="themeDetail">what was your childhood like?</div>
                    </a>
                    <a href="${url}/Daily-Life" class="theme">
                        <img src='<c:url value="/resources/themes/12dailyLife.webp"/>'/>
                        <div class="themeTitle">Daily Life</div>
                        <div class="themeDetail">my life - some moments</div>
                    </a>
                </div>
            </section>

        </main>

        <style>
            #navLinks #navbarDropdownMenuLink {
                opacity: 1;
            }

            html,
            body {
                min-width: 100%;
                overflow-x: hidden;
            }

            a {
                text-decoration: none;
            }

            main {
                margin-top: 12%;
                margin-bottom: 9%;
            }

            .currentTitle {
                text-align: center;
                margin: 0 auto;
                color: black;
                font-family: 'Nunito Sans', sans-serif;
                font-weight: 300;
                font-size: 1em;
                margin-bottom: 8%;
            }

            .currentTitle #highlight {
                font-size: 1.2em;
                font-family: 'Montserrat Alternates', sans-serif;
                text-decoration: 1px underline black;
            }

            .row {
                width: 65%;
                height: auto;
                margin: 0 auto;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            .row .container {
                width: 50%;
                padding: 0%;
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                flex-wrap: wrap;
            }

            .theme {
                margin-bottom: 30%;
                font-size: 1em;
                color: black;
                font-family: 'Nunito Sans', sans-serif;
            }

            .theme img {
                -webkit-filter: grayscale(100%);
                filter: grayscale(100%);
                width: 150px;
                height: 150px;
            }

            .theme .themeTitle {
                padding-top: 5%;
                font-size: 0.7em;
                font-weight: 400;
            }

            .theme .themeDetail {
                font-size: 0.6em;
                font-weight: 200;
            }

            .theme:hover {
                color: black;
                text-decoration: underline;
            }

            .theme:hover img {
                filter: none;
            }

            @media(max-width: 992px) {

                .theme,
                .currentTitle {
                    font-size: 0.8em;
                }
            }

            @media(max-width: 768px) {

                .theme,
                .currentTitle {
                    font-size: 0.7em;
                }
            }

            @media(max-width: 576px) {

                .theme,
                .currentTitle {
                    font-size: 0.6em;
                }

                .row {
                    display: flex;
                    flex-direction: column;
                }
            }
        </style>

        <!-- Footer -->
        <%@ include file="footer.jsp" %>

            <!-- Bootstrap JS -->
            <%@ include file="bootstrap.jsp" %>
</body>

</html>