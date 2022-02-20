<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Products</title>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbarAdmin.jsp" %>

    <main>
        <h1 id="highlight">PRODUCTS&nbsp--&nbsp${category}</h1>
        <table class="productsForm">
            <tr>
                <th class="normalCol">Image</th>
                <th class="normalCol">Id</th>
                <th class="normalCol">Name</th>
                <th class="normalCol">Category</th>
                <th>Image URL</th>
                <th class="numberCol">Liked</th>
                <!--
                    <th class="numberCol">Price</th>
                    <th class="numberCol">Units</th>
                -->
                <th class="numberCol">Remove</th>
            </tr>

            <c:forEach var="drawing" items="${products}">
            <tr>
                <td>
                    <img class="image" src='<c:url value="${drawing.imageUrl}"/>'>
                </td>
                <td class="normalCol">
                    <c:out value="${drawing.productId}" />
                </td>
                <td class="normalCol">
                    <c:out value="${drawing.productName}" />
                </td>
                <td class="normalCol">
                    <c:out value="${drawing.category}" />
                </td>
                <td>
                    <c:out value="${drawing.imageUrl}" />
                </td>
                <td>
                    <c:out value="${drawing.liked}" />
                </td>
                <td>
                    <form action="/onlineDrawingShop/admin/deleteProduct/${category}/${drawing.productId}" method="post">
                        <button class="X">X</button>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </table>
        <section class="button">
            <a href="/onlineDrawingShop/admin/getAddProductForm/${category}"
            class="link">ADD PRODUCT</a>
        </section>
    </main>

    <style>
        #navLinks #navbarDropdownMenuLink {
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

        .productsForm {
            width: 70%;
            margin: 0 auto;
            font-family: 'Nunito Sans', sans-serif;
            font-size: 1em;
            color: black;
            margin-top: -3%;
            text-align: center;
        }

        .productsForm th{
            border: 1px solid rgb(150, 150, 150);
            border-right: none;
            border-left: none;
            font-weight: 600;
            font-size: 0.9em;
        }

        td {
            border: 1px solid rgb(200, 200, 200);
            border-right: none;
            border-left: none;
            font-weight: 300;
            font-size: 0.8em;
        }

        .normalCol {
            width: 15%;
        }

        .numberCol {
            width: 7%;
        }

        #highlight {
            font-family: 'Montserrat Alternates', sans-serif;
            text-align: center;
            font-size: 1.2em;
            text-decoration: 1px underline black;
            margin-bottom: 10%;
            font-weight: 300;
            text-transform: uppercase;
        }

        .image {
            width: 75%;
        }

        .button {
            display: flex;
            align-items: center;
        }

        .link {
            text-align: center;
            height: 2em;
            line-height: 2em;
            width: 12em;
            background-color: rgb(222, 177, 222);
            color: white;
            border-radius: 20px;
            margin: 0 auto;
            margin-top: 5%;
            margin-bottom: 2%;
            font-family: 'Nunito Sans', sans-serif;
            font-size: 1em;
            font-weight: 600;
        }

        .link:hover {
            cursor: pointer;
            color: rgb(227, 28, 131);
        }

        .link:active {
            opacity: 50%;
            color: white;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        }

        .button:focus {
            outline: 0;
        }

        .X {
            background: none;
            color: black;
        }
    </style>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
    <%@ include file="bootstrap.jsp" %>
</body>

</html>