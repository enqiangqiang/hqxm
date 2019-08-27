<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Login Form Template</title>
    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="shortcut icon" href="assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.backstretch.min.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script>
        //在页面加载完后执行
        $(function () {
            //登陆跳转的标记
            var usn = false;
            var psn = false;
            var yzm = false;

            //1.验证用户名
            $('#username').blur(function () {
                //获取username的value值
                var username = $('#username').val();
                //判断value
                if (username.length == 0) {
                    //提示请输入用户名，并改图片
                    //创建front标签
                    var font = $('<font style="color:red">请输入用户名</font>');
                    //将font标签加入span中
                    $('#msgU').html(font);
                    //修改img标签的src属性
                    $('#img').prop('src', '${path}/img/error.jpg')
                } else {
                    //用户名已输入
                    //创建front标签
                    var font = $('<font style="color:green">已输入用户名</font>');
                    //将font标签加入span中
                    $('#msgU').html(font);
                    //修改img标签的src属性
                    $('#img').prop('src', '${path}/img/ok.gif')
                    usn = true;
                }
            });

            //2.验证密码
            $('#password').blur(function () {
                //获取username的value值
                var password = $('#password').val();
                //判断value
                if (password.length != 6) {
                    //请输入6位数的密码，并改图片
                    //创建front标签
                    var font = $('<font style="color:red">请输入6位数的密码</font>');
                    //将font标签加入span中
                    $('#msgP').html(font);
                    //修改img标签的src属性
                    $('#imgP').prop('src', '${path}/img/error.jpg')
                } else {
                    //密码长度正确
                    //创建front标签
                    var font = $('<font style="color:green">密码长度正确</font>');
                    //将font标签加入span中
                    $('#msgP').html(font);
                    //修改img标签的src属性
                    $('#imgP').prop('src', '${path}/img/ok.gif')
                    psn = true;
                }
            });


            //3.验证密码
            $('#code').blur(function () {
                //获取username的value值
                var code = $('#code').val();
                //判断value
                if (code.length != 4) {
                    //创建front标签
                    var font = $('<font style="color:red">请输入4位数验证码</font>');
                    //将font标签加入span中
                    $('#msgC').html(font);
                    //修改img标签的src属性
                    $('#codeP').prop('src', '${path}/img/error.jpg')
                } else {
                    //创建front标签
                    var font = $('<font style="color:green">已输入验证码</font>');
                    //将font标签加入span中
                    $('#msgC').html(font);
                    //修改img标签的src属性
                    $('#codeP').prop('src', '${path}/img/ok.gif')
                    yzm = true;
                }
            });


            //4.登陆验证
            $('#loginButtonId').click(function () {
                //把所有input执行一遍失去焦点事件
                $('input').trigger('blur');
                //判断是否所有标记位true
                if (usn == true && psn == true && yzm == true) {
                    //全为true说明全不为空。然后用ajax判断做登陆验证，判断账号和密码、验证码是否正确
                    //获取输入的账号和密码、验证码
                    var username = $('#username').val();
                    var password = $('#password').val();
                    var code = $('#code').val();
                    $.ajax({
                        url: "${path}/admin/loginCheck",
                        type: "POST",
                        data: {"username": username, "password": password, "code": code},
                        success: function (data) {
                            if (data.msg == "UN") {
                                //提示用户名错误，并改图片
                                //创建front标签
                                var font = $('<font style="color:red">用户不存在</font>');
                                //将font标签加入span中
                                $('#msgU').html(font);
                                //修改img标签的src属性
                                $('#img').prop('src', '${path}/img/error.jpg')
                            }
                            if (data.msg == "PN") {
                                //提示密码错误，并改图片
                                //创建front标签
                                var font = $('<font style="color:red">密码错误</font>');
                                //将font标签加入span中
                                $('#msgP').html(font);
                                //修改img标签的src属性
                                $('#imgP').prop('src', '${path}/img/error.jpg');
                            }
                            if (data.msg == "CN") {
                                //提示验证码错误，并改图片
                                //创建front标签
                                var font = $('<font style="color:red">验证码输入错误</font>');
                                //将font标签加入span中
                                $('#msgC').html(font);
                                //修改img标签的src属性
                                $('#codeP').prop('src', '${path}/img/error.jpg');
                                ////修改img标签的src属性
                                $('#captchaImage').prop('src', '${path}/cap/execute?' + new Date());
                            }
                            if (data.msg == "YY") {
                                //执行submit
                                location.href = "${path}/main/main.jsp";
                            }
                        }
                    });
                } else {
                    return false;
                }
            });

            //5.点击验证码更新
            $('#captchaImage').click(function () {
                ////修改img标签的src属性
                $('#captchaImage').prop('src', '${path}/cap/execute?' + new Date());
            });


        })

    </script>
</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>CMFZ</strong> Login Form</h1>
                    <div class="description">
                        <p>
                            <a href="#"><strong>CMFZ</strong></a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top" style="width: 450px">
                        <div class="form-top-left">
                            <h3>Login to showall</h3>
                            <p>Enter your username and password to log on:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="form-bottom" style="width: 450px">
                        <form role="form" action="" method="post" class="login-form" id="loginForm">
                            <span id="msgDiv"></span>
                            <div class="form-group">
                                <label class="sr-only" for="username">Username</label>
                                <input type="text" name="username" placeholder="请输入用户名..."
                                       class="form-username form-control" id="username">
                                <span id="msgU"></span>
                                <img src="${path}/img/hui.PNG" id="img" width="20px" height="20px"/>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <input type="password" name="password" placeholder="请输入密码..."
                                       class="form-password form-control" id="password">
                                <span id="msgP"></span>
                                <img src="${path}/img/hui.PNG" id="imgP" width="20px" height="20px"/>
                            </div>
                            <div class="form-group">
                                <img id="captchaImage" style="height: 48px" class="captchaImage"
                                     src="${path}/cap/execute">
                                <input style="width: 289px;height: 50px;border:3px solid #ddd;border-radius: 4px;"
                                       type="test" name="enCode" id="code">
                                <span id="msgC"></span>
                                <img src="${path}/img/hui.PNG" id="codeP" width="20px" height="20px"/>
                            </div>
                            <input type="button" style="width: 400px;border:1px solid #9d9d9d;border-radius: 4px;"
                                   id="loginButtonId" value="登录">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


</body>

</html>