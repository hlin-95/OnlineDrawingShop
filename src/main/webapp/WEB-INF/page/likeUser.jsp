<!doctype html>
<html>

<head>
    <%@ include file="header.jsp" %>
    <title>LIN's | Products</title>
    <script>
        function notLikeItem(productId) {
            console.log(productId);
            $.ajax({
                    url: "/onlineDrawingShop/user/cart/notLikeItem?id=" + productId,
                    type: 'GET',
                    success: function() {
                        window.location.href = "/onlineDrawingShop/user/like?name=${currentUser}";
                    }
                });
        }

    </script>
</head>

<body>
    <!-- Navbar -->
    <%@ include file="navbarUser.jsp" %>

    <main>
        <h1 id="highlight">LIKE&nbsp(${number})</h1>
        <nav class="navbar navbar-light searchBlock">
          <form class="form-inline" style="margin: 0 auto;" action="/onlineDrawingShop/user/like">
            <input type="hidden" name="name" value="${currentUser}" />
            <select class="form-control mr-sm-2" name="targetCategory" id="searchDropdown" aria-label="Search">
                <option value="" disabled selected>Search by category</option>
                <c:forEach var="category" items="${categories}">
                <option value="${category}">${category}</option>
                </c:forEach>
            </select>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </nav>
        <table class="productsForm">
            <c:forEach var="drawing" items="${products}" varStatus="loop">
            <tr>
                <td>
                    <div><img class="heartImg" src='<c:url value="/resources/icon/heartPink.webp"/>'/></div><br>
                    <div class="imageTitle"><c:out value="${drawing.product.productName}" /></div>
                    <div class="imageDescription"><c:out value="${drawing.product.description}"/></div><br>
                    <div class="imageDescription">CATEGORY:&nbsp&nbsp<c:out value="${drawing.product.category}"/></div>
                    <div class="imageDescription">TIME ADDED:&nbsp&nbsp<c:out value="${drawing.time}"/></div><br>
                    <img class="image" src='<c:url value="${drawing.product.imageUrl}"/>'>
                    <button class="X" onclick='notLikeItem("${drawing.product.productId}")'><br>REMOVE IT<br>X
                    </button>
                </td>
            </tr>
            </c:forEach>
        </table>
    </main>

    <style>
        #navLinks #like {
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

        .searchBlock {
            margin-bottom: 5%;
            font-family: 'Nunito Sans', sans-serif;
        }

        option {
            font-family: 'Nunito Sans', sans-serif;
        }

        #searchDropdown {
            font-family: 'Nunito Sans', sans-serif;
            color: grey;
            text-align: left;
            width: 225px;
        }

        .form-control {
            font-size: 13px;
            height: 34px;
        }

        .btn {
            color: grey;
            border: 1px solid grey;
            font-size: 13px;
        }

        .btn:hover {
            color: black;
            background: rgb(235,235,235);
            border: 1px solid grey;
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
        }

        .X {
            background: none;
            color: black;
        }

        @media(max-width: 576px) {
            .searchBlock {
                display: none;
            }
        }

    </style>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
    <%@ include file="bootstrap.jsp" %>
</body>

</html>