<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>

    $("#userList").jqGrid({
        url: "${path}/userController/qureyAlluser",
        datatype: "json",
        //数据表格是否自适应父容器的大小宽度
        autowidth: true,
        //开启表格编辑模式
        cellEdit: true,
        cellurl: '${path}/userController/editUser',
        //设置编辑表单提交路径
        editurl: '${path}/userController/editUser',
        colNames: ["id", "电话", "用户名", "密码", "性别", "头像", "法师", "省份", "城市", "签名", "状态", "创建时间"],
        colModel: [
            {name: "id", hidden: true},
            {name: "phone", editable: false},
            {name: "username", editable: false},
            {name: "password", editable: false},
            {name: "sex", editable: false},
            {
                name: "head_pic", editable: false, edittype: "file",
                formatter: function (value, options, row) {
                    return '<img src="${path}/user/img/' + row.head_pic + '"  style="height:100px;width:150px"/>';
                }
            },
            {name: "dharma", editable: false},
            {name: "province", editable: false},
            {name: "city", editable: false},
            {name: "sign", editable: false},
            {
                name: "status", editable: true,
                edittype: "select",
                editoptions: {value: "y:正常;n:冻结"}
            },
            {name: "create_date", editable: false},
        ],
        //指定加载远程数据的请求方式
        mtype: "POST",
        styleUI: "Bootstrap",
        autowidth: true,
        pager: "#userPager",
        height: "60%",
        //默认展示第几页
        page: 1,
        //设置默认每页展示条数
        rowNum: 3,
        //指定默认排序字段
        sortname: 'create_date',
        //指定默认的排序规则
        sortorder: 'asc',
        //是否显示总记录条数
        viewrecords: true,
        //每页展示条数()
        rowList: [3, 6, 9],
        //指定表格标题
        //caption:'用户信息',
        multiselect: true,
        //在第一列显示行号
        rownumbers: true,
    }).navGrid("#userPager",
        {
            'add': false, 'edit': true, 'del': false, 'search': false, 'refresh': true
        },
        { //执行编辑时进行的操作
            closeAfterEdit: true,
        }
    )


    function out() {
        location.href = "${path}/userController/outUser";
    }

</script>


<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">所有用户</a></li>
        <li role="presentation"><a href="#" aria-controls="profile" role="tab" data-toggle="tab" onclick="out()">导出所有用户信息</a>
        </li>
    </ul>

</div>

<table id="userList"></table>
<div style="height: 50px" id="userPager"></div>