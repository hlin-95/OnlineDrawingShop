<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Products</title>
    <script>
        function likeItem(productId) {
            window.location.href = "/onlineDrawingShop/login";
        }
    </script>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

    <main>
        <h1 id="highlight">${category}</h1>
        <table class="productsForm">
            <c:forEach var="drawing" items="${products}" varStatus="loop">
            <tr>
                <td>
                    <div class="imageTitle"><c:out value="${drawing.productName}" /></div>
                    <div class="imageDescription"><c:out value="${drawing.description}"/></div><br>
                    <img class="image" src='<c:url value="${drawing.imageUrl}"/>'>

                    <div class="imageDescription"><br>
                        <button class="heartWhite" id="white${drawing.productId}" onclick='likeItem("${drawing.productId}")'>
                            LOGIN TO LIKE IT AND COLLECT IT
                        </button>
                    </div>
                </td>
            </tr>
            </c:forEach>
        </table>
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
            width: 65%;
            margin: 0 auto;
            font-family: 'Nunito Sans', sans-serif;
            font-size: 1em;
            color: black;
            margin-top: -3%;
            text-align: center;
        }

        td {
            border-right: none;
            border-left: none;
            padding-top: 5%;
            padding-bottom: 15%;
            font-weight: 300;
            font-size: 0.7em;
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
            width: 100%;
            border: 1px solid rgb(200, 200, 200);
        }

        .imageTitle {
            font-weight: 600;
            text-transform: uppercase;
            text-decoration: underline;
        }

        .imageDescription {
            text-transform: uppercase;
        }

        .imageTitle, .imageDescription {
            text-align: center;
        }

        .heartWhite, .heartPink {
            color: black;
            background-color: white;
            border: none;
        }

        .heartWhite:hover, .heartPink:hover {
            color: grey;
            text-decoration: none;
            cursor: pointer;
        }

        .heartWhite:hover img, .heartPink:hover img {
            opacity: 0.6;
        }

        .heartWhite:focus, .heartPink:focus{
            outline: 0;
        }

        .heartImg {
            width: 25px;
            padding-left:10%;
        }
    </style>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
    <%@ include file="bootstrap.jsp" %>
</body>

</html>