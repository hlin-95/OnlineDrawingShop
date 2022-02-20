<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Add products</title>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbarAdmin.jsp" %>

    <main>
        <form class="productForm" action="/onlineDrawingShop/admin/addProduct?category=${category}"
            method="post" modelAttribute="product">
            <div id="highlight">ADD PRODUCT</div>
            <section class="formInfo">
                <p class="description">The fields marked with * are mandatory.</p>
                <span class="formTitle">PRODUCT INFO</span>
                <p>
                    <label for="category">Category:</label>
                    <input id="category" type="text" name="category" value="${category}" placeholder="${category}" disabled>
                </p>
                <p>
                    <label for="productName">Product Name:</label>
                    <input id="productName" type="text" name="productName" placeholder="Product name" required>
                    <span class="asterisk_input"> </span>
                </p>
                <p>
                    <label for="description">Product Description:</label>
                    <input id="description" type="text" name="description" placeholder="Product description" required>
                    <span class="asterisk_input"> </span>
                </p>
                <p>
                    <label for="imageUrl">Image URL:</label>
                    <input id="imageUrl" type="text" name="imageUrl" placeholder="Image URL, eg./resources/xxx/file_name" required>
                    <span class="asterisk_input"> </span>
                </p>
                <!--
                    <p>
                        <label for="price">Product Price($):</label>
                        <input id="price" type="number" min="0.00" max="10000.00" step="0.01"
                            name="price" placeholder="Product price" required>
                        <span class="asterisk_input"> </span>
                    </p>
                    <p>
                        <label for="unitStock">Number of Items:</label>
                        <input id="unitStock" type="number" name="unitStock" placeholder="Number of items" required>
                        <span class="asterisk_input"> </span>
                    </p>
                -->
            </section>
            <button class="button">SUMBIT</button>
        </form>

        <style>
            #navLinks #navbarDropdownMenuLink {
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

            .productForm {
                width: 40%;
                margin: 0 auto;
                font-family: 'Nunito Sans', sans-serif;
                font-size: 1em;
                color: black;
                font-weight: 300;
            }

            .productForm {
                margin-top: -3%;
            }

            .productForm #highlight {
                font-family: 'Montserrat Alternates', sans-serif;
                text-align: center;
                font-size: 1.2em;
                text-decoration: 1px underline black;
                margin-bottom: 10%;
            }

            .productForm .warning {
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
                .productForm {
                    font-size: 0.9em;
                }
            }

            @media(max-width: 768px) {
                .productForm {
                    width: 60%;
                }

                section {
                    font-size: 0.8em;
                }
            }

            @media(max-width: 576px) {
                .productForm {
                    width: 80%;
                }
        </style>
    </main>
    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
    <%@ include file="bootstrap.jsp" %>
</body>

</html>