<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/8/18
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css" />
    <link rel="stylesheet" href="<%=basePath%>js/vendor/jgrowl/css/jquery.jgrowl.min.css">
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/component.css" />
    <!--[if IE]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <style>
        input::-webkit-input-placeholder{
            color:rgba(26, 53, 68, 0.726);
        }
        input::-moz-placeholder{   /* Mozilla Firefox 19+ */
            color:rgba(26, 53, 68, 0.726);
        }
        input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
            color:rgba(0, 0, 0, 0.726);
        }
        input:-ms-input-placeholder{  /* Internet Explorer 10-11 */
            color:rgba(0, 0, 0, 0.726);
        }
    </style>
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3><strong>华迪融资租赁管理后台登录</strong></h3>
                <form action="login" name="f" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input id="adminName" name="adminName" class="text" style="color: #000000 !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input id="adminPassword" name="adminPassword" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                    </div>
                    <div id="LOGIN" class="mb2"><input  type="submit" class="act-but submit"  style="color: #FFFFFF" value="登录" /></div>


<%--                    <input id="LOGIN" class="mb2" type="submit" class="act-but submit" style="color: #FFFFFF" value="登录" >--%>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="<%=basePath%>js/TweenLite.min.js"></script>
<script src="<%=basePath%>js/EasePack.min.js"></script>
<script src="<%=basePath%>js/jquery.js"></script>
<script src="<%=basePath%>js/rAF.js"></script>
<script src="<%=basePath%>js/demo-1.js"></script>
<script src="<%=basePath%>js/vendor/jgrowl/jquery.jgrowl.min.js"></script>
<script src="<%=basePath%>js/Longin.js"></script>
<div style="text-align:center;">
</div>
</body>
</html>
