<%--
  Created by IntelliJ IDEA.
  User: xrx
  Date: 2021/8/19
  Time: 17:07
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
    <link rel="stylesheet" href="<%=basePath%>css/news.css" />
    <link rel="stylesheet" href="<%=basePath%>css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/admin.css" />
    <script src="https://cdn.jsdelivr.net/gh/xwlrbh/HandyEditor@1.6.7/HandyEditor.min.js"></script>
</head>
<body>
<a href="<%=basePath%>toMessageInfo">
    <input type="button" class="am-btn am-btn-success"  value="返回" />
</a>
<div class="main-content w1240" align="center">
    <h1 class="main-title">${messageInfo.messageTitle}</h1>
    创作时间：<span class="date" >${messageInfo.publishTime}</span>
    作者：<span target="_blank" class="source" data-sudaclick="content_media_p" rel="nofollow" style="margin-left: 24px">${messageInfo.authorName}</span>
</div>
<div class="top-bar-wrap" id="top_bar_wrap">

    <div class="top-bar ani" id="top_bar" data-isfix="0">
        <div class="top-bar-inner clearfix">

        </div>
        <b align="left">正文：<font size="6">${messageInfo.productContent}</font>
        </b>
        <p align="center"><img src=${messageInfo.img} width="350px" height="400px"></p>
    </div>

</div>


</body>
</html>
