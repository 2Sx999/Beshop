<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script>
        $(function () {
            //点击验证码时,刷新图片
            $(".captcha_img").click(function () {
                $(this).attr("src","${pageContext.request.contextPath}/loginandlogout.php?method=getCaptchaImg&date"+new Date());
            });
            //用户输入验证码时,清除错误提示
            $("#captcha").focus(function () {
                $("#captchaError").html("");
            });
            //验证表单
            $("#register_form").validate({
                rules: {
                    username: {
                        required: true,
                        rangelength: [3, 12]
                    },
                    password: {
                        required: true,
                        minlength: 4
                    },
                    ckpassword: {
                        required: true,
                        equalTo: "#password"
                    },
                    email: {
                        required: true,
                        email: true,
                    },
                    name: {
                        required: true,
                        rangelength: [3, 12]
                    },
                    sex: {
                        required: true,
                    },
                    birthday: {
                        required: true,
                    },
                    captcha: {
                        required: true,
                    }

                },
                messages: {
                    username: {
                        required: "用户名不能为空",
                        rangelength: "用户名长度必须在3到12之间"
                    },
                    password: {
                        required: "密码不能为空",
                        minlength: "密码长度必须大于4"
                    },
                    ckpassword: {
                        required: "请再次输入密码",
                        equalTo: "密码必须相同"
                    },
                    email: {
                        required: "邮箱不能为空",
                        email: "请输入正确的邮箱"
                    },
                    name: {
                        required: "昵称不能为空",
                        rangelength: "昵称长度必须在3到12之间"
                    },
                    sex: {
                        required: "请选择性别"
                    },
                    birthday: {
                        required: "请输入生日"
                    },
                    captcha: {
                        required: "请输入验证码",
                    }
                },
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent());
                    $(error).css({color: "red"});
                },
                submitHandler: function (form) {
                    var val = $("#username").val();
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/register.php",
                        data: {method: "checkUserName", username: val},
                        type: "POST",
                        dataType: "json",
                        success: function (data) {
                            if (!data.isExist) {
                                form.submit();
                            } else {
                                $("#usernameExisted").html("用户名已存在");
                            }
                        }
                    });
                }
            });
            //判断用户名是否曾在
            $("#username").blur(function () {
                var val = $("#username").val();
                $.ajax({
                    async: true,
                    url: "${pageContext.request.contextPath}/register.php",
                    data: {method: "checkUserName", username: val},
                    type: "POST",
                    dataType: "json",
                    success: function (data) {
                        if (!data.isExist) {
                            $("#usernameExisted").html("");
                        } else {
                            $("#usernameExisted").html("用户名已存在");
                        }
                    }
                });
            });

        });


    </script>
</head>

<body>
<jsp:include page="/header.jsp"/>

<!--注册表单-->
<div class="container-fluid form_big_container">
    <div class="container ">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 form_container">
                <form class="form-horizontal register_form" id="register_form"
                      action="${pageContext.request.contextPath}/register.php?method=register" method="post">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <h1>用户注册
                                <small>User register</small>
                            </h1>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input class="form-control" id="username" placeholder="请输入用户名" name="username" value="${requestScope.user.username}">
                            <span style="color: red;font-weight: bold" id="usernameExisted"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="请输入密码"
                                   name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ckpassword" class="col-sm-2 control-label">确认密码<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="ckpassword" placeholder="请再次输入密码"
                                   name="ckpassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input class="form-control" id="email" placeholder="请输入邮箱" name="email" value="${requestScope.user.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">昵称<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input class="form-control" id="name" placeholder="请输入昵称" name="name" value="${requestScope.user.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别<span class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="male" value="male" <c:if test="${requestScope.user.sex=='male'}">checked</c:if>> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="female" value="female" <c:if test="${requestScope.user.sex=='female'}">checked</c:if>> 女
                            </label>
                            <label class="error radio-inline" for="sex" style="color: red;font-weight: bold"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">出生日期<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input class="form-control" id="birthday" placeholder="请选择出生日期" name="birthday" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="captcha" class="col-sm-2 control-label">验证码<span
                                class="required_star">*</span></label>
                        <div class="col-sm-7">
                            <input class="form-control" id="captcha" placeholder="请输入验证码" name="captcha">
                            <span style="color: red;font-weight: bold" id="captchaError">${wrongCaptchaException}</span>
                        </div>
                        <div class="col-sm-3">
                            <img src="${pageContext.request.contextPath}/loginandlogout.php?method=getCaptchaImg" alt="验证码" class="img-responsive captcha_img"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-default btn-block">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/footer.jsp"/>
</body>
</html>