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
    <style>
        .jumbotron {
            background-color: rgba(51, 51, 51, 0);
        }
    </style>
</head>
<body>
<jsp:include page="/header.jsp"/>

<div class="container">

    <div class="jumbotron">
        <h2>找不到您所访问的页面!</h2>

    </div>
</div>


<jsp:include page="/footer.jsp"/>
</body>
</html>