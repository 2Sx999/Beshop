<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--顶部商标与用户信息-->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <!--60*60的商标-->
            <img src="img/yuan.gif" class="img-responsive mainicon"/>
            <ul class="user_info">
                <c:if test="${sessionScope.user==null}">
                    <li><a href="${pageContext.request.contextPath}/login.jsp">登陆</a></li>
                    <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart.jsp">购物车</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <li><a href="${pageContext.request.contextPath}/index.php" style="color: red">欢迎,${sessionScope.user.username}</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart.jsp">购物车</a></li>
                    <li><a href="${pageContext.request.contextPath}/loginandlogout.php?method=logout">退出</a></li>

                </c:if>
            </ul>
        </div>
    </div>
</div>
<!--导航条-->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.php">首页</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

            </ul>
            <script>
                $.ajax({
                    asyn:false,
                    url: "${pageContext.request.contextPath}/category.php",
                    data: {method: "showHeaderCategories"},
                    type: "POST",
                    success: function (data) {
                        var string = "";
                        for (var i = 0; i < data.length; i++) {
                            string += "<li><a href='${pageContext.request.contextPath}/productList.php?method=showProductsByCategory&cid=" + data[i].cid + "'>" + data[i].cname + "</a></li>";
                        }
                        $(".navbar ul").html(string);
                    },
                    "error": function () {
                        alert("服务器繁忙，请稍后重试");
                    },
                    "dataType": "json"
                });
            </script>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="请输入需要查找的商品">
                        <span class="input-group-btn">
                            <button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>
            </form>
        </div>
    </div>
</nav>