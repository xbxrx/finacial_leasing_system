<%--
  Created by IntelliJ IDEA.
  User: xrx
  Date: 2021/7/31
  Time: 9:05
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
    <link rel="stylesheet" href="<%=basePath%>css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>css/app.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/xwlrbh/HandyEditor@1.6.7/HandyEditor.min.js"></script>
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
                    <form action="toAddMessageResult" class="am-form am-form-horizontal" method="post"
                          enctype="multipart/form-data" style="padding-top:30px;" data-am-validator >


                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">
                                标题 </label>
                            <div class="am-u-sm-9">
                                <input type="text" id="doc-vld-ctn-1" required placeholder="请输入标题"
                                       name="messageTitle"> <small>输入标题</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">
                                作者 </label>
                            <div class="am-u-sm-9">
                                <input type="text" id="doc-vld-ctn-2" required placeholder="请输入作者姓名"
                                       name="authorName"  data-equal-to="#doc-vld-ctn-2"  required> <small>输入作者姓名</small>
                            </div>
                        </div>


                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">
                                主体内容 </label>
                            <div class="am-u-sm-9">
                                <textarea name="productContent" id="productContent" placeholder="请输入主体内容"
                                          data-equal-to="#doc-vld-ctn-3" style="display: none;"
                                rows="16"></textarea>
                                <small>输入主体内容</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">
                                上传图片 </label>
                            <div class="am-u-sm-9">
                                <input type="file" name="myfile" multiple="multiple" />
                            </div>
                        </div>


                        <div class="am-form-group" >
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <input type="submit" id="submit" name="submit" class="am-btn am-btn-success" value="保存" />
                                <a href="<%=basePath%>toMessageInfo">
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
            src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="<%=basePath%>myplugs/js/plugs.js">
    </script>

    <script>
        var he = HE.getEditor('productContent');

    </script>
    <script>
        $("#submit").click(function () {
            he.sync();
        })
    </script>
</body>
</html>
