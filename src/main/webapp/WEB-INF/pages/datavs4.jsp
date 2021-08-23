<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/8/17
  Time: 11:11
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
    <meta charset="utf-8">
    <title>用户消费统计</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
</head>
<body style="height: 80%; margin: 0">

<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户消费统计</strong><small></small></div>
    </div>
</div>
<hr>
<div class="am-u-sm-12 am-u-md-3">
    <div class="am-input-group am-input-group-sm">
        <input type="text" class="am-form-field" placeholder="请输入用户名称或用户ID">
        <span class="am-input-group-btn">
        <button class="am-btn am-btn-default" type="button">搜索</button>
      </span>
    </div>
</div>
<hr>
<hr>
<div id="container" style="height: 50%"></div>

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



    var base = +new Date(1988, 9, 3);
    var oneDay = 24 * 3600 * 1000;

    var data = [[base, Math.random() * 300]];

    for (var i = 1; i < 20000; i++) {
        var now = new Date(base += oneDay);
        data.push([
            [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
            Math.round((Math.random() - 0.5) * 20 + data[i - 1][1])
        ]);
    }

    option = {
        tooltip: {
            trigger: 'axis',
            position: function (pt) {
                return [pt[0], '10%'];
            }
        },
        toolbox: {
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'time',
            boundaryGap: false
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%']
        },
        dataZoom: [{
            type: 'inside',
            start: 0,
            end: 20
        }, {
            start: 0,
            end: 20
        }],
        series: [
            {
                name: '模拟数据',
                type: 'line',
                smooth: true,
                symbol: 'none',
                areaStyle: {},
                data: data
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

</script>
</body>
</html>
