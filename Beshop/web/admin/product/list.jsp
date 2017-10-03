<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/Style1.css"
          rel="stylesheet" type="text/css"/>
    <script language="javascript"
            src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript">
        function addProduct() {
            window.location.href = "${pageContext.request.contextPath}/admin/product/add.jsp";
        }
        function confirmDel(pid) {
            if (confirm("确定要删除吗?")) {
                location.href = "${pageContext.request.contextPath}/admin.php?method=delProductById&pid=" + pid;
            }
        }
    </script>
</HEAD>
<style>
    .pagenation {
        width: 958px;
        height: 40px;
        margin: 10px auto 0;
        font-size: 0;
        text-align: center;
    }

    .pagenation a {
        display: inline-block;
        padding: 5px 10px;
        font-size: 12px;
        font-family: 'Microsoft Yahei';
        text-decoration: none;
        margin: 8px 5px;
        color: #333;
    }

    .pagenation a:hover {
        color: red;
    }

    .pagenation span {
        display: inline-block;
        font-size: 12px;
    }
</style>
<body>
<br>
<form id="Form1" name="Form1"
      action="${pageContext.request.contextPath}/user/list.jsp"
      method="post">
    <table cellSpacing="1" cellPadding="0" width="100%" align="center"
           bgColor="#f5fafe" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
            </TD>
        </tr>
        <tr>
            <td class="ta_01" align="right">
                <button type="button" id="add" name="add" value="添加"
                        class="button_add" onclick="addProduct()">
                    &#28155;&#21152;
                </button>

            </td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                        <td align="center">编号</td>
                        <td align="center">商品图片</td>
                        <td align="center">商品名称</td>
                        <td align="center">商品类别</td>
                        <td align="center">商品价格</td>
                        <td align="center">是否热门</td>
                        <td align="center">编辑</td>
                        <td align="center">删除</td>
                    </tr>
                    <c:forEach items="${pageBean.list}" var="pro">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">${pro.pid}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">
                                <img src="${pageContext.request.contextPath}/${pro.pimage}"
                                     style="width:50px;height: 50px;"></td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">${pro.pname}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">${pro.category.cname}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">${pro.shop_price}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">${pro.is_hot==1?"是":"否"}</td>
                            <td align="center" style="HEIGHT: 22px"><a
                                    href="${ pageContext.request.contextPath }/admin.php?method=goProductEditPage&pid=${pro.pid}">
                                <img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0"
                                     style="CURSOR: hand;">
                            </a></td>

                            <td align="center" style="HEIGHT: 22px">
                                <img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16"
                                     border="0" style="CURSOR: hand" onclick="confirmDel('${pro.pid}')"></td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>

        </TBODY>
    </table>
</form>
<div class="pagenation">
    <c:if test="${pageBean.currentPage-1>0}">
        <a href="${ pageContext.request.contextPath }/admin.php?method=getProductsByPagination&currentPage=${pageBean.currentPage-1}">上一页</a>
    </c:if>
    <a href="javascript:void(0);">${pageBean.currentPage}</a>
    <c:if test="${pageBean.currentPage+1<=pageBean.totalPage}">
        <a href="${ pageContext.request.contextPath }/admin.php?method=getProductsByPagination&currentPage=${pageBean.currentPage+1}">下一页</a>
    </c:if>
</div>
</body>
</HTML>

