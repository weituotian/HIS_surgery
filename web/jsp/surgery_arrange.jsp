<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--http://localhost:8080/surgery/arrange?sid=2&dids=1&dids=3&nids=1&nids=2&room=1--%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>手术安排</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">
    <style>
        input.common {
            width: 100%;
        }

        .container .table th, .container .table td {
            padding: 8px 0 8px 0;
        }
    </style>
</head>
<body>

<div class="container">
    <%--两种方式都可以include文件--%>
    <%@include file="common/patient.jsp" %>
    <jsp:include page="common/surgery1.jsp"/>
    <jsp:include page="common/surgery2.jsp"/>

    <div class="row">
        <a id="btn_arrange" class="btn btn-primary">安排</a>
        <a id="btn_cancel" class="btn btn-primary">取消安排</a>
    </div>
</div>
<%--模态框--%>
<jsp:include page="common/dialog.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<%--json获得bean信息--%>
<script src="${pageContext.request.contextPath}/js/jsonGetDetail.js"></script>
<%--公共js--%>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //添加助手按钮
        var add_assist = $('#add_assist');
        //添加护士按钮
        var add_nurse = $('#add_nurse');

        //助手id输入框
        var $input_assist = $('#input_assist');
        $input_assist.attr("readonly", false);

        //护士id输入框
        var $input_nurse = $('#input_nurse');
        $input_nurse.attr("readonly", false);

        /**
         * 添加元素
         */
        function addTdElement($td, property, id, text) {
            var $maindiv = $('<div></div>').attr(property, id).appendTo($td);
            var $name = $('<span>' + text + '</span>').appendTo($maindiv);
            <%--减号--%>
            var $button = $('<button type="button" class="btn btn-default btn-link"><span class="glyphicon glyphicon-minus"></span></button>').appendTo($maindiv);
            <%--减号点击事件--%>
            $button.click(function () {
                $maindiv.remove();
            });
        }

        /**
         * 检测值是否重复
         */
        function isRepeat($td, property, val) {
            var repeat = false;
            $td.find('div').each(function () {
                var $this = $(this);
                if (parseInt($this.attr(property)) == val) {
                    repeat = true;
                }
            });
            return repeat;
        }

        //添加助手
        add_assist.click(function () {
            if (isRepeat($td_assist, "did", $input_assist.val())) {
                //重复了
                showDialog("已经添加了该医生了哦！");
                return;
            }
            //ajax获取信息并且回调
            getDoctorDetail($input_assist, function (rdata) {
                //回调函数
                if (!rdata.success) {
                    //失败
                    showDialog(rdata.msg);
                } else {
                    //成功
                    addTdElement($td_assist, "did", rdata.doctor.id, rdata.doctor.name);
                }
            });
        });

        //添加护士
        add_nurse.click(function () {
            if (isRepeat($td_nurse, "nid", $input_nurse.val())) {
                //重复了
                showDialog("已经添加了该护士了哦！");
                return;
            }
            getNurseDetail($input_nurse, function (rdata) {
                //回调函数
                if (!rdata.success) {
                    //失败
                    showDialog(rdata.msg);
                } else {
                    //成功
                    addTdElement($td_nurse, "nid", rdata.nurse.nurseId, rdata.nurse.nurseName);
                }
            })
        });


        var $td_assist = $('#td_assist');
        //找到td内的每一个减号按钮
        $td_assist.find('button').each(function () {
            var $this = $(this);
            //点击事件
            $this.click(function () {
                //使它的父div移除
                $this.parent().remove();
            });
        });

        var $td_nurse = $('#td_nurse');
        //找到td内的每一个减号按钮
        $td_nurse.find('button').each(function () {
            var $this = $(this);
            //点击事件
            $this.click(function () {
                //使它的父div移除
                $this.parent().remove();
            });
        });

        //安排按钮
        var $btn_arrange = $('#btn_arrange');
        $btn_arrange.click(function () {
            //被点击

            //验证
            var assistArr = [];
            $td_assist.find('div').each(function () {
                var $this = $(this);
                assistArr.push($this.attr("did"));
            });
            var nurseArr = [];
            $td_nurse.find('div').each(function () {
                var $this = $(this);
                nurseArr.push($this.attr("nid"));
            });

            $.ajax({
                url: "/surgery/arrange",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                data: {
                    sid: ${requestScope.sid},
                    //医生数组
                    dids: assistArr,
                    //护士数组
                    nids: nurseArr,
                    //手术室id
                    room: $('#input_room').val()
                },
                //数组发送
                traditional: true,
                success: function (rdata, textStatus) {
                    //var data = $.parseJSON(rdata);
                    //回调函数
                    if (rdata.success) {

                    }else{

                    }
                    showDialog(rdata.msg);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });
    });
</script>
</body>
</html>
