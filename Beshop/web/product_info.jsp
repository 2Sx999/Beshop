<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>${product.pname}</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

    <style>
        .path {
            font-size: 16px;
        }
    </style>
    <script>
        $(function () {
            $("#form").validate({
                rules: {
                    quantity: {
                        required: true,
                        range: [1, 99]
                    }
                },
                messages: {
                    quantity: {
                        required: "数量不能为空",
                        range: "只能购买1到99的数量"
                    }
                },
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent());
                    $(error).css({color: "red"});
                }
            });
        });

    </script>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>

<div class="container">
    <div class="row">

        <div class="row">
            <div class="col-md-10 col-md-offset-1 path">
                <ol class="breadcrumb">
                    <li><a href="#">首页</a></li>
                    <li><a href="#">蔬菜</a></li>
                </ol>
            </div>
        </div>


        <div class="col-md-4 col-md-offset-1">
            <img title="" class="img-responsive"
                 src="${pageContext.request.contextPath}/${product.pimage}">
        </div>

        <div class="col-md-4 col-md-offset-1">

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
            <form action="${pageContext.request.contextPath}/productInfo.php?method=addToCart" method="post"
                  id="form">
                <div style="border-bottom: 1px solid #faeac7; margin-top: 15px; ">
                    购买数量: <input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text">
                </div>
                <input type="hidden" name="pid" value="${product.pid}">
                <div style="border-bottom: 1px solid #faeac7; margin-top: 15px; ">
                    <input class="btn btn-danger" type="submit" value="添加到购物车">
                </div>
            </form>
        </div>
    </div>
    <div class="clear"></div>
    <%--商品介绍--%>
    <div class="row">
        <div class="row">
            <div class="col-md-10 col-md-offset-1" style="margin-top: 10px">
                <ol class="breadcrumb">
                    <li><a href="#">商品介绍</a></li>
                </ol>
            </div>
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