<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xrx
  Date: 2021/7/31
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    System.out.println("basePath:  "+basePath);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/admin.css" />
</head>

<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">失效订单</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-3">
            <button class="am-btn am-btn-default" onclick="fun()" style="width: 86px;margin-left: 10px" >批量删除</button>
        </div>

    </div>
    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form" action="deleteSelectedInvalidOrderInfo" id="Form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-check"><input type="checkbox"></th>
                        <th>订单编号</th>
                        <th>产品编号</th>
                        <th>用户编号</th>
                        <th>产品名称</th>
                        <th>用户名</th>
                        <th class="am-hide-sm-only">开始时间</th>
                        <th class="am-hide-sm-only">结束日期</th>
                        <th class="am-hide-sm-only">订单总金额</th>
                        <th class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${null != orderInfos}">
                        <c:forEach items="${orderInfos}" var="item">
                            <tr>
                                <td><input type="checkbox" name="ids" value="${item.orderId}"></td>
                                <td>${item.orderId}</td>
                                <td>
                                    ${item.productId}
                                </td>
                                <td>${item.customerId}</td>
                                <td>
                                    <a href="#">${item.productName}</a>
                                </td>
                                <td class="am-hide-sm-only">
                                    <a href="#">${item.customerName}</a>
                                </td>
                                <td class="am-hide-sm-only">
                                        ${item.startTime}</td>
                                <td class="am-hide-sm-only">${item.endTime}</td>
                                <td class="am-hide-sm-only">${item.rentTotal}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="del()">
                                                <span class="am-icon-trash-o">
                                                    <a href="<%=basePath%>toDeleteOrder?orderId=${item.orderId}">删除</a>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                    <tr class="last">
                        <td colspan="3" style="text-align:center;">未查询到相关信息</td>
                    <tr>
                        </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="am-cf">
                    共 ${orderInfos.size()} 条记录
                    <div class="am-fr">
                        <ul class="am-pagination">
                            <li class="am-disabled">
                                <a href="#">«</a>
                            </li>
                            <li class="am-active">
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">5</a>
                            </li>
                            <li>
                                <a href="#">»</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <hr>
            </form>
        </div>
    </div>
</div>

<script language="javascript">
    function del() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }

    function fun() {
        if (confirm("确认要删除选中条数？")) {
            var flag=false;
            var name = document.getElementsByName("ids");
            for (var i = 0; i < name.length; i++) {
                if(name[i].checked){
                    //有一个条目选中了
                    flag=true;
                    break;
                }
            }
            if (flag){//有删除的条目被选中需要删除
                //提交表单

                document.getElementById("Form").submit();
            }
        }
    }

    var message="${Message}";
    if(message!=null&&message!=''&&message!=undefined&&message!='null'){
        alert(message);
    }
</script>


</body>
</html>
