<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>${product.pname}</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <link href="css/register.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css"/>

    <style>
        .path {
            font-size: 16px;
            margin-bottom: 13px;
        }
    </style>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 path">
            <a href="./index.htm">首页</a>&nbsp;&nbsp;&gt;
            <a href="./蔬菜分类.htm">蔬菜</a>&nbsp;&nbsp;&gt;
            <a>无公害蔬菜</a>
        </div>

        <div class="col-md-4 col-md-offset-1">
            <img title="" class="img-responsive"
                 src="${pageContext.request.contextPath}/${product.pimage}">
        </div>

        <div class="col-md-6 col-md-offset-1">

            <div>
                <strong>${product.pname}</strong>
            </div>
            <div style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
                <div>编号：${product.pid}</div>
            </div>

            <div style="margin: 10px 0 10px 0;">
                本店价: <strong style="color: #ef0101;">￥：${product.shop_price}元/份</strong> 参 考 价：
                <del>￥${product.market_price}元/份</del>
            </div>

            <div style="margin: 10px 0 10px 0;">
                促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)"
                       style="background-color: #f07373;">限时抢购</a>
            </div>

            <div style="border-bottom: 1px solid #faeac7; margin-top: 15px; ">
                购买数量: <input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text">
            </div>

            <div style="border-bottom: 1px solid #faeac7; margin-top: 15px; ">
                <a href="cart.jsp">
                    <input style="background: url('./images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;"
                           value="加入购物车" type="button">
                </a>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <%--商品介绍--%>
    <div class="row">
        <div style="background-color: #d3d3d3;padding: 10px 10px;margin-top: 10px;margin-bottom: 10px"
             class="col-md-10 col-md-offset-1">
            <strong>商品介绍</strong>
        </div>

        <div class="col-md-10 col-md-offset-1">
            <img src="${pageContext.request.contextPath}/${product.pimage}" class="img-responsive">
        </div>
        <div class="col-md-10 col-md-offset-1" style="margin-top: 15px">
            <table class="table table-bordered">
                <tbody>
                <tr class="active">
                    <th colspan="2">基本参数</th>
                </tr>
                <tr>
                    <th width="10%">名称</th>
                    <td width="30%">${product.pname}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-bordered">
                <tbody>
                <tr class="active">
                    <th><strong>商品评论</strong></th>
                </tr>
                <tr class="warning">
                    <th>暂无商品评论信息 <a>[发表商品评论]</a></th>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="col-md-10 col-md-offset-1">
            <table class="table table-bordered">
                <tbody>
                <tr class="active">
                    <th><strong>商品咨询</strong></th>
                </tr>
                <tr class="warning">
                    <th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</div>


<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>