<%--
  Created by IntelliJ IDEA.
  User: xrx
  Date: 2021/7/31
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="<%=basePath%>css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/admin.css">
    <link rel="stylesheet" href="css/app.css">
    <style>
        .admin-main{
            padding-top: 0px;
        }
    </style>
</head>
<body>
<div class="am-cf admin-main">
    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-g">

                <form action="toAddResult" class="am-form am-form-horizontal" method="post"
                      style="padding-top:30px;" data-am-validator>

<%--                    <div class="am-form-group">--%>
<%--                        <label class="am-u-sm-3 am-form-label">--%>
<%--                            产品编号 </label>--%>
<%--                        <div class="am-u-sm-9">--%>
<%--                            <input type="text" id="doc-vld-ctn-1" required placeholder="请输入产品编号"--%>
<%--                                   name="productId" > <small>输入产品编号</small>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="am-form-group">--%>
<%--                        <label class="am-u-sm-3 am-form-label">--%>
<%--                            用户编号 </label>--%>
<%--                        <div class="am-u-sm-9">--%>
<%--                            <input type="text" id="doc-vld-ctn-2" required placeholder="请输入用户编号"--%>
<%--                                   name="customerId"  data-equal-to="#doc-vld-ctn-2"  required> <small>输入用户编号</small>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            产品名称</label>
                        <div class="am-u-sm-9">
                            <select  id="productStatus" name="productName">
                                <c:forEach items="${ProductInfos}" var="item">
                                    <option>${item.productName}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>

<%--                    <div class="am-form-group">--%>
<%--                        <label class="am-u-sm-3 am-form-label">--%>
<%--                            产品名称 </label>--%>
<%--                        <div class="am-u-sm-9">--%>
<%--                            <input type="text" id="doc-vld-ctn-3" required placeholder="请输入产品名称"--%>
<%--                                   name="productName"  data-equal-to="#doc-vld-ctn-3"  required> <small>输入产品名称</small>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            用户名 </label>
                        <div class="am-u-sm-9">
                            <input type="text"  required placeholder="请输入用户名"
                                   name="customerName"  data-equal-to="#doc-vld-ctn-3"  required> <small>输入用户名</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            开始时间 </label>
                        <div class="am-u-sm-9">
                            <input type="date" id="doc-vld-ctn-4" required placeholder="请输入起始时间"
                                   name="startTime"  data-equal-to="#doc-vld-ctn-4"  required> <small>输入开始时间。</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            结束时间 </label>
                        <div class="am-u-sm-9">
                            <input type="date" id="doc-vld-ctn-5" required placeholder="选择结束时间"
                                   name="endTime"  data-equal-to="#doc-vld-ctn-5"  required> <small>选择结束时间。</small>
                        </div>
                    </div>

<%--                    <div class="am-form-group">--%>
<%--                        <label class="am-u-sm-3 am-form-label">--%>
<%--                            订单总金额 </label>--%>
<%--                        <div class="am-u-sm-9">--%>
<%--                            <input type="text " id="doc-vld-ctn-6" required placeholder="请输入租金金额"--%>
<%--                                   name="rentTotal"  data-equal-to="#doc-vld-ctn-6"  required><br> <small>输入订单总金额</small>--%>
<%--                        </div>--%>
<%--                    </div>--%>



                    <div class="am-form-group" >
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input type="submit" class="am-btn am-btn-success" value="保存" />
                            <a href="<%=basePath%>toOrderInfo?currentPage=1">
                                <input type="button" class="am-btn am-btn-success"  value="返回" />
                            </a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"
        src="assets/js/libs/jquery-1.10.2.min.js">
</script>
<script type="text/javascript" src="<%=basePath%>myplugs/js/plugs.js">
</script>
<script>
    var message="${Message}";
    if(message!=null&&message!=''&&message!=undefined&&message!='null'){
        alert(message);
    }
</script>
</body>
</html>
