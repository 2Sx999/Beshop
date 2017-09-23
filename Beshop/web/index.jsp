<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>XX商城</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/header.jsp"/>

<!--轮播图-->
<div class="container slider_container">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/f001a62f-a49d-4a4d-b56f-2b6908a0002c_g.jpg" alt="..." class="img-responsive">
                <div class="carousel-caption">
                    first
                </div>
            </div>
            <div class="item">
                <img src="img/f001a62f-a49d-4a4d-b56f-2b6908a0002c_g.jpg" alt="..." class="img-responsive">
                <div class="carousel-caption">
                    second
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<!--热门商品-->
<div class="container">
    <div class="row">
        <div class="col-md-2 col-xs-5">
            <h2>热门商品</h2>
        </div>
        <div class="col-md-2 col-xs-7">
            <img src="img/title2.jpg" class="category_title_img"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2  hidden-sm hidden-xs">
            <img class="img-responsive" src="img/big01.gif"/>
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-6">
                    <img src="img/middle01.jpg" class="img-responsive item_middle_img">
                </div>

                <c:forEach items="${hotList}" var="hotp" varStatus="varS" begin="0" end="2">
                    <div class="col-md-2 col-xs-6 <c:if test='${varS.index==2}'>hidden-xs hidden-sm</c:if>">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${hotp.pid}">
                                <img src="${pageContext.request.contextPath}/${hotp.pimage}" class="img-responsive"/>
                            </a>
                            <div class="caption">
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${hotp.pid}">${hotp.pname}</a>
                                </p>
                                <p class="text-center item_price">${hotp.shop_price}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach items="${hotList}" var="hotp" varStatus="varS" begin="3">
                    <div class="col-md-2 col-xs-6">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${hotp.pid}">
                                <img src="${pageContext.request.contextPath}/${hotp.pimage}" class="img-responsive"/>
                            </a>
                            <div class="caption">
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${hotp.pid}">${hotp.pname}</a>
                                </p>
                                <p class="text-center item_price">${hotp.shop_price}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!--中间的广告-->
<div class="container">
    <div class="row">
        <div class="col-md-12 hidden-sm hidden-xs">
            <img src="img/ad.jpg" class="img-responsive"/>
        </div>
    </div>
</div>
<!--最新商品-->
<div class="container">
    <div class="row">
        <div class="col-md-2 col-xs-5">
            <h2>最新商品</h2>
        </div>
        <div class="col-md-2 col-xs-7">
            <img src="img/title2.jpg" class="category_title_img"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2  hidden-sm hidden-xs">
            <img class="img-responsive" src="img/big01.gif"/>
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-6">
                    <img src="img/middle01.jpg" class="img-responsive item_middle_img">
                </div>


                <c:forEach items="${newList}" var="newp" varStatus="varS" begin="0" end="2">
                    <div class="col-md-2 col-xs-6 <c:if test='${varS.index==2}'>hidden-xs hidden-sm</c:if>">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${newp.pid}">
                                <img src="${pageContext.request.contextPath}/${newp.pimage}" class="img-responsive"/>
                            </a>
                            <div class="caption">
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${newp.pid}">${newp.pname}</a>
                                </p>
                                <p class="text-center item_price">${newp.shop_price}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach items="${newList}" var="newp" varStatus="varS" begin="3">
                    <div class="col-md-2 col-xs-6">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${newp.pid}">
                                <img src="${pageContext.request.contextPath}/${newp.pimage}" class="img-responsive"/>
                            </a>
                            <div class="caption">
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${newp.pid}">${newp.pname}</a>
                                </p>
                                <p class="text-center item_price">${newp.shop_price}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>