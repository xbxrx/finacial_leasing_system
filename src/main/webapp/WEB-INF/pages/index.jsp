<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/8/13
  Time: 14:46
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>华迪融资租赁管理</title>
    <link rel="stylesheet" href="css/layui.css">
    <style type="text/css">
        .layui-layout-body .layui-layout.layui-layout-admin .layui-header .layui-logo2 {
            color: #06C;
            font-size: 24px;
            font-weight: bold;
            font-family: "Helvetica Neue", Helvetica, "PingFang SC", \5FAE\8F6F\96C5\9ED1, Tahoma, Arial, sans-serif;
        }
        .layui-layout-body .layui-layout.layui-layout-admin .layui-header .layui-logo strong {
            font-family: "Times New Roman", Times, serif;
        }
    </style>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">				<div class="layui-logo"><strong>华迪融资租赁管理系统</strong></div>

        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="images/1.gif" class="layui-nav-img"> 管理员
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="exit">退出</a>
            </li>
        </ul>
        <div align="center"></div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">基础管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="performance" target="right">后台主页</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>toMessageInfo" target="right">信息显示</a>
                        </dd>
                        <dd>
                            <a href="CustomerManager" target="right">客户管理</a>
                        </dd>

                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">

                    <a class="" href="javascript:;">租赁服务</a>
                    <dl class="layui-nav-child">

                        <dd>
                            <a href="productManager" target="right">产品管理</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>toOrderInfo" target="right">订单显示</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>toInvalidOrderInfo" target="right">失效订单</a>
                        </dd>


                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">数据统计</a>
                    <dl class="layui-nav-child">

                        <dd>
                            <a href="datavs3" target="right">产品销售统计</a>
                        </dd>
                        <dd>
                            <a href="datavs4" target="right">用户消费统计</a>
                        </dd>
                        <dd>
                            <a href="datavs2" target="right">产品类型统计</a>
                        </dd>


                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body" style="z-index: 0;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe src="" name="right" frameborder="0" width="100%" height="1200"></iframe>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="myplugs/js/plugs.js">
</script>
<script type="text/javascript">
    //添加编辑弹出层
    function updatePwd(title, id) {
        $.jq_Panel({
            title: title,
            iframeWidth: 500,
            iframeHeight: 300,
            url: "updatePwd.html"
        });
    }
</script>
<script src="js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function() {
        var element = layui.element;

    });
</script>
</body>


</html>
