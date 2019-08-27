<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    $(function () {
        $("#bannerList").jqGrid({
            url: "${path}/banner/qureyAllBanner",
            datatype: "json",
            //数据表格是否自适应父容器的大小宽度
            autowidth: true,
            //开启表格编辑模式
            //cellEdit:false,
            //同时会提交当前行数据的id和修改后的当前列的值
            //cellurl:'${path}/banner/editBanner',
            //设置编辑表单提交路径
            editurl: '${path}/banner/editBanner',
            colNames: ["id", "图片", "名称", "描述", "状态", "创建时间"],
            colModel: [
                {name: "id"},
                {
                    name: "img_path", editable: true, edittype: "file",
                    formatter: function (value, options, row) {
                        return '<img src="${path}/img/' + row.img_path + '"  style="height:100px;width:150px" readonly="readonly" />';
                    }
                },
                {name: "title", editable: true},
                {name: "description", editable: true},
                {
                    name: "status", editable: true,
                    edittype: "select",
                    editoptions: {value: "y:展示;n:不展示"}
                },
                {name: "create_date"},
            ],
            //指定加载远程数据的请求方式
            mtype: "POST",
            styleUI: "Bootstrap",
            autowidth: true,
            pager: "#bannerPager",
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
            caption: '轮播图信息',
            multiselect: true,
            //在第一列显示行号
            rownumbers: true,
        }).navGrid("#bannerPager",
            {
                'add': true, 'edit': true, 'del': true, 'search': false, 'refresh': true
            },
            { //执行编辑时进行的操作
                closeAfterEdit: true,
                beforeShowForm: function (obj) {
                    obj.find("#img_path").attr("disabled", true);
                }
            },
            {//执行添加时进行额外操作
                closeAfterAdd: close,
                afterSubmit: function (response) {
                    $.ajaxFileUpload({
                        url: "${path}/banner/upload",
                        fileElementId: "img_path",
                        success: function (data) {
                            $("#bannerList").trigger("reloadGrid");
                        }
                    })

                }
            },
            {//删除时。。。。
                closeAfterDel: close,

            }
        )
    })
</script>

<table id="bannerList"></table>
<div style="height: 50px" id="bannerPager"></div>