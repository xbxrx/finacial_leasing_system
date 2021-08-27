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
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <title>产品类型统计</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
</head>
<body style="height: 100%; margin: 0">

<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品类型统计</strong><small></small></div>
    </div>
</div>
<hr>
<div class="am-u-sm-12 am-u-md-3">
    <div class="am-input-group am-input-group-sm">
        <input type="text" class="am-form-field" placeholder="请输入时间">
        <span class="am-input-group-btn">
        <button class="am-btn am-btn-default" type="button">搜索</button>
      </span>
    </div>
</div>
<hr>
<hr>
<hr>
<div id="container" style="height:60%"></div>

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



    option = {
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
        },
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '50%',
                data: [

                    {value: 1048, name: '搜索引擎'},
                    {value: 735, name: '直接访问'},
                    {value: 580, name: '邮件营销'},
                    {value: 484, name: '联盟广告'},
                    {value: 300, name: '视频广告'}
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

</script>
</body>
</html>
