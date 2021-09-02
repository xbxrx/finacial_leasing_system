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
</head>
<body>
<a href="<%=basePath%>productManager">
    <input type="button" class="am-btn am-btn-success"  value="返回" />
</a>
<div class="main-content w1240">
    <h1 class="main-title">${productInfo.productName}</h1>

</div>
<div class="top-bar-wrap" id="top_bar_wrap">
    <div class="top-bar ani" id="top_bar" data-isfix="0">
        <div class="top-bar-inner clearfix">
            <div class="second-title">${productInfo.productName}</div>
            <div class="date-source" data-sudaclick="share_1-0">
                <span class="date">${productInfo.productStatus}</span>
                <span target="_blank" class="source" data-sudaclick="content_media_p" rel="nofollow" style="margin-left: 24px">${productInfo.productType}</span>
            </div>
        </div>
    </div>
</div>


<p>${productInfo.introduceContent}</p>



</body>
</html>
