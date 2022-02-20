<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Registeration</title>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbarUser.jsp" %>
    <main>
        <section class="successForm">
            <h1>SUCCESS!</h1>
            <img src="https://i.ibb.co/zXkRm4z/check.png" alt="check">
            <p>
                Welcome!
                <c:if test="${not empty currentUser}">
                    <span class="currentUser">${currentUser}</span>
                </c:if><br>
                Your account has been created and you've logged in.
            </p>
            <a href="/onlineDrawingShop/user/home?name=${currentUser}" class="button">GO TO HOMEPAGE</a>
        </section>
    </main>
    <style>
        #navLinks #signup {
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

        .successForm {
            width: 35%;
            margin: 0 auto;
            margin-top: -3%;
            font-family: 'Nunito Sans', sans-serif;
            font-size: 1em;
            color: black;
            font-weight: 300;
            border-radius: 25px;
            border: 3px solid rgb(222, 177, 222);
        }

        .successForm h1 {
            font-family: 'Montserrat Alternates', sans-serif;
            text-align: center;
            font-size: 1.5em;
            padding-top: 20%;
            margin-bottom: 15%;
            color: rgb(227, 28, 131);
        }

        .successForm p {
            font-size: 0.8em;
            text-align: center;
        }

        .successForm img {
            width: 25%;
            display: block;
            margin-left: auto;
            margin-right: auto;
            padding-bottom: 15%;
        }

        .successForm a.button {
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgb(222, 177, 222);
            color: white;
            border: none;
            border-radius: 20px;
            margin-top: 10%;
            margin-bottom: 20%;
            font-family: 'Nunito Sans', sans-serif;
            font-size: 1em;
            font-weight: 600;
            height: 2em;
            width: 12em;
        }

        .successForm .button:hover {
            cursor: pointer;
            color: rgb(227, 28, 131);
        }

        .successForm .button:active {
            opacity: 50%;
            color: white;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        }

        .currentUser {
            color: rgb(227, 28, 131);
        }

        @media(max-width: 992px) {
            .successForm {
                width: 50%;
            }
        }
        @media(max-width: 768px) {
            .successForm {
                width: 70%;
                font-size: 1em;
            }
        }

        @media(max-width: 576px) {
            .successForm {
                font-size: 0.8em;
            }
        }
    </style>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>
    <!-- Bootstrap JS -->
    <%@ include file="bootstrap.jsp" %>
</body>
</html>
