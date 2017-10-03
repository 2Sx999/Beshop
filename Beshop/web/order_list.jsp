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
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

    <style>
        .order_state {
            color: red;
        }
    </style>
</head>

<body>


<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <strong>我的订单</strong>
        <table class="table table-bordered">

            <c:forEach items="${pageBean.list}" var="order">
                <tr class="success">
                    <th colspan="5">订单编号:${order.oid}&nbsp;&nbsp;<span
                            class="order_state">${order.state==1?"已付款":"未付款"}</span></th>
                </tr>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <c:forEach items="${order.orderItemList}" var="orderItem">
                    <tr class="active">
                        <td style="vertical-align: middle;"><a target="_blank"
                                                               href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${orderItem.product.pid}">
                            <img src="${pageContext.request.contextPath}/${orderItem.product.pimage}"
                                 style="width:60px;height: 60px;"></a>
                        </td>
                        <td style="vertical-align: middle;"><a target="_blank"
                                                               href="${pageContext.request.contextPath}/productInfo.php?method=showProductInfo&pid=${orderItem.product.pid}">${orderItem.product.pname}</a>
                        </td>
                        <td style="vertical-align: middle;">￥${orderItem.product.shop_price}</td>
                        <td style="vertical-align: middle;">${orderItem.count}</td>
                        <td style="vertical-align: middle;"><span class="subtotal">￥${orderItem.subtotal}</span></td>
                    </tr>
                </c:forEach>
            </c:forEach>

        </table>
    </div>
    <!--分页 -->
    <div class="row">
        <nav aria-label="Page navigation" class="text-center">
            <ul class="pagination" style="text-align: center; margin-top: 10px;">
                <%--左箭头--%>
                <li><a
                        href="${pageContext.request.contextPath}/loginrequired/order.php?method=getMyOrders&currentPage=${pageBean.currentPage-1>1?pageBean.currentPage-1:1}"
                        aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span></a></li>

                <%--页码--%>
                <c:forEach begin="1" end="5" var="index">
                    <c:if test="${pageBean.currentPage-3+index>0&&pageBean.currentPage-3+index<=pageBean.totalPage}">
                        <li
                                <c:if test="${pageBean.currentPage-3+index==pageBean.currentPage}">class="active"</c:if> >
                            <a href="${pageContext.request.contextPath}/loginrequired/order.php?method=getMyOrders&currentPage=${pageBean.currentPage-3+index}">${pageBean.currentPage-3+index}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <%--右箭头--%>
                <li>
                    <a href="${pageContext.request.contextPath}/loginrequired/order.php?method=getMyOrders&currentPage=${pageBean.currentPage+1<=pageBean.totalPage?pageBean.currentPage+1:pageBean.totalPage}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>