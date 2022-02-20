<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
        <title>LIN's | Profile</title>
        <script>
            function isEmpty(str) {
                return (!str || str.length === 0);
            }

            $(document).ready(function() {
              $("#button").click(function() {
                var requiredLst2 = document.getElementById("customer").querySelectorAll("[required]");
                for (var i = 0; i < requiredLst2.length; i++) {
                    if (isEmpty(requiredLst2[i].value)) {
                        alert("Some required fields in 'USER BASIC INFO' are empty.");
                        return;
                    }
                }
                var email_one = document.getElementById("").value;
                var email_two = document.getElementById("verifyemail").value;
                if (email_one !== email_two) {
                    alert("Password do not match");
                    return;
                }

                $.post($("#customer").attr("action"),
                    $("#customer").serialize(),
                    function (response) {
                        if (response === "nextStep") {
                            window.location.href = "/onlineDrawingShop/user/profile?name=${currentUser}?updated=true";
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
    <%@ include file="navbarUser.jsp" %>

        <main>
            <form id="customer" class="registerForm" action="/onlineDrawingShop/user/edit?info=password" method="post" modelAttribute="customer">
                <div id="highlight">PROFILE</div>
                <section class="formInfo">
                    <div class="warning">This function is not available. We cannot connect to AmazonSES now.</div>
                    <span class="formTitle">USER BASIC INFO</span>
                    <p>
                        <label for="password">Password:</label>
                        <input id="password" type="password" name="password" placeholder="Password" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="verifypassword">Verify password:</label>
                        <input id="verifypassword" type="password" placeholder="Verify password" required>
                        <span class="asterisk_input"> </span>
                    </p>
                </section>
            </form>

            <input class="button" id="button" type="button" value="SUBMIT"/>
        </main>

        <style>
            #navLinks #signup {
                opacity: 1;
            }

            html,
            body {
                min-width: 100%;
                overflow-x: hidden;
            }

            main {
                margin-top: 12%;
                margin-bottom: 9%;
            }

            .warning {
                color: rgb(227, 28, 131);
                font-weight: 600;
                margin-bottom: 2%;
            }

            .registerForm,
            .check {
                width: 40%;
                margin: 0 auto;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                color: black;
                font-weight: 300;
            }

            .registerForm #highlight {
                font-family: 'Montserrat Alternates', sans-serif;
                text-align: center;
                font-size: 1.2em;
                text-decoration: 1px underline black;
                margin-bottom: 10%;
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

            .check #labelForAddressCheckbox {
                float: left;
                margin: 0 auto;
                margin-bottom: 5%;
                width: 95%;
                height: 1.2em;
            }

            .check #addressCheckbox {
                float: right;
                margin: 0 auto;
                margin-bottom: 5%;
                width: 5%;
                height: 1.2em;
            }

            .button {
                display: block;
                margin: 0 auto;
                background-color: rgb(215, 215, 215);
                color: white;
                border: none;
                border-radius: 20px;
                margin-top: 5%;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                font-weight: 600;
                height: 2em;
                width: 9em;
            }

            @media(max-width: 992px) {
                .registerForm,
                .check {
                    font-size: 0.9em;
                }
            }

            @media(max-width: 768px) {
                .registerForm,
                .check {
                    width: 60%;
                }

                section,
                .check {
                    font-size: 0.8em;
                }
            }

            @media(max-width: 576px) {
                .registerForm,
                .check {
                    width: 80%;
                }

                .registerForm {
                    margin-top: 20%;
                }
            }
        </style>

        <!-- Footer -->
        <%@ include file="footer.jsp" %>

        <!-- Bootstrap JS -->
        <%@ include file="bootstrap.jsp" %>
</body>

</html>