<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--引入bootstrap的样式--%>
    <link rel="stylesheet" href="../statics/boot/css/bootstrap.min.css">
    <%--引入bootstrap和jqgrid的整合样式--%>
    <link rel="stylesheet" href="../statics/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">

    <%--引入js文件--%>
    <script src="../statics/boot/js/jquery-2.2.1.min.js"></script>
    <%--引入bootstrap的js文件--%>
    <script src="../statics/boot/js/bootstrap.min.js"></script>

    <%--引入jqgrid的js文件--%>
    <script src="../statics/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="../statics/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <script src="../statics/jqgrid/js/ajaxfileupload.js"></script>

    <%--引入kindeditor的js文件--%>
    <script charset="utf-8" src="../kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="../kindeditor/lang/zh-CN.js"></script>

    <script src="../echarts/echarts.min.js"></script>
    <script src="​ http://cdn-hangzhou.goeasy.io /goeasy.js​ "></script>
    <script src="../echarts/china.js"></script>

    <title>持明法洲后台管理系统</title>
</head>
<body>


<%--顶部导航条--%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">持明法洲后台管理系统</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a>欢迎：${admin.username}</a></li>
                <li><a href="${path}/admin/exit">退出系统</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<%--中间栅格系统--%>
<div class="row">
    <%--左侧--%>
    <div class="col-xs-2">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title text-center">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="true" aria-controls="collapseOne">
                            <h4>轮播图管理</h4>
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body text-center">
                        <a href="javascript:$('#contentLayout').load('banner.jsp')" class="btn btn-default">轮播图列表</a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title text-center">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <h4>专辑管理</h4>
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body text-center">
                        <a href="javascript:$('#contentLayout').load('${path}/album/album-show.jsp')"
                           class="btn btn-default">专辑列表</a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title text-center">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <h4>文章管理</h4>
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body text-center">
                        <a href="javascript:$('#contentLayout').load('${path}/article/article-show.jsp')"
                           class="btn btn-default">文章列表</a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                    <h4 class="panel-title text-center">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            <h4>用户管理</h4>
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                    <div class="panel-body text-center">
                        <a href="javascript:$('#contentLayout').load('${path}/user/user-show.jsp')"
                           class="btn btn-default">用户列表</a>
                        <br><br>
                        <a href="javascript:$('#contentLayout').load('${path}/user/user-line.jsp')"
                           class="btn btn-default">用户注册趋势</a>
                        <br><br>
                        <a href="javascript:$('#contentLayout').load('${path}/user/user-map.jsp')"
                           class="btn btn-default">用户地区分布</a>
                        <br><br>
                        <a href="${path}/main/goeasy.jsp" class="btn btn-default">聊天室</a>
                    </div>
                </div>
            </div>
            <%--<div class="panel panel-default">--%>
            <%--<div class="panel-heading" role="tab" id="headingFive">--%>
            <%--<h4 class="panel-title text-center">--%>
            <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFour">--%>
            <%--<h4>上师管理</h4>--%>
            <%--</a>--%>
            <%--</h4>--%>
            <%--</div>--%>
            <%--<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">--%>
            <%--<div class="panel-body text-center">--%>
            <%--<a href="javascript:$('#contentLayout').load('user/user-show.jsp')" class="btn btn-default">上师列表</a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
    <%--右侧--%>
    <div class="col-xs-10" id="contentLayout">
        <div class="jumbotron" style="padding-left: 80px">
            <h2>欢迎来到持明法洲后台管理系统!</h2>
        </div>

        <!-- 轮播图 -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="5000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <%--<li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${path}/img/shouye.jpg" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img style="width: 100%;height: 327.59px" src="${path}/img/A2.jpg" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>

<br/>
<%--底部页脚--%>
<div class="panel panel-footer text-center">
    持明法洲后台管理系统 百知教育@zparkhrcom.cn
</div>

</body>
</html>