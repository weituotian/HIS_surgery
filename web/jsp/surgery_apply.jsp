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
    <div class="row">
        <s:if test='#request.type=="update"'>
            <h3>当前正在修改手术编号：<s:property value="#request.sid"/></h3>
        </s:if>
    </div>
    <%--病人信息--%>
    <table id="patient_table" class="table">
        <caption>输入病人编号获得信息:</caption>
        <tbody>
        <tr>
            <th rowspan="3">病人信息</th>
            <th>编号：</th>
            <td>
                <label>
                    <input id="t_id" type="text" placeholder="输入病人编号获得信息:">
                </label>
            </td>
            <th>姓名：</th>
            <td>
                <label>
                    <input id="t_name" type="text" readonly="readonly">
                </label>
            </td>
            <th>年龄：</th>
            <td>
                <label>
                    <input id="t_age" type="text" readonly="readonly">
                </label>
            </td>
            <th>性别：</th>
            <td>
                <label>
                    <input id="t_sex" type="text" readonly="readonly">
                </label>
            </td>
        </tr>
        <tr>
            <th>电话:</th>
            <td>
                <label>
                    <input id="t_phone" type="text" readonly="readonly">
                </label>
            </td>
            <th>电子邮箱：</th>
            <td>
                <label>
                    <input id="t_email" type="text" readonly="readonly">
                </label>
            </td>
            <th>生日：</th>
            <td>
                <label>
                    <input id="t_birthday" type="text" readonly="readonly">
                </label>
            </td>
        </tr>
        <tr>
            <th>地址：</th>
            <td colspan="7">
                <label style="width: 100%">
                    <input id="t_address" type="text" style="width: 95%" readonly="readonly">
                </label>
            </td>
        </tr>
        </tbody>
    </table>
    <%--手术讯息--%>
    <table id="surgery_table" class="table">
        <caption>手术讯息</caption>
        <tbody>
        <tr>
            <th>手术名称：</th>
            <td><label for="sur_name"></label><input type="text" id="sur_name" class="common"></td>
            <th>疾病诊断：</th>
            <td><label for="sur_disease"></label><input type="text" id="sur_disease" class="common"></td>
        </tr>
        <tr>
            <th>医生：</th>
            <td>
                <input type="text" id="sur_doctor" class="common" placeholder="输入医生编号">
                <label for="sur_doctor" id="doctor_name"></label>
            </td>
            <th>申请时间：</th>
            <td style="width: 50%">
                <div class="input-group date form_time col-md-5" data-date="" style="width: auto"
                     data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
                    <input id="sur_time" class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="row">
        <button type="button" class="btn btn-primary" id="sur_submit">提交</button>
        <button type="button" class="btn btn-primary" id="sur_save">保存修改</button>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    消息
                </h4>
            </div>
            <div class="modal-body">
                按下 ESC 按钮退出。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定
                </button>
                <%--<button type="button" class="btn btn-primary">--%>
                <%--提交更改--%>
                <%--</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
    /**
     * 时间类型的格式化函数
     */
    Date.prototype.format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "H+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    /**
     * 全局函数，显示对话框
     * @param text
     */
    function showDialog(text) {
        var mydialog = $('#myModal');
        mydialog.find('div.modal-body').text(text);
        mydialog.modal('show');
    }

    /**
     * 全局函数，判断是否函数,是返回true
     */
    function isNum(value) {
        //正则表达式判断是否整数
        return (!(/^(\+|-)?\d+$/.test(value)) || value < 0);
    }

    $(document).ready(function () {
        //基本的

        /**
         * 获取病人基本信息
         * @param $ele input元素
         * @param callback
         */
        function getPatientDetail($ele, callback) {

            //上一次输入的病人id
            var oldvalue = $ele.attr("oldId");
            //这次输入的病人ID
            var value = $ele.val();
            if (value == "") {
                //为空直接跳过
                return;
            }
            if (oldvalue == value) {
                //两次输入相同，跳过
                return;
            }

            //记录输入的id
            $ele.attr("oldId", value);
            console.log("输入病人编号！");

            //正则表达式判断是否整数
            if (isNum(value)) {
                showDialog("数量必须是正整数！");
                return;
            }

            //标志输入成功
            $ele.attr("success", true);
            $.ajax({
                url: "/patient/getdetail",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                data: {
                    id: value
                },
                success: function (rdata, textStatus) {
                    //var data = $.parseJSON(rdata);
                    callback && callback(rdata);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        }

        /**
         * 获取医生基本信息
         * @param $ele input元素
         * @param callback
         */
        function getDoctorDetail($ele, callback) {

            var oldvalue = $ele.attr("oldId");
            //这次输入的医生ID
            var value = $ele.val();
            if (value == "") {
                //为空直接跳过
                return;
            }
            if (oldvalue == value) {
                //两次输入相同，跳过
                return;
            }

            //记录输入的id
            $ele.attr("oldId", value);
            console.log("输入医生编号：" + value);

            //正则表达式判断是否整数
            if (isNum(value)) {
                showDialog("医生工号必须是正整数！");
                return;
            }

            //标志输入成功
            $ele.attr("success", true);
            $.ajax({
                url: "/doctor/getdetail",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                data: {
                    id: value
                },
                success: function (rdata, textStatus) {
                    //var data = $.parseJSON(rdata);
                    callback && callback(rdata);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        }

        var $t_name = $('#t_name');
        var $t_birthday = $('#t_birthday');
        var $t_age = $('#t_age');
        var $t_email = $('#t_email');
        var $t_phone = $('#t_phone');
        var $t_sex = $('#t_sex');
        var $t_address = $('#t_address');
        var $t_id = $('#t_id');
        //标志是否输入成功，默认为false
        $t_id.attr("success", false);
        $t_id.blur(function () {
            getPatientDetail($t_id, function (data) {
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
        });

        var $sur_doctor = $('#sur_doctor');
        var $doctor_name = $('#doctor_name');
        var $sur_disease = $('#sur_disease');
        var $sur_name = $('#sur_name');
        var $sur_time = $('#sur_time');
        $sur_doctor.attr("success", false);
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
        //初始化时间
        $sur_time.val(new Date().format("yyyy-MM-dd HH:mm:ss"));
        $time.datetimepicker('update');

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
                    showDialog(rdata.msg);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });

        //保存手术申请
        var sid ='${surgery.code}';
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
        var operateType = '${type}';

        function initData(){
            //初始化表格各项数据
            //病人信息
            $t_id.val("${surgery.patient.id}");
            getPatientDetail($t_id, function (rdata) {
                if (!rdata.success) {
                    //失败
                    resetData();
                } else {
                    //成功
                    setData(rdata.patient);
                }
            });
            //医生信息
            $sur_doctor.val("${surgery.doctor.id}");
            getDoctorDetail($sur_doctor, function (rdata) {
                //回调
                if (!rdata.success) {
                    //失败
                    $doctor_name.text(rdata.msg);
                } else {
                    //成功
                    $doctor_name.text(rdata.doctor.name);
                }
            });
            //手术信息
            $sur_disease.val("${surgery.disease}");
            $sur_name.val("${surgery.name}");
            //初始化时间
            $sur_time.val(new Date("${surgery.applyTime}").format("yyyy-MM-dd HH:mm:ss"));
            $time.datetimepicker('update');
        }

        //如果是保存手术申请的状况
        if (operateType == "update") {
            initData();
            $btn_submit.hide();
        }else if (operateType=="view"){
            initData();
            //使只读
            $t_id.attr("readonly","readonly");
            $sur_doctor.attr("readonly","readonly");
            $sur_name.attr("readonly","readonly");
            $sur_disease.attr("readonly","readonly");

            $time.datetimepicker("remove");

            $btn_save.hide();
            $btn_submit.hide();
        }else if(operateType=="add"){
            //新建
            $btn_save.hide();
        }
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var $sur_disease = $('#sur_disease')
    });
</script>
</body>
</html>
