<!doctype html>
<html>

<head>

    <%@ include file="header.jsp" %>
    <%@ page isELIgnored="false" %>
        <title>LIN's | Login</title>
        <script>

            var checkBox = null;

            function isEmpty(str) {
                return (!str || str.length === 0);
            }

            function submitForms() {
                var requiredLst1 = document.getElementById("userLogin").querySelectorAll("[required]");
                for (var i = 0; i < requiredLst1.length; i++) {
                    if (isEmpty(requiredLst1[i].value)) {
                        alert("Your username or password is empty");
                        return;
                    }
                }
                document.getElementById("userLogin").submit();
            }
        </script>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

        <main>
            <form id="userLogin" class="loginForm" action="/onlineDrawingShop/guest/login-form" method="post">
                <div id="highlight">LOG IN</div>
                <c:if test="${not empty error}">
                    <p class="warning">${error}</p>
                </c:if>
                <c:if test="${not empty register}">
                    <p class="warning">${register}</p>
                </c:if>
                <section class="formInfo">
                    <p class="description">The fields marked with * are mandatory.</p>
                    <span class="formTitle">LOG IN WITH USERNAME</span>
                    <p>
                        <label for="username">Username:</label>
                        <input id="username" type="text" name="username" placeholder="Username" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="password1">Password:</label>
                        <input id="password1" type="password" name="password" placeholder="Password" required>
                        <span class="asterisk_input"> </span>
                    </p>
                </section>

            </form>

            <section class="check">
                <a href="/onlineDrawingShop/forgetPassword">Forget your password? </a>
            </section>


            <input class="button" type="button" value="LOG IN" onclick="submitForms()" />

            <section class="signUp">
                <span class="formTitle">DON'T HAVE AN ACCOUNT YET? &emsp;<a
                        href="/onlineDrawingShop/registration">SIGN
                        UP</a>
                </span>
            </section>
        </main>

        <style>
            #navLinks #login {
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

            .loginForm,
            .check,
            .signUp {
                width: 40%;
                margin: 0 auto;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                color: black;
                font-weight: 300;
            }

            .loginForm {
                margin-top: -3%;
            }

            .loginForm #highlight {
                font-family: 'Montserrat Alternates', sans-serif;
                text-align: center;
                font-size: 1.2em;
                text-decoration: 1px underline black;
                margin-bottom: 10%;
            }

            .loginForm .warning {
                color: rgb(227, 28, 131);
                font-weight: 600;
            }

            .description {
                font-size: 0.8em;
            }

            .formInfo {
                margin-bottom: 3em;
            }

            .formTitle {
                display: block;
                border-bottom: 1px solid rgb(182, 182, 182);
                margin-bottom: 3%;
            }

            .formInfo p {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                text-align: left;
            }

            label {
                width: 30%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                font-size: 0.8em;
                font-weight: 300;
            }

            input {
                width: 70%;
                font-size: 0.8em;
                font-weight: 300;
            }

            input::placeholder {
                color: rgb(182, 182, 182);
            }

            .asterisk_input:after {
                content: " *";
                color: red;
                position: absolute;
                margin: 0px 0px 0px -12px;
                font-size: 1.2em;
            }

            .check #labelForEmailCheckbox {
                float: left;
                margin: 0 auto;
                margin-bottom: 5%;
                width: 95%;
                height: 1.2em;
            }

            .check #emailCheckbox {
                float: right;
                margin: 0 auto;
                margin-bottom: 5%;
                width: 5%;
                height: 1.2em;
            }

            .check a {
                font-size: 0.8em;
                font-weight: 300;
                color: black;
                text-decoration: 1px underline rgb(182, 182, 182);
            }

            #emailLogin {
                display: none;
            }

            .signUp {
                text-align: center;
                border-top: 1px solid rgb(182, 182, 182);
            }

            .signUp a {
                color: black;
            }

            .signUp a {
                text-decoration: 1px underline;
            }

            a:hover {
                color: rgb(227, 28, 131);
            }

            .button {
                display: block;
                margin: 0 auto;
                background-color: rgb(222, 177, 222);
                color: white;
                border: none;
                border-radius: 20px;
                margin-top: 5%;
                margin-bottom: 2%;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                font-weight: 600;
                height: 2em;
                width: 8em;
            }

            .button:hover {
                cursor: pointer;
                color: rgb(227, 28, 131);
            }

            .button:active {
                opacity: 50%;
                color: white;
                box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            }

            .button:focus {
                outline: 0;
            }

            @media(max-width: 992px) {
                .loginForm,
                .check,
                .signUp {
                    font-size: 0.9em;
                }
            }

            @media(max-width: 768px) {
                .loginForm,
                .check,
                .signUp {
                    width: 60%;
                }

                section,
                .check,
                .signUp {
                    font-size: 0.8em;
                }
            }

            @media(max-width: 576px) {
                .loginForm,
                .check,
                .signUp {
                    width: 80%;
                }
            }
        </style>
        <!-- Footer -->
        <%@ include file="footer.jsp" %>

            <!-- Bootstrap JS -->
            <%@ include file="bootstrap.jsp" %>
</body>

</html>