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

<hr>
<hr>
<hr>
<div id="container" style="height:60%">

</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>


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


                    {value: 335090, name: '技术'},
                    {value: 58980, name: '教育'},
                    {value: 175470, name: '生活'},
                    {value: 95740, name: '工作'},
                    {value: 41330, name: '政府'}
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
