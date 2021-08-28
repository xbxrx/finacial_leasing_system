<%--
  Created by IntelliJ IDEA.
  User: xrx
  Date: 2021/8/19
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">新闻信息管理</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default">
                        <span class="am-icon-plus">
                            <a href="<%=basePath%>toAddMessage">新增</a>
                        </span>
                    </button>
                    <button class="am-btn am-btn-default" onclick="fun()" style="width: 86px;margin-left: 10px">批量删除</button>
                </div>
            </div>
        </div>

        <div class="am-u-sm-12 am-u-md-3">

        </div>
        <form action="toQueryMessage">
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" class="am-form-field" placeholder="请输入标题关键字" name="messageTitle">
                    <span class="am-input-group-btn">
                    <button class="am-btn am-btn-default" type="submit" >查询</button>
                </span>
                </div>
            </div>
        </form>

    </div>
    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form" action="batchDeleteMessageInfo" id="Form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-check"><input type="checkbox"></th>
                        <th style="width: 300px">标题</th>
                        <th style="width: 150px">作者</th>
                        <th style="width: 200px">发布时间</th>
                        <th class="table-set" style="width: 150px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${null != messageInfos}">
                        <c:forEach items="${messageInfos}" var="item">
                            <tr>
                                <td><input type="checkbox" name="ids" value="${item.messageId}"></td>
                                <td>
                                    <a href="toQueryByMessageId?messageId=${item.messageId}">${item.messageTitle}</a>
                                </td>
                                <td>${item.authorName}</td>
                                <td>${item.publishTime}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button  class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                                <span class="am-icon-pencil-square-o" >
                                                    <a href="<%=basePath%>toUpdateMessage?messageId=${item.messageId}">编辑</a>
                                                </span>
                                            </button>

                                            <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="del()">
                                                <span class="am-icon-trash-o">
                                                    <a href="<%=basePath%>toDeleteMessage?messageId=${item.messageId}">删除</a>
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
                        <td colspan="3" style="text-align:center;"></td>
                    <tr>
                        </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="am-cf" style="margin-top: 100px">
                    共 ${messageInfos.size()} 条记录
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
</script>

<script language="javascript">
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
                // document.getElementById("Form").action="deleteSelectedProductInfo";
                document.getElementById("Form").submit();
            }
        }
    }
</script>

<script>
    var message="${Message}";
    if(message!=null&&message!=''&&message!=undefined&&message!='null'){
        alert(message);
    }


</script>
</body>
</html>

