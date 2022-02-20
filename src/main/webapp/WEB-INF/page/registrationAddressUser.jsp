<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
        <title>LIN's | Registeration</title>
        <script>
            var checkBox = null;

            function skip() {
                window.location.href = "/onlineDrawingShop/user/loginSuccess?name=show";
            }
            function isEmpty(str) {
                return (!str || str.length === 0);
            }

            function checkSameAddress() {
                checkBox = document.getElementById("addressCheckbox");
                var address2 = document.getElementById("billingAddress");
                if (checkBox.checked) {
                    address2.style.display = "block";
                } else {
                    address2.style.display = "none";
                }
                return;
            }

            function submitForms() {
                var requiredLst3 = document.getElementById("shippingAddress").querySelectorAll("[required]");
                for (var i = 0; i < requiredLst3.length; i++) {
                    if (isEmpty(requiredLst3[i].value)) {
                        alert("Some required fields in 'SHIPPING ADDRESS' are empty.");
                        return;
                    }
                }
                var address1 = document.getElementById("shippingAddress");
                var address2 = document.getElementById("billingAddress");
                if (checkBox == null || !checkBox.checked) {
                    for (var i = 0; i < address1.length; i++) {
                        address2[i].value = address1[i].value;
                    }
                } else {
                    var requiredLst4 = address2.querySelectorAll("[required]");
                    for (var i = 0; i < requiredLst4.length; i++) {
                        if (isEmpty(requiredLst4[i].value)) {
                            alert("Some required fields in 'BILLING ADDRESS' are empty.");
                            return;
                        }
                    }
                }

                $.post($("#shippingAddress").attr("action"),
                    $("#shippingAddress").serialize(),
                    function (response) {
                        if (response === "error") {
                            alert("Error.");
                            window.location.href = "/onlineDrawingShop/user/registrationAddress";
                        } else if (response === "shippingAdded") {
                            $.post($("#billingAddress").attr("action"),
                                $("#billingAddress").serialize(),
                                    function (response) {
                                    if (response === "error") {
                                        alert("Error.");
                                        window.location.href = "/onlineDrawingShop/user/registrationAddress";
                                    } else if (response === "billingAdded") {
                                        window.location.href = "/onlineDrawingShop/user/loginSuccess?name=show";
                                    }
                                })
                        }
                    }
                )
            }
        </script>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

        <main>
            <form id="shippingAddress" class="registerForm" action="/onlineDrawingShop/user/registerShipping" method="post" modelAttribute="shippingAddress">
                <div id="highlight">REGISTER</div>
                <section class="formInfo">
                    <p class="description">The fields marked with * are mandatory.</p>
                    <span class="formTitle">SHIPPING ADDRESS</span>
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
                        <label for="country">Country / Region:</label>
                        <input id="country" type="text" name="country" placeholder="Country / Region" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="state">State / Province:</label>
                        <input id="state" type="text" name="state" placeholder="State / Province" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="postalCode">Zip / Postal code:</label>
                        <input id="postalCode" type="text" name="postalCode" placeholder="Zip / Postal code" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="address">Address:</label>
                        <input id="address" type="text" name="street" placeholder="Address" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="city">City:</label>
                        <input id="city" type="text" name="city" placeholder="City" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="phoneNumber">Phone Number:</label>
                        <input id="phoneNumber" type="number" name="phoneNumber" placeholder="Phone number">
                    </p>
                </section>
            </form>

            <section class="check">
                <label id="labelForAddressCheckbox" for="addressCheckbox">Click to use different shipping address from
                    billing address.</label>
                <input id="addressCheckbox" type="checkbox" name="addressSame" onclick="javascript:checkSameAddress()">
            </section>

            <form id="billingAddress" class="registerForm" action="/onlineDrawingShop/user/registerBilling" method="post" modelAttribute="billingAddress">
                <section class=" formInfo">
                    <span class="formTitle">BILLING ADDRESS</span>
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
                        <label for="country">Country / Region:</label>
                        <input id="country" type="text" name="country" placeholder="Country / Region" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="state">State / Province:</label>
                        <input id="state" type="text" name="state" placeholder="State / Province" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="postalCode">Zip / Postal code:</label>
                        <input id="postalCode" type="text" name="postalCode" placeholder="Zip / Postal code" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="address">Address:</label>
                        <input id="address" type="text" name="street" placeholder="Address" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="city">Address:</label>
                        <input id="city" type="text" name="city" placeholder="City" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="phoneNumber">Phone Number:</label>
                        <input id="phoneNumber" type="number" name="phoneNumber" placeholder="Phone number">
                    </p>
                </section>
            </form>

            <section class="buttons">
                <input class="button" type="button" value="REGISTER" onclick="submitForms()" />
                <input class="button" type="button" value="SKIP" onclick="skip()" />
            </section>
        </main>

        <style>
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

            #billingAddress {
                display: none;
            }

            .buttons {
                text-align: center;
                padding-bottom: 10%;
            }

            .button {
                display: inline-block;
                margin: 0 2em;
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