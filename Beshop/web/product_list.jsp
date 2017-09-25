<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>会员登录</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <link href="css/register.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css"/>

    <style>
        .thumbnail p:nth-child(2) {
            color: red;
        }

        .thumbnail p:nth-child(1) {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .jumbotron {
            background-color: rgba(51, 51, 51, 0);
        }
    </style>
</head>

<body>


<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li class="active">${category.cname}</li>
            </ol>
        </div>
    </div>
    <%--商品列表--%>
    <div class="row">

        <c:forEach items="${pageBean.list}" var="pro" varStatus="varS">
        <div class="col-md-2 col-xs-6">
            <div class="thumbnail">
                <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${pro.pid}">
                    <img src="${pageContext.request.contextPath}/${pro.pimage}" class="img-responsive"
                         style="width: 100%"/>
                </a>
                <div class="caption">
                    <p class="text-center">
                        <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${pro.pid}">${pro.pname}</a>
                    </p>
                    <p class="text-center">${pro.shop_price}</p>
                </div>
            </div>
        </div>
        <c:if test="${varS.index==5}"></div>
    <div></c:if>
        </c:forEach>
        <c:if test="${fn:length(pageBean.list)==0}">
            <div class="jumbotron">
                <h2>暂时还没此类商品,再逛逛看吧!</h2>

            </div>
        </c:if>
    </div>
</div>


<!--商品浏览记录-->

<div class="container">
    <!--分页 -->
    <div class="row">
        <nav aria-label="Page navigation" class="text-center">
            <ul class="pagination" style="text-align: center; margin-top: 10px;">
                <%--左箭头--%>
                <li><a
                        href="${pageContext.request.contextPath}/productList.php?method=showProductsByCategory&cid=${category.cid}&currentPage=${pageBean.currentPage-1>1?pageBean.currentPage-1:1}"
                        aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span></a></li>

                <%--页码--%>
                <c:forEach items="${paginationList}" var="index">
                    <li
                            <c:if test="${index==pageBean.currentPage}">class="active"</c:if> >
                        <a href="${pageContext.request.contextPath}/productList.php?method=showProductsByCategory&cid=${category.cid}&currentPage=${index}">${index}</a>
                    </li>
                </c:forEach>

                <%--右箭头--%>
                <li>
                    <a href="${pageContext.request.contextPath}/productList.php?method=showProductsByCategory&cid=${category.cid}&currentPage=${pageBean.currentPage+1<=pageBean.totalPage?pageBean.currentPage+1:pageBean.totalPage}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">浏览记录</a></li>
            </ol>
        </div>
    </div>
    <div class="row">

        <c:forEach items="${historyList}" var="pro" varStatus="varS">
            <div class="col-md-2 col-xs-6">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${pro.pid}">
                        <img src="${pageContext.request.contextPath}/${pro.pimage}" class="img-responsive"
                             style="width: 100%"/>
                    </a>
                    <div class="caption">
                        <p class="text-center">
                            <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${pro.pid}">${pro.pname}</a>
                        </p>
                        <p class="text-center">${pro.shop_price}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>