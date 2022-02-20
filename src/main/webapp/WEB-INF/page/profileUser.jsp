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
                            alert("Username or password already exists.");
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
    <%@ include file="navbarUser.jsp" %>

        <main>

            <form id="customer" class="registerForm" action="/onlineDrawingShop/user/" method="post" modelAttribute="customer">
                <div id="highlight">PROFILE</div>
                <section class="formInfo">
                    <c:if test="${not empty infoUpdated}">
                        <p class="warning">${infoUpdated}</p>
                    </c:if>
                    <span class="formTitle">USER BASIC INFO</span>
                    <p>
                        <label>Username:</label>
                        <span class="input">${user.username}</span>
                        <a href="/onlineDrawingShop/user/profileEditPassword?name=${currentUser}" class="edit">Reset password&nbsp></a>
                    </p>
                    </span>
                </section>

                <section class="formInfo">
                    <span class="formTitle">CONTACT INFORMATION</span>
                    <p>
                        <label>First name:</label>
                        <span class="input">${user.customer.firstName}</span>
                        <a href="/onlineDrawingShop/user/profileEditName?name=${currentUser}" class="edit">Edit&nbsp></a>
                    </p>
                    <p>
                        <label>Last name:</label>
                        <span class="input">${user.customer.lastName}</span>
                        <a href="/onlineDrawingShop/user/profileEditName?name=${currentUser}" class="edit">Edit&nbsp></a>
                    </p>
                    <p>
                        <label>Email:</label>
                        <span class="input">${user.email}</span>
                        <a href="/onlineDrawingShop/user/profileEditEmail?name=${currentUser}" class="edit">Edit&nbsp></a>
                    </p>
                    <p>
                        <label>Phone Number:</label>
                        <span class="input">${user.customer.phoneNumber}</span>
                        <a href="/onlineDrawingShop/user/profileEditPhone?name=${currentUser}" class="edit">Edit&nbsp></a>
                    </p>
                </section>

                <section class="formInfo">
                    <span class="formTitle">LIKED ITEMS</span>
                    <p>
                        <label>Number:</label>
                        <span class="input">${number}</span>
                        <span class="edit"></span>
                    </p>
            </form>
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

            .input {
                font-size: 0.8em;
                width: 40%;
                font-weight: 300;
                text-align: left;
                text-decoration: 1px dashed grey underline;
            }

            .edit {
                width: 30%;
                font-size: 0.8em;
                font-weight: 300;
                color: grey;
                text-align: right;
            }

            .edit:hover {
                color: black;
            }

            .input::placeholder {
                color: black;
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