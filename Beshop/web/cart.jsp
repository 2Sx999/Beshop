<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>购物车</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <link href="css/register.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <style>
        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }

        em.price {
            color: red;
        }

        .price_container {
            font-size: 17px;
        }

        .jumbotron {
            background-color: rgba(51, 51, 51, 0);
        }
    </style>
    <script>
        //删除单个商品
        function checkDelete(pid) {
            if (confirm('是否删除此商品?')) {
                location.href = "${pageContext.request.contextPath}/productInfo.php?method=deleteFromCart&pid=" + pid;
            }
        }
        //删除所有商品
        function checkDeleteAll() {
            if (confirm('是否删除所有商品?')) {
                location.href = "${pageContext.request.contextPath}/productInfo.php?method=deleteAllFromCart";
            }
        }
    </script>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"/>

<div class="container">
    <c:if test="${!(sessionScope.cart.map==null||fn:length(sessionScope.cart.map)==0)}">
        <div class="row">
            <strong style="font-size:16px;margin:5px 0;">订单详情</strong>
            <table class="table table-bordered">
                <thead>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.cart.map}" var="entry">
                    <tr class="active">
                        <td>
                            <a href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${entry.value.product.pid}"
                               target="_blank">
                                <img src="${entry.value.product.pimage}" width="60" height="60" class="img-responsive">
                            </a>
                        </td>
                        <td style="vertical-align: middle;">
                            <a target="_blank"
                               href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${entry.value.product.pid}">
                                    ${entry.value.product.pname}
                            </a>
                        </td>
                        <td style="vertical-align: middle;">
                            ￥${entry.value.product.shop_price}
                        </td>
                        <td style="vertical-align: middle;">
                                ${entry.value.count}
                        </td>
                        <td style="vertical-align: middle;">
                            <span class="subtotal">￥${entry.value.subtotal}</span>
                        </td>
                        <td style="vertical-align: middle;">
                            <a href="#" onclick="checkDelete('${entry.value.product.pid}')" class="delete">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-9 price_container">
                <span>订单金额:<em class="price">${sessionScope.cart.total}元</em></span>
            </div>
        </div>
        <div class="row" style="margin-bottom: 20px">
            <div class="col-md-6 col-md-offset-6">
                <div class="col-md-3 col-md-offset-6" style="margin-top:10px">
                    <a class="btn btn-default btn-block" href="#" role="button" onclick="checkDeleteAll()"  >清空购物车</a>
                </div>
                <div class="col-md-3" style="margin-top:10px">
                    <a class="btn btn-danger btn-block" href="${pageContext.request.contextPath}/order.php?method=submitOrder" role="button">提交订单</a>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${sessionScope.cart.map==null||fn:length(sessionScope.cart.map)==0}">
        <div class="jumbotron">
            <h2>购物车空空如也,再逛逛看吧!</h2>

        </div>
    </c:if>


</div>

<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"/>

</body>

</html>