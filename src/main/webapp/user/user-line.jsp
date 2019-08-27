<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px;height:400px;"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));    // 必须通过js语法获取当前div进行初始化

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '上半年用户注册趋势',
            subtext: "折线图"
        },
        tooltip: {},  // 数据的提示
        legend: {
            data: ['男', "女", "小孩"]
        },
        xAxis: {
            data: ["当天", "前1天", "前2天", "前3天", "前4天"]
        },
        yAxis: {},
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    $.ajax({
        url: "${path}/userController/testline",
        datatype: "json",
        type: "post",
        success: function (da) {
            myChart.setOption({
                series: [{
                    name: '用户注册趋势',
                    type: 'line',//bar：柱状图  line:折线图     pie:饼图
                    data: da
                }]
            });
        }
    })


</script>
