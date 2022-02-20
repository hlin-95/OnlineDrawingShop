<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
        <title>LIN's | Registeration</title>
        <script>
            function isEmpty(str) {
                return (!str || str.length === 0);
            }

            $(document).ready(function() {
              $("#button").click(function() {
                var requiredLst1 = document.getElementById("user").querySelectorAll("[required]");
                for (var i = 0; i < requiredLst1.length; i++) {
                    if (isEmpty(requiredLst1[i].value)) {
                        alert("Some required fields in 'USER ACCOUNT INFO' are empty.");
                        return;
                    }
                }

                var password_one = document.getElementById("password").value;
                var password_two = document.getElementById("verifypassword").value;
                if (password_one !== password_two) {
                    alert("Passwords do not match");
                    return;
                }

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


                $.post($("#user").attr("action"),
                    $("#user, #customer").serialize(),
                    function (response) {
                        if (response === "nextStep") {
                            <!-- window.location.href = "/onlineDrawingShop/user/registrationAddress"; -->
                            window.location.href = "/onlineDrawingShop/login?register=success";
                        } else if (response === "userExisted") {
                            alert("Username or email already exists.");
                            window.location.href = "/onlineDrawingShop/registration";
                        } else {
                            alert("Error.");
                            window.location.href = "/onlineDrawingShop/registration";
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
            <form id="user" class="registerForm" action="/onlineDrawingShop/guest/register" method="post" modelAttribute="user">
                <div id="highlight">REGISTER</div>

                <section class="formInfo">
                    <p class="description">The fields marked with * are mandatory.</p>
                    <span class="formTitle">USER ACCOUNT INFO</span>
                    <p>
                        <label for="username">Username:</label>
                        <input id="username" type="text" name="username" placeholder="Username" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="password">Password:</label>
                        <input id="password" type="password" name="password" placeholder="Password" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="verifypassword">Verify password:</label>
                        <input id="verifypassword" type="password" placeholder="Verify password"
                            required>
                        <span class="asterisk_input"> </span>
                    </p>
                </section>
            </form>

            <form id="customer" class="registerForm" action="/onlineDrawingShop/guest/register" method="post" modelAttribute="customer">
                <section class="formInfo">
                    <span class="formTitle">CONTACT INFORMATION</span>
                    <p>
                        <label for="firstName">First name:</label>
                        <input id="firstName" type="text" name="firstName" placeholder="First name" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="lastName">Last name:</label>
                        <input id="lastName" type="text" name="lastName" placeholder="Last name" required>
                        <span class="asterisk_input"> </span>
                    </p>
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
                    <p>
                        <label for="phoneNumber">Phone Number:</label>
                        <input id="phoneNumber" type="number" name="phoneNumber" placeholder="Phone number" required>
                        <span class="asterisk_input"> </span>
                    </p>
                </section>
            </form>

            <input class="button" id="button" type="button" value="REGISTER"/>
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
                background-color: rgb(222, 177, 222);
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