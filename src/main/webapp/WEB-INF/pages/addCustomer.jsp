<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/8/13
  Time: 14:19
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
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/admin.css">
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
                <form action="resultAddCustomerInfo" class="am-form am-form-horizontal"
                      method="post"
                      style="padding-top:30px;" data-am-validator>
                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            客户姓名 </label>
                        <div class="am-u-sm-9">
                            <input type="text" required placeholder="请输入客户姓名"
                                   name="customerName">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            登录密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" name="customerPassword" required placeholder="请输入登录密码" >
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            客户电话</label>
                        <div class="am-u-sm-9">
                            <input type="text" name="customerPhone" required placeholder="请输入电话号码" >
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            客户邮箱</label>
                        <div class="am-u-sm-9">
                            <input type="email" name="customerMail" required placeholder="请输入邮箱" >
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            客户消费</label>
                        <div class="am-u-sm-9">
                            <input type="text" name="consumeTotal" required placeholder="消费总额" >
                        </div>
                    </div>


                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input type="submit" class="am-btn am-btn-success" value="保存"  />
                            <a href="CustomerManager?currentPage=1">
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
<script type="text/javascript" src="myplugs/js/plugs.js">
</script>


</body>
</html>
