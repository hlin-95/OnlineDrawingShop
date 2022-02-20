<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
        <title>LIN's | Forget Password</title>
        <script>
            function isEmpty(str) {
                return (!str || str.length === 0);
            }

            $(document).ready(function () {
                $("#button").click(function () {
                    var requiredLst2 = document.getElementById("customer").querySelectorAll("[required]");
                    for (var i = 0; i < requiredLst2.length; i++) {
                        if (isEmpty(requiredLst2[i].value)) {
                            alert("Some required fields in 'CONTACT INFORMATION' are empty.");
                            return;
                        }
                    }
                    var email_one = document.getElementById("email").value;
                    var email_two = document.getElementById("verifyemail").value;
                    if (email_one !== email_two) {
                        alert("Emails do not match");
                        return;
                    }

                    $.post($("#customer").attr("action"),
                        $("#customer").serialize(),
                        function (response) {
                            if (response === "nextStep") {
                                window.location.href = "/onlineDrawingShop/user/profile?name=${currentUser}";
                            } else if (response === "userExisted") {
                                alert("Email already exists.");
                                window.location.href = "/onlineDrawingShop/user/profileEditEmail?name=${currentUser}";
                            } else {
                                alert("Error.");
                                window.location.href = "/onlineDrawingShop/user/profileEditEmail?name=${currentUser}";
                            }
                        }
                    )
                })
            })
        </script>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

        <main>
            <form id="customer" class="registerForm" action="/onlineDrawingShop/user/edit?info=email" method="post"
                modelAttribute="customer">
                <div id="highlight">SECURITY</div>
                <section class="formInfo">
                    <div class="warning">This function is not available. We cannot connect to AmazonSES now.</div>
                    <span class="formTitle">CONTACT INFORMATION</span>
                    <p>
                        <label for="email">Email:</label>
                        <input id="email" type="email" name="email" placeholder="Email" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="verifyemail">Verify email:</label>
                        <input id="verifyemail" type="email" placeholder="Verify email" required>
                        <span class="asterisk_input"> </span>
                    </p>
                </section>
            </form>

            <input class="button" id="button" type="button" value="SEND VERIFICATION EMAIL" />
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

            .registerForm,
            .check,
            .signUp {
                width: 40%;
                margin: 0 auto;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                color: black;
                font-weight: 300;
            }

            .registerForm {
                margin-top: -3%;
            }

            .registerForm #highlight {
                font-family: 'Montserrat Alternates', sans-serif;
                text-align: center;
                font-size: 1.2em;
                text-decoration: 1px underline black;
                margin-bottom: 10%;
            }

            .registerForm .warning {
                color: rgb(227, 28, 131);
                font-weight: 600;
            }

            .warning {
                margin-bottom: 2%;
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
                background-color: rgb(215, 215, 215);
                color: white;
                border: none;
                border-radius: 20px;
                margin-top: 5%;
                margin-bottom: 2%;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                font-weight: 600;
                height: 2em;
                width: 16em;
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