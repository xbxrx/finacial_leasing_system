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
                <form action="resultUpdateProductInfo" class="am-form am-form-horizontal"
                      method="post"
                      style="padding-top:30px;" data-am-validator>

                    <input  name="productId" type="hidden"  value="${ProductInfo.productId}"/>
                    <input  name="productName" type="hidden"  value="${ProductInfo.productName}"/>
                    <input  name="productType" type="hidden"  value="${ProductInfo.productType}"/>



                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            修改产品状态</label>
                        <div class="am-u-sm-9">
                            <select id="productStatus" name="productStatus">
                                <option>待上架</option>
                                <option>已上架</option>
                            </select>
                            <small>请选择修改产品状态</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            修改产品价格</label>
                        <div class="am-u-sm-9">
                            <input type="text" value="${ProductInfo.productPrice}" id="doc-vld-pwd-2"
                                   name="productPrice"  data-equal-to="#doc-vld-pwd-1"  > <small>请输入修改价格</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            产品介绍 </label>
                        <div class="am-u-sm-9">
                                <textarea name="introduceContent"  placeholder="请输入产品介绍"
                                          data-equal-to="#doc-vld-ctn-3"
                                          rows="16"></textarea>
                            <small>输入产品介绍</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input type="submit" class="am-btn am-btn-success" onclick="update()" value="修改产品信息" />
                            <a href="productManager"> <input type="button" class="am-btn am-btn-success"  value="返回" /></a>
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

<script language="javascript">
    function update() {
        if (!confirm("确认要修改？")) {
            window.event.returnValue = false;
        }
    }
</script>
</body>
</html>
