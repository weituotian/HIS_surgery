<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>手术申请</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <%--自定义css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        body{
            font-family: 微软雅黑, sans-serif;
        }
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
    <jsp:include page="common/nav.jsp"/>
    <div class="row">
        <s:if test='#request.type=="update"'>
            <h3>当前正在修改手术编号：<s:property value="#request.sid"/></h3>
        </s:if>
    </div>
    <%--病人信息--%>
    <%@include file="common/patient.jsp" %>
    <%--手术讯息--%>
    <jsp:include page="common/surgery1.jsp"/>
    <div class="row">
        <button type="button" class="btn btn-primary" id="sur_submit">提交</button>
        <button type="button" class="btn btn-primary" id="sur_save">保存修改</button>
        <a id="surgery_to_arrange" style="display: none" class="btn btn-primary" href="/surgery/page_arrange/<s:property value="surgery.code"/>">进行手术安排</a>
    </div>
</div>

<!-- 模态框（Modal） -->
<jsp:include page="common/dialog.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<%--对话框--%>
<script src="${pageContext.request.contextPath}/js/dialog.js"></script>
<%--公共函数--%>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<script src="${pageContext.request.contextPath}/js/jsonGetDetail.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

        //设置病人信息
        function setData(pdata) {
            var patient = {
                id: 0,
                name: "",
                phone: "",
                email: "",
                birthday: "",
                sex: true,
                address: "",
                age: 0
            };
            patient = pdata;
            $t_name.val(patient.name);
            $t_email.val(patient.email);
            $t_name.val(patient.name);
            $t_phone.val(patient.phone);
            $t_birthday.val(patient.birthday);
            if (patient.sex) {
                $t_sex.val("男");
            } else {
                $t_sex.val("女");
            }
            $t_age.val(patient.age);
            $t_address.val(patient.address);
        }

        //重置信息
        function resetData() {
            var $table = $('#patient_table');
            $table.find('input').each(function () {
                var $this = $(this);
                $this.val("");
            });
        }

        //病人名字
        var $t_name = $('#t_name');
        //病人生日
        var $t_birthday = $('#t_birthday');
        //病人年龄
        var $t_age = $('#t_age');
        //病人email
        var $t_email = $('#t_email');
        var $t_phone = $('#t_phone');
        var $t_sex = $('#t_sex');
        var $t_address = $('#t_address');
        var $t_id = $('#t_id');
        //标志是否输入成功，默认为false
        $t_id.attr("success", false);
        //病人编号输入
        $t_id.blur(function () {
            var code = getPatientDetail($t_id, function (data) {
                //回调函数
                showDialog(data.msg);
                if (!data.success) {
                    //失败
                    resetData();
                } else {
                    //成功
                    setData(data.patient);
                }
            });
            if (code == 3) {
                showDialog("病人编号必须是正整数！")
            }
        });

        //医生ｉｄ
        var $sur_doctor = $('#sur_doctor');
        //医生名字
        var $doctor_name = $('#doctor_name');
        //手术疾病
        var $sur_disease = $('#sur_disease');
        //手术名称
        var $sur_name = $('#sur_name');
        //手术时间
        var $sur_time = $('#sur_time');
        //一开始标记输入成功为false
        $sur_doctor.attr("success", false);
        //医生id输入
        $sur_doctor.blur(function () {
            getDoctorDetail($sur_doctor, function (rdata) {
                //回调
                showDialog(rdata.msg);
                if (!rdata.success) {
                    //失败
                    $doctor_name.text(rdata.msg);
                } else {
                    //成功
                    $doctor_name.text(rdata.doctor.name);
                }
            });
        });

        //日期选择
        var $time = $('.form_time').datetimepicker({
            language: "zh-CN",
            //日期显示格式
            format: "yyyy-mm-dd hh:ii:ss",
            //一周从哪一天开始。0（星期日）到6（星期六）
            weekStart: 1,
            //底部显示一个 "Today" 按钮用以选择当前日期
            todayBtn: true,
            autoclose: 1,
            todayHighlight: 1,
            //日期时间选择器打开之后首先显示的视图
            startView: 2,
            forceParse: 0,
            showMeridian: 1,
            //最小允许选择的时间
            startDate: new Date(),
            //初始化日期
            initialDate: new Date()
        });


        //提交手术申请
        var $btn_submit = $('#sur_submit');
        $btn_submit.click(function () {
            console.log("按钮提交申请");
            //验证
            if ($t_id.attr("success") == "false" || $sur_doctor.attr("success") == "false") {
                showDialog("病人id和医生id没有选择好");
                return;
            }
//
            var time = new Date($sur_time.val()).getTime();
            if (!time) {
                showDialog("请选择手术时间");
                return;
            }
            //console.log("TIME:"+time);
            $.ajax({
                url: "/surgery/add",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                //提交数据
                data: {
                    name: $sur_name.val(),
                    disease: $sur_disease.val(),
                    time: time,
                    //病人id
                    pid: $t_id.val(),
                    //医生id
                    did: $sur_doctor.val()
                },
                success: function (rdata, textStatus) {
                    //var data = $.parseJSON(rdata);
                    showDialog(rdata.msg, function () {
                        if (rdata.success){
                            //如果成功,页面跳转到修改手术申请页面
                            window.location.href = "/surgery/page_update/" + rdata.surgery.code;
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });

        //保存手术申请
        var sid = '${surgery.code}';
        var $btn_save = $('#sur_save');
        $btn_save.click(function () {
            console.log("按钮保存申请");
            //验证
            if ($t_id.attr("success") == "false" || $sur_doctor.attr("success") == "false") {
                showDialog("病人id和医生id没有选择好");
                return;
            }

            var time = new Date($sur_time.val()).getTime();
            if (!time) {
                showDialog("请选择手术时间");
                return;
            }

            $.ajax({
                url: "/surgery/save",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                //提交数据
                data: {
                    sid: sid,
                    name: $sur_name.val(),
                    disease: $sur_disease.val(),
                    time: time,
                    //病人id
                    pid: $t_id.val(),
                    //医生id
                    did: $sur_doctor.val()
                },
                success: function (rdata, textStatus) {
                    //var data = $.parseJSON(rdata);
                    showDialog(rdata.msg);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });

        //本页面的操作类型，是新建还是修改
        var operateType = '${requestScope.type}';

        function initData() {
            //初始化表格各项数据,使用js
            //病人信息
            //$t_id.val("${surgery.patient.id}");
            //$t_id.attr("readonly", false);
//            getPatientDetail($t_id, function (rdata) {
//                if (!rdata.success) {
//                    //失败
//                    resetData();
//                } else {
//                    //成功
//                    setData(rdata.patient);
//                }
//            });

            //医生信息
            //$sur_doctor.val("${surgery.doctor.id}");
            //$sur_doctor.attr("readonly", false);
//            getDoctorDetail($sur_doctor, function (rdata) {
//                //回调
//                if (!rdata.success) {
//                    //失败
//                    $doctor_name.text(rdata.msg);
//                } else {
//                    //成功
//                    $doctor_name.text(rdata.doctor.name);
//                }
//            });

            //手术信息
            <%--$sur_disease.val("${surgery.disease}");--%>
            <%--$sur_name.val("${surgery.name}");--%>

            //初始化时间
            <%--$sur_time.val(new Date("${surgery.applyTime}").format("yyyy-MM-dd HH:mm:ss"));--%>
            <%--$time.datetimepicker('update');--%>
        }

        if (operateType == "update") {
            //如果是修改手术申请的状况
            //initData();
            //显示去手术安排的按钮
            $('#surgery_to_arrange').show();

            $t_id.attr("readonly", false);
            $sur_doctor.attr("readonly", false);
            $sur_name.attr("readonly", false);
            $sur_disease.attr("readonly", false);

            //id输入框设置验证成功
            $t_id.attr("success", true);
            $t_id.attr("oldId", $t_id.val());
            $sur_doctor.attr("success", true);
            //$sur_doctor.attr("oldId", $sur_doctor.val());

            //隐藏提交按钮
            $btn_submit.hide();
        } else if (operateType == "view") {
            //查看的情况

            //initData();
            //使只读
//            $t_id.attr("readonly","readonly");
//            $sur_doctor.attr("readonly","readonly");
//            $sur_name.attr("readonly","readonly");
//            $sur_disease.attr("readonly","readonly");

            //取消时间选择功能
            $time.datetimepicker("remove");
            //隐藏两个按钮
            $btn_save.hide();
            $btn_submit.hide();
        } else if (operateType == "add") {
            //新建的情况下
            //使某些输入框能够接受输入

            $t_id.attr("readonly", false);
            $sur_doctor.attr("readonly", false);
            $sur_name.attr("readonly", false);
            $sur_disease.attr("readonly", false);

            //隐藏保存按钮
            $btn_save.hide();

            //初始化时间
            $sur_time.val(new Date().format("yyyy-MM-dd HH:mm:ss"));
            $time.datetimepicker('update');
        }
    });
</script>
</body>
</html>
