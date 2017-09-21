<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <link href="css/register.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:include page="/header.jsp"/>
<!--注册表单-->
<div class="container-fluid form_big_container">
    <div class="container ">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 form_container">
                <form class="form-horizontal register_form" id="register_form">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <h1>用户登陆
                                <small>User login</small>
                            </h1>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名<span
                                class="required_star">*</span></label>
                        <div class="col-sm-10">
                            <input class="form-control" id="username" placeholder="请输入用户名" name="username">
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
                        <label for="captcha" class="col-sm-2 control-label">验证码<span
                                class="required_star">*</span></label>
                        <div class="col-sm-8">
                            <input class="form-control" id="captcha" placeholder="请输入验证码" name="captcha">
                        </div>
                        <div class="col-sm-2">
                            <img src="img/yanzhengma.png" class="img-responsive captcha_img"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-default btn-block">登陆</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <a class="btn btn-primary btn-block" href="register.html" role="button">没有账号?快速注册!</a>
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