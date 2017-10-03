<%@ page language="java" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript">
        function addCategory() {
            window.location.href = "${pageContext.request.contextPath}/admin/category/add.jsp";
        }
        function confirmDel(cid) {
            if(confirm("确定要删除吗?")){
                location.href="${pageContext.request.contextPath}/admin.php?method=delCategoryById&cid="+cid;
            }
        }
    </script>
</HEAD>
<body>
<br>
<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3"><strong>分类列表</strong>
        </TD>
    </tr>
    <tr>
        <td class="ta_01" align="right">
            <button type="button" id="add" name="add" value="添加"
                    class="button_add" onclick="addCategory()">
                &#28155;&#21152;
            </button>

        </td>
    </tr>
    <tr>
        <td class="ta_01" align="center" bgColor="#f5fafe">
            <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                    <td align="center" width="18%">序号</td>
                    <td align="center" width="17%">分类名称</td>
                    <td width="7%" align="center">编辑</td>
                    <td width="7%" align="center">删除</td>
                </tr>
                <tr onmouseover="this.style.backgroundColor = 'white'"
                    onmouseout="this.style.backgroundColor = '#F5FAFE';">
                    <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                        width="18%">1
                    </td>
                    <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                        width="17%">手机数码
                    </td>
                    <td align="center" style="HEIGHT: 22px"><a
                            href="${ pageContext.request.contextPath }/admin/category/edit.jsp">
                        <img
                                src="${pageContext.request.contextPath}/images/i_edit.gif"
                                border="0" style="CURSOR: hand">
                    </a></td>

                    <td align="center" style="HEIGHT: 22px"><a
                            href="">
                        <img src="${pageContext.request.contextPath}/images/i_del.gif"
                             width="16" height="16" border="0" style="CURSOR: hand">
                    </a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script>
    $.ajax({
        asyn: false,
        url: "${pageContext.request.contextPath}/admin.php",
        data: {method: "findAllCategories"},
        type: "POST",
        success: function (data) {
            var string = "<tr style='FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3'><td align='center' width='18%'>序号</td><td align='center' width='17%'>分类名称</td><td width='7%' align='center'>编辑</td><td width='7%' align='center'>删除</td></tr>";
            for (var i = 0; i < data.length; i++) {
                string += "<tr onmouseover=\"this.style.backgroundColor = 'white'\" onmouseout=\"this.style.backgroundColor = '#F5FAFE';\">" +
                    "<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"18%\">" + (i+1) + "</td> " +
                    "<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"17%\">" + data[i].cname + "</td>" +
                    "<td align=\"center\" style=\"HEIGHT: 22px\"><a href=\"${ pageContext.request.contextPath }/admin.php?method=goCategoryEditPage&cid=" + data[i].cid + "\"><img src=\"${pageContext.request.contextPath}/images/i_edit.gif\" border=\"0\" style =\"CURSOR: hand\"></a></td>/ " +
                    "<td align=\"center\" style=\"HEIGHT: 22px\"><img onclick=\"confirmDel('" + data[i].cid + "')\" src=\"${pageContext.request.contextPath}/images/i_del.gif\" width=\"16\" height=\"16\" border=\"0\" style=\"CURSOR: hand\"></td >" +
                    "</tr> ";
            }
            $("#DataGrid1").html(string);
        },
        "error": function () {
            alert("服务器繁忙，请稍后重试");
        },
        "dataType": "json"
    });
</script>
</body>
</HTML>

