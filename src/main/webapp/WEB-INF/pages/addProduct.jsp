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
                <form action="resultAddProductInfo" class="am-form am-form-horizontal"
                      method="post"
                      style="padding-top:30px;" data-am-validator>
                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            产品名称 </label>
                        <div class="am-u-sm-9">
                            <input type="text" required placeholder="请输入产品名称"
                                   name="productName">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            产品状态</label>
                        <div class="am-u-sm-9">
                            <select  id="productStatus" name="productStatus">
                                <option>已上架</option>
                                <option>待上架</option>
                            </select>
                        </div>
                    </div>


                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            产品类型</label>
                        <div class="am-u-sm-9">
                            <input type="text"  required placeholder="请输入产品类型"
                                   name="productType"  data-equal-to="#doc-vld-pwd-1" >
                        </div>
                    </div>


                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">
                            产品价格</label>
                        <div class="am-u-sm-9">
                            <input type="text"  required placeholder="请输入产品价格"
                                   name="productPrice"  data-equal-to="#doc-vld-pwd-1" >
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">
                            产品介绍 </label>
                        <div class="am-u-sm-9">
                                <textarea name="introduceContent"  placeholder="请输入产品介绍"
                                          data-equal-to="#doc-vld-ctn-3"
                                          rows="14"></textarea>
                            <small>输入产品介绍</small>
                        </div>
                    </div>





                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input type="submit" class="am-btn am-btn-success" value="保存"  />

                            <a href="productManager">
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
