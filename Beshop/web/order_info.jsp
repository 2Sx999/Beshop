<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        @media (min-width: 768px) {
            .form-horizontal .control-label {
                padding-top: 7px;
                margin-bottom: 0;
                text-align: left;
            }
        }
    </style>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <strong>订单详情</strong>
        <table class="table table-bordered">
            <tbody>
            <tr class="warning">
                <th colspan="5">订单编号:${order.oid}</th>
            </tr>
            <tr class="warning">
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
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
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div style="text-align: right; margin-right: 120px;">
            商品金额: <strong style="color: #ff6600;">${sessionScope.cart.total}元</strong>
        </div>

    </div>
    <hr/>
    <%--订单信息--%>
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/order.php?method=confirmOrder" method="post">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">地址</label>
                    <div class="col-md-10">
                        <input class="form-control" id="inputEmail3" placeholder="请输入收货地址" name="address">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">收货人</label>
                    <div class="col-md-10">
                        <input class="form-control" id="inputPassword3" placeholder="请输收货人" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword2" class="col-sm-2 control-label">电话</label>
                    <div class="col-md-10">
                        <input class="form-control" id="inputPassword2" placeholder="电话" name="telephone">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-2 control-label">选择银行</label>
                    <div class="col-md-5">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" checked="checked">
                                招商银行
                                <img src="./bank_img/cmb.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"> 工商银行<img
                                    src="./bank_img/icbc.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"> 中国银行<img
                                    src="./bank_img/bc.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"> 农业银行
                                <img src="./bank_img/abc.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C">交通银行 <img src="./bank_img/bcc.bmp"
                                                                                                   align="middle"/>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="PINGANBANK-NET">平安银行
                                <img src="./bank_img/pingan.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"> 建设银行 <img
                                    src="./bank_img/ccb.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="pd_FrpId" value="CEB-NET-B2C">光大银行 <img
                                    src="./bank_img/guangda.bmp" align="middle"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-9 col-md-3">
                        <button type="submit" class="btn btn-danger btn-block">确认订单</button>
                    </div>
                </div>
                <input type="hidden" value="${order.oid}" name="oid">
            </form>
        </div>
    </div>


</div>

<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>