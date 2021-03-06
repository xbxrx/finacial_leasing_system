
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/8/13
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/admin.css" />
</head>
<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span>
                        <a href="addCustomerInfo">客户添加</a>
                    </button>
                    <button class="am-btn am-btn-default" onclick="fun()" style="width: 86px;margin-left: 10px" >批量删除</button>
                </div>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">

        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <div class="am-input-group am-input-group-sm">

                <form action="queryCustomerInfoByName" method="post" class="am-input-group am-input-group-sm" >
                    <input type="text" class="am-form-field" id="customerName" name="customerName" placeholder="请输入客户姓名">
                    <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="submit" >搜索</button>
          </span>
                </form>
            </div>
        </div>
    </div>
    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form" action="" method="post" id="Form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>

                    <tr>
                        <th class="table-check"><input type="checkbox" ></th>
                        <th class="table-id" style="width: 150px">客户编号</th>
                        <th class="table-title" style="width: 150px">客户名</th>
                        <th class="table-type" style="width: 150px">客户电话</th>
                        <th class="table-date am-hide-sm-only" style="width: 150px">客户邮件</th>
                        <th class="table-date am-hide-sm-only"style="width: 200px">创建时间</th>
                        <th class="table-date am-hide-sm-only"style="width: 150px">消费总额</th>
                        <th class="table-date am-hide-sm-only"style="width: 150px">操作</th>

                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${CustomerInfoList}" var="item">
                    <tr>
                        <td><input type="checkbox" id="ids" value="${item.customerId}" name="ids"></td>
                        <td>${item.customerId}</td>
                        <td>${item.customerName}</td>
                        <td>${item.customerPhone}</td>
                        <td class="am-hide-sm-only">${item.customerMail}</td>
                        <td class="am-hide-sm-only">${item.createTime}</td>
                        <td class="am-hide-sm-only">${item.consumeTotal}</td>
                        <td>
                            <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteInfo()">
                                        <span class="am-icon-trash-o">
                                            <a href="deleteCustomerInfo?customerId=${item.customerId}">删除</a>
                                        </span>
                            </button>
                        </td>
                    </tr>

                    </c:forEach>

                    </tbody>
                </table>
                <div class="am-cf">
                    共 ${CustomerInfoList.size()} 条记录
                    <div class="am-fr">
                        <ul class="am-pagination">
                            <li><a href="CustomerManager?currentPage=1">1</a></li>
                            <li><a href="CustomerManager?currentPage=2">2</a></li>
                            <li><a href="CustomerManager?currentPage=3">3</a></li>
                            <li><a href="CustomerManager?currentPage=4">4</a></li>

                            <div class="am-u-sm-12 am-u-md-3" style="display: flex; justify-content: flex-end">
                                <div class="am-input-group am-input-group-sm">
                                    <input type="text" class="am-form-field" name="currentPage" id="amLL"style="width: 60px">
                                    <span class="am-input-group-btn">
                                        <input type="button" onclick="toManager()" value="跳转" class="am-btn am-btn-default">
                                    </span>
                                </div>
                            </div>
                        </ul>
                    </div>
                </div>
                <hr>
            </form>
        </div>
    </div>
</div>
<script language="javascript">
    function deleteInfo() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }

    function toManager(){
        document.getElementById('Form').action="CustomerManager";
        localStorage.setItem("amLL", document.querySelector("#amLL").value);
        document.getElementById('Form').submit();
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
                document.getElementById("Form").action="deleteSelectedCustomerInfo";
                localStorage.setItem("ids", document.querySelector("#ids").value);
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
