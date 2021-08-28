<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/8/17
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html style="height: 80%">
<head>
    <title>产品销售统计</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/amazeui.min.css" />
</head>
<body style="height: 80%; margin: 0">
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品销售统计</strong><small></small></div>
    </div>
</div>
<hr>

<div class="am-g" >
</div>
<hr>
<%--<div class="am-u-sm-12 am-u-md-3">--%>
<%--    <div class="am-input-group am-input-group-sm">--%>
<%--        <input type="text" class="am-form-field" placeholder="请输入时间">--%>
<%--        <span class="am-input-group-btn">--%>
<%--        <button class="am-btn am-btn-default" type="submit">搜索</button>--%>
<%--      </span>--%>
<%--    </div>--%>
<%--</div>--%>
<hr>

<div id="container" style="height: 48%"></div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<!-- Uncomment this line if you want to dataTool extension
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/extension/dataTool.min.js"></script>
-->
<!-- Uncomment this line if you want to use gl extension
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl@2/dist/echarts-gl.min.js"></script>
-->
<!-- Uncomment this line if you want to echarts-stat extension
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat@latest/dist/ecStat.min.js"></script>
-->
<!-- Uncomment this line if you want to use map
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/map/js/china.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/map/js/world.js"></script>
-->
<!-- Uncomment these two lines if you want to use bmap extension
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=<Your Key Here>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/extension/bmap.min.js"></script>
-->

<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};

    var option;





    <%--<c:when test="${null != statistics}">--%>
    <%--    <c:forEach items="${statistics}" var="item">--%>
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['美颜服务系统', '网上考证','政府投诉','政府招标']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: ['销售金额']
        },
        series: [
            {
                name: '美颜服务系统',
                type: 'bar',
                data: [73080]
            },
            {
                name: '网上考证',
                type: 'bar',
                data: [69160]
            },
            {
                name: '政府投诉',
                type: 'bar',
                data: [63400]
            },
            {
                name: '政府招标',
                type: 'bar',
                data: [63080]
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }


</script>
</body>
</html>