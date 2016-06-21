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

    <title>麻醉申请</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>

<div class="container">
    <h3>麻醉申请(正在为手术编号为<s:property value="surgery.code"/>的手术申请 )</h3>
    <div class="row">
        <%--手术讯息--%>
        <jsp:include page="common/surgery1.jsp"/>
        <%--病人信息--%>
        <%@include file="common/patient.jsp" %>
    </div>
    <div class="row">
        <jsp:include page="common/anaesthsia.jsp"/>
    </div>
    <div class="row">
        <button type="button" class="btn btn-primary" id="anaesthsia_submit">提交申请</button>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<%--对话框--%>
<script src="${pageContext.request.contextPath}/js/dialog.js"></script>
<%--公共函数--%>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<script src="${pageContext.request.contextPath}/js/jsonGetDetail.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //麻醉方法
        var $anaesthsia_method = $("#anaesthsia_method").attr("readonly",false);
        //麻醉会诊
        var $anaesthsia_consult = $('#anaesthsia_consult').attr("readonly",false);
        //医生id输入框
        var $input_doctor = $("#input_doctor").attr("readonly",false);
        $input_doctor.blur(function () {
            var code= getDoctorDetail($input_doctor, function (rdata) {
                showDialog(rdata.msg);
                if (rdata.success) {

                }else{

                }
            });
            if (code==3) {
                showDialog("输入的麻醉医生id为整数哦！");
            }
        });
    });
</script>
</body>
</html>
