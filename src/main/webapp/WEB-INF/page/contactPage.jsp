<!doctype html>
<html>

<head>

    <%@ include file="header.jsp" %>
    <%@ page isELIgnored="false" %>
    <title>LIN's | Contact</title>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

    <main>
        <div class="currentTitle">CONTACT</div>
        <section>
            <div class="intro">
                <span id="thick">Brief Introduction:</span><br>
                Lin's background is urban planning and landscape architecture.<br>
                This shop is created by her to show most of the drawings and designs she did before.<br>
                Lin believes that the principle force behind every micro drawing is the understanding of a beautiful story.<br>
                Lin wants to share her story and dream with all the visitors.<br><br><br>
                <span id="thick">Contact Information:</span><br>
                lin_huang@berkeley.edu<br>
                @lynn.hlin<br>
                Seattle, the United States.
            </div>

            <img src='<c:url value="/resources/contact/pinkSky.webp"/>' alt="contact" class="contactImg">
        </section>

    </main>

    <style>
        #navLinks #contact {
            opacity: 1;
        }

        html {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;

        }

        body {
            max-height: 100%;
            min-width: 100%;
            overflow-x: hidden;
        }

        main {
            width:70%;
            margin: 0 auto;
            margin-top: -5%;
            font-size: 1em;
        }

        .currentTitle {
            margin: 0 auto;
            color: black;
            font-size: 1.2em;
            font-family: 'Montserrat Alternates', sans-serif;
            text-decoration: 1px underline black;
            font-weight: 300;
            margin-bottom: 8%;
            text-align: center;
        }

        section {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .contactImg {
            width: 225px;
        }

        .intro {
            font-size:0.8em;
            font-family: 'Nunito Sans', sans-serif;
            font-weight: 300;
            margin-top: 2em;
            margin-right: 5em;
        }

        #thick {
            font-weight: 600;
        }

        @media(max-width: 992px) {
            section {
                font-size: 0.8em;
            }
            .contactImg {
                width: 200px;
            }
        }

        @media(max-width: 768px) {
            main {
                font-size: 0.8em;
            }
            section {
                flex-direction: column;
                justify-content: center;
            }
            .intro {
                margin-right: 0em;
            }
            .contactImg {
                margin-top: 5%;
                width: 120px;
            }
        }

        @media(max-width: 576px) {
        }
    </style>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
    <%@ include file="bootstrap.jsp" %>
</body>

</html>