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
    <jsp:include page="common/nav.jsp"/>
    <h3>麻醉申请
        <s:if test="surgery.ana==null">
            (手术编号为<s:property value="surgery.code"/>,尚未提交麻醉申请)
        </s:if>
        <s:else>
            (手术编号为<s:property value="surgery.code"/>,以提交麻醉申请,可以修改)
        </s:else>
        <a class="btn btn-primary" href="/surgery/page_arrange/<s:property value="surgery.code"/>" target="_blank">转到该手术安排</a>
    </h3>
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
        <s:if test="surgery.ana==null">
            <button type="button" class="btn btn-primary" id="anaesthsia_submit">提交麻醉申请</button>
        </s:if>
        <s:else>
            <button type="button" class="btn btn-primary" id="anaesthsia_save"
                    value="<s:property value="surgery.ana.code"/>">保存（麻醉申请）
            </button>
            <a class="btn btn-primary" id="anaesthsia_tolog"
                    href="/anaesthsia/page_log/<s:property value="surgery.code"/>" target="_blank"
            >去做麻醉记录
            </a>
        </s:else>
    </div>
</div>

<jsp:include page="common/dialog.jsp"/>


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
        var $anaesthsia_method = $("#anaesthsia_method").attr("readonly", false);
        //麻醉会诊
        var $anaesthsia_consult = $('#anaesthsia_consult').attr("readonly", false);
        //医生id输入框
        var $input_doctor = $("#input_doctor").attr("readonly", false);
        var $Adoctor_name = $('#Adoctor_name');
        $input_doctor.blur(function () {
            var code = getDoctorDetail($input_doctor, function (rdata) {
                showDialog(rdata.msg);
                if (rdata.success) {
                    $Adoctor_name.text(rdata.doctor.name);
                } else {
                    $Adoctor_name.text(rdata.msg);
                }
            });
            if (code == 3) {
                showDialog("输入的麻醉医生id为整数哦！");
            }
        });

        //提交麻醉申请
        var $anaesthsia_submit = $('#anaesthsia_submit');
        $anaesthsia_submit.click(function () {
            $.ajax({
                url: "/anaesthsia/doadd",
                type: "POST",
                datatype: "json",
                data: {
                    sid:${requestScope.sid},
                    consult: $anaesthsia_consult.val(),
                    method: $anaesthsia_method.val(),
                    did: $input_doctor.val()
                },
                success: function (rdata, textStatus) {
                    //var data = $.parseJSON(rdata);
                    showDialog(rdata.msg, function () {
                        if (rdata.success) {
                            //如果成功就刷新本页面
                            window.location.reload(true);
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });

        //保存麻醉申请
        var $anaesthsia_save = $('#anaesthsia_save');
        $anaesthsia_save.click(function () {
            $.ajax({
                url: "/anaesthsia/doupdate",
                type: "POST",
                datatype: "json",
                data: {
                    aid: "<s:property value="surgery.ana.code"/>",
                    consult: $anaesthsia_consult.val(),
                    method: $anaesthsia_method.val(),
                    did: $input_doctor.val()
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

        //去做麻醉记录
        var $anaesthsia_tolog= $('#anaesthsia_tolog');
    });
</script>
</body>
</html>
