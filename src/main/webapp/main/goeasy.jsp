<%@page contentType="text/html; utf-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
</head>
<body>
<script>
    var goEasy = new GoEasy({
        appkey: "BC-887ea854177c48d1afe836abf5933ecf"

    });

    /*goEasy.subscribe({
        channel: "my_channel",
        onMessage: function (message) {
            alert("Channel:" + message.channel + " content:" + message.content);
        }
    });*/
    $(function () {
        var pubMsg;

        $("#message-send").click(function () {
            var msg = $("#message-input").val();
            pubMsg = msg;
            goEasy.publish({
                channel: "enqiangqiang",
                message: msg,
                onSuccess: function () {
                    var msgDiv = $(
                        "<div style='background: #3c763d;float: right;'>"
                        + msg
                        + "</div>"
                    );
                    $("#message-show").append(msgDiv).append("<br/><br/>")

                }
            });

            $("#message-input").val("");

        });

        goEasy.subscribe({
            channel: "enqiangqiang",
            onMessage: function (message) {
                var subMsg = message.content;

                if (pubMsg != subMsg) {
                    var msgDiv = $(
                        "<div style='background: gray;float: left;'>"
                        + subMsg
                        + "</div>"
                    );
                    $("#message-show").append(msgDiv).append("<br/><br/>")
                } else {
                    pubMsg = "";
                }
                /*var subMsg=message.content;
                var msgDiv=$(
                    "<div style='background: gray;float: left;'>"
                    +subMsg
                    +"</div>"
                );
                $("#message-show").append(msgDiv).append("<br/><br/>")*/
            }
        });

    })

</script>


<div style="width: 500px;height: 600px;border: 1px solid red">
    <div id="message-show" style="overflow-y:auto; overflow-x:auto;height:400px;width: 500px;border: 1px solid green">

    </div>
    <div style="height:200px;width: 500px;border: 1px solid blue">
        <textarea id="message-input" cols="30" rows="10" style="height:150px;width: 500px"></textarea>
        <button id="message-send" style="float: right">发送</button>
    </div>

</div>


</body>
</html>