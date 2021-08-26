
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
    <style>
        #moneydate {
            position: relative;
        }
        #moneydateAA {
            position: absolute;
            top: 57%;
            right: 120px;
            border: 5px solid;
            border-color: #0e90d2 transparent  transparent  transparent;
        }
        #moneydateBB {
            position: absolute;
            top: 25%;
            right: 120px;
            border: 5px solid;
            border-color: transparent transparent  #0e90d2  transparent;
        }
        #moneydateAA:hover {
            border-color: red transparent  transparent  transparent;
        }
        #moneydateBB:hover {
            border-color: transparent transparent  red  transparent;
        }
    </style>
</head>
<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品管理</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span>
                        <a href="addProductInfo">产品添加</a> </button>
                </div>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">

        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <div class="am-input-group am-input-group-sm">
                <form action="queryProductInfo" method="post" class="am-input-group am-input-group-sm" >
                    <input type="text" class="am-form-field" id="ProductName" name="productName" placeholder="请输入想要查看产品关键字">
                    <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="submit" >搜索</button>
          </span>
                </form>
            </div>
        </div>
    </div>
    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>

                    <tr>
                        <th class="table-check"><input type="checkbox"></th>
                        <th class="table-id">编号</th>
                        <th class="table-title">产品名称</th>
                        <th class="table-type">产品状态</th>
                        <th class="table-author am-hide-sm-only">产品类型</th>
                        <th class="table-date am-hide-sm-only" id="moneydate">产品价格
                          <a href="queryAllProductInfoByDesc" > <div  id="moneydateAA"> </div></a>
                            <a href="queryAllProductInfoByAsc" > <div  id="moneydateBB"> </div></a>
                        </th>

                        <th class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${ProductInfoList}" var="item">


                    <tr>
                        <td><input type="checkbox"></td>
                        <td>${item.productId}</td>
                        <td>
                            <a href="toQueryByProductId?productId=${item.productId}">${item.productName}</a>
                        </td>
                        <td>${item.productStatus}</td>
                        <td class="am-hide-sm-only">${item.productType}</td>
                        <td >${item.productPrice}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span>
                                        <a href="updateProductInfo?productId=${item.productId}">编辑</a></button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="del()">
                                        <span class="am-icon-trash-o">
                                            <a href="deleteProductInfo?productId=${item.productId}">删除</a>
                                        </span>
                                    </button>

                                </div>
                            </div>
                        </td>
                    </tr>

                    </c:forEach>

                    </tbody>
                </table>
                <div class="am-cf">
                    共 ${ProductInfoList.size()} 条记录
                    <div class="am-fr">
                        <ul class="am-pagination">
                            <li><a href="#">«</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">»</a></li>
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


</body>
</html>
