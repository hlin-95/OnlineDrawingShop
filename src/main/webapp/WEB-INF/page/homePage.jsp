<!doctype html>
<html>

    <head>
        <%@ include file="header.jsp" %>
        <title>LIN's | Home</title>
    </head>

    <body>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>

        <main>
            <c:url value="/guest/getProducts" var="productUrl"></c:url>
            <section id="sectionCover">
                <section class="container-fluid px-0">
                    <div class="row align-items-center">
                        <div class="col-sm-12 px-0">
                            <a href="/onlineDrawingShop/shopAll"><img class="img-fluid"
                                    src='<c:url value="/resources/homePage/garden.webp"/>'></a>
                        </div>
                    </div>
                </section>
                <section class="container-fluid px-0">
                    <a href="/onlineDrawingShop/login">
                        <div class="row align-items-center">
                            <div class="divideRow col-sm-12 text-center px-0">Welcome to LIN's Drawing Shop. <span
                                    class="highlight3">SIGN IN</span> to
                                shop drawings
                                with different themes now. <span class="highlight3">FREE SHIPPING</span> state wide.
                            </div>
                        </div>
                    </a>
                </section>
            </section>


            <section id="sectionPink">
                <section class="container-fluid">
                    <div class="row align-items-center">
                        <div class="textBox1 col-sm-6 text-center px-0">
                            <h2><span class="highlight1">LIN's</span></h2>
                            <h2><span class="highlight2">L</span>ANDSCAPE <span class="highlight2">A</span>RCHITECTURE
                            </h2>
                            <h2>URBA<span class="highlight2">N</span> DESIGN</h2>
                            <h2><span class="highlight2">D</span>AILY LIFE</h2>
                            <h2>HARDSCAPE | SOFT<span id="highlight2">SCAPE</span></h2>
                            <h2>DRAWING SHOP</h2>
                        </div>
                        <div id="imgPink" class="col-sm-6 px-0">
                        </div>
                    </div>
                </section>
                <section class="container-fluid px-0">
                    <a href="${productUrl}/Canal">
                        <div class="row align-items-center">
                            <div class="divideRow col-sm-12 text-center px-0">Click here to shop all the drawings under
                                <span class="highlight3">CANAL</span>
                                category.
                            </div>
                        </div>
                    </a>
                </section>
            </section>


            <section id="sectionNight">
                <section class="container-fluid px-0">
                    <div class="row align-items-center">
                        <div id="imgMoment" class="col-sm-12 px-0">
                        </div>
                    </div>
                </section>

                <section class="container-fluid px-0">
                    <a href="${productUrl}/Moment">
                        <div class="row align-items-center">
                            <div class="divideRow col-sm-12 text-center px-0">Click here to shop all the drawings under
                                <span class="highlight3">MOMENT</span>
                                category.
                            </div>
                        </div>
                    </a>
                </section>
            </section>


            <section id="sectionBlue">
                <section class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-sm-6 px-0" id="gifBlue">
                        </div>
                        <div class="textBox2 col-sm-6 text-left">
                            <h3>LIN's Drawing Shop</h3>
                            <p> This is the drawing shop from Lin Huang to record all the projects she has done before
                                including
                                landscape design, urban design, architecture design, handdrawing, physical model and so
                                on
                                during
                                her experiences in the field of environmental design. Lin believes that the principle
                                force
                                behind
                                every micro drawing is the understanding of a specific and beautiful story. Lin wants to
                                share her
                                story and dream with all the visitors.</p>
                        </div>
                    </div>

                </section>

                <section class="container-fluid px-0">
                    <a href="${productUrl}/Time">
                        <div class="row align-items-center">
                            <div class="divideRow col-sm-12 text-center px-0">Click here to shop all the drawings under
                                <span class="highlight3">TIME</span>
                                category.
                            </div>
                        </div>
                    </a>
                </section>
            </section>


            <section id="sectionGreen">
                <section class="container-fluid px-0">
                    <div class="row align-items-center">
                        <div id="imgChildhood" class="col-sm-6 px-0">
                        </div>
                        <div id="imgChildhood1" class="col-sm-6 px-0">
                        </div>
                    </div>
                </section>

                <section class="container-fluid px-0">
                    <a href="${productUrl}/Childhood">
                        <div class="row align-items-center">
                            <div class="divideRow col-sm-12 text-center px-0">Click here to shop all the drawings under
                                <span class="highlight3">CHILDHOOD</span>
                                category.
                            </div>
                        </div>
                    </a>
                </section>
            </section>

            <style>
                #navLinks #home {
                    opacity: 1;
                }

                body, html {
                    min-width: 100%;
                    overflow-x: hidden;
                }

                #sectionPink {
                    background-color: rgb(242, 235, 241);
                }

                #sectionBlue {
                    background-color: rgb(235, 235, 240);
                }

                #sectionGreen {
                    background-color: rgb(229, 238, 236);
                }

                #sectionCover a:hover,
                #sectionPink a:hover,
                #sectionNight a:hover,
                #sectionBlue a:hover,
                #sectionGreen a:hover {
                    text-decoration: underline white;
                }

                #imgPink {
                    border: 1px dashed rgb(201, 30, 119);
                    height: 60vw;
                    background-image: url('<c:url value="/resources/homePage/axon.webp"/>');
                    background-size: cover;
                    background-repeat: repeat;
                }

                #gifBlue {
                    border: 1px dashed rgb(201, 30, 119);
                    height: 34vw;
                    background-image: url('<c:url value="/resources/homePage/water-level.webp"/>');
                    background-size: cover;
                    background-repeat: repeat;
                }

                #imgChildhood {
                    height: 30vw;
                    background-image: url('<c:url value="/resources/homePage/childhood2.webp"/>');
                    background-size: cover;
                    background-repeat: no-repeat;
                }

                #imgChildhood1 {
                    height: 30vw;
                    background-image: url('<c:url value="/resources/homePage/childhood1.webp"/>');
                    background-size: cover;
                    background-repeat: no-repeat;
                }

                #imgMoment {
                    height: 40vw;
                    background-image: url('<c:url value="/resources/homePage/moment.webp"/>');
                    background-position: center;
                    background-size: cover;
                    background-repeat: no-repeat;
                }

                .textBox1 {
                    padding-top: 2%;
                    font-size: 1em;
                }

                .textBox1 h2 {
                    font-family: 'Montserrat Alternates', sans-serif;
                    color: rgb(143, 105, 143);
                    text-decoration: 0.5px underline rgb(201, 30, 119);
                    margin-bottom: 5%;
                    font-weight: 300;
                    font-size: 1.3em;
                }

                .textBox1 h2 .highlight1 {
                    color: rgb(201, 30, 119);
                    font-family: 'Montserrat Alternates', sans-serif;
                    font-size: 1.5em;
                    font-weight: 600;
                    text-align: center;
                }

                .textBox1 h2 .highlight2 {
                    color: rgb(201, 30, 119);
                    font-weight: 600;
                }

                .textBox2 {
                    font-family: 'Nunito Sans', sans-serif;
                    font-size: 1em;
                    color: rgb(143, 105, 143);
                    font-weight: 300;
                }

                .textBox2 h3 {
                    font-size: 1.4em;
                    font-weight: 600;
                    text-align: center;
                    margin-bottom: 3%;
                }

                .textBox2 p {
                    font-size: 0.8em;
                    margin-left: 15%;
                    margin-right: 15%;
                    margin-bottom: 0%;
                    text-align: justify;
                }

                .divideRow {
                    width: 100%;
                    height: 1.5em;
                    background-color: rgb(189, 149, 189);
                    color: white;
                    font-family: 'Nunito Sans', sans-serif;
                    font-size: 0.9em;
                    font-weight: 300;
                }

                .divideRow .highlight3 {
                    font-weight: 600;
                    text-decoration: 0.01px underline white;
                }

                @media(max-width: 992px) {

                    .textBox1,
                    .textBox2 {
                        font-size: 0.8em;
                    }

                    .divideRow {
                        height: 1.5em;
                        font-size: 0.8em;
                    }
                }

                @media(max-width: 768px) {

                    .textBox1,
                    .textBox2 {
                        font-size: 0.6em;
                    }

                    .divideRow {
                        height: 1.5em;
                        font-size: 0.6em;
                    }
                }

                @media(max-width: 576px) {

                    .textBox1,
                    .textBox2 {
                        padding-top: 8%;
                        padding-bottom: 6%;
                        font-size: 0.5em;
                    }

                    .textBox1 h2 {
                        margin-bottom: 3%;
                    }

                    section #imgPink {
                        height: 120vw;
                        border: none;
                    }

                    section #gifBlue {
                        height: 68vw;
                        border: none;
                    }

                    section #imgChildhood {
                        height: 60vw;
                    }

                    section #imgChildhood1 {
                        height: 60vw;
                        display: none;
                    }

                    .divideRow {
                        height: 1.35em;
                        font-size: 0.4em;
                    }

                    #sectionNight {
                        display: none;
                    }
                }
            </style>
        </main>

        <!-- Footer -->
        <%@ include file="footer.jsp" %>

        <!-- Bootstrap JS -->
        <%@ include file="bootstrap.jsp" %>
    </body>

</html>