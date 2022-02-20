<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Products</title>
    <script>
        function likeItem(productId) {
            $.ajax({
                    url: "/onlineDrawingShop/user/cart/likeItem?id=" + productId,
                    type: 'GET',
                    success: function() {
                        document.getElementById("white" + productId).style.display = "none";
                        document.getElementById("pink" + productId).style.display = "inline-block";
                    }
                });
        }

        function notLikeItem(productId) {
            $.ajax({
                    url: "/onlineDrawingShop/user/cart/notLikeItem?id=" + productId,
                    type: 'GET',
                    success: function() {
                        document.getElementById("white" + productId).style.display = "inline-block";
                        document.getElementById("pink" + productId).style.display = "none";
                    }
                });
        }

    </script>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbarUser.jsp" %>

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
                        <c:set var="liked" value="${likeOrNot[loop.index]}"></c:set>
                        <c:choose>
                            <c:when test="${liked==false}">
                                <button class="heartWhite" id="white${drawing.productId}" onclick='likeItem("${drawing.productId}")'>
                                    LIKE IT<img class="heartImg" src='<c:url value="/resources/icon/heartWhite.webp"/>'/>
                                </button>
                                <button class="heartPink" id="pink${drawing.productId}" style="display:none" onclick='notLikeItem("${drawing.productId}")'>
                                    LIKE IT<img class="heartImg" src='<c:url value="/resources/icon/heartPink.webp"/>'/>
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="heartWhite" id="white${drawing.productId}" style="display:none" onclick='likeItem("${drawing.productId}")'>
                                    LIKE IT<img class="heartImg" src='<c:url value="/resources/icon/heartWhite.webp"/>'/>
                                </button>
                                <button class="heartPink" id="pink${drawing.productId}" onclick='notLikeItem("${drawing.productId}")'>
                                    LIKE IT<img class="heartImg" src='<c:url value="/resources/icon/heartPink.webp"/>'/>
                                </button>
                            </c:otherwise>
                        </c:choose>
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