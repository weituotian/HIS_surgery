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

    <title>手术记录</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">

</head>
<body>

<div class="container">
    <jsp:include page="common/nav.jsp"/>
    <%--两种方式都可以include文件--%>
    <%@include file="common/patient.jsp" %>
    <jsp:include page="common/surgery1.jsp"/>
    <jsp:include page="common/surgery2.jsp"/>

    <%--麻醉相关--%>
    <div class="row">
        <h3>麻醉:</h3>
        <a class="btn btn-primary" href="/anaesthsia/page_log/<s:property value="surgery.code"/>" target="_blank">查看麻醉</a>
    </div>

    <jsp:include page="common/surgery3.jsp"/>

    <div class="row">
        <a id="btn_savelog" class="btn btn-primary">保存记录</a>
    </div>

</div>
<%--模态框--%>
<jsp:include page="common/dialog.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<%--json获得bean信息--%>
<script src="${pageContext.request.contextPath}/js/jsonGetDetail.js"></script>
<%--公共js--%>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<%--对话框js--%>
<script src="${pageContext.request.contextPath}/js/dialog.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //隐藏一些在手术安排的元素
        $('#td_nurse').next('td').remove();
        $('#td_assist').next('td').remove();

        //使surgery3.jsp中的某些控件起作用
        //术前诊断
        var $before_consult = $('#before_disease').attr("readonly", false);
        //术后诊断
        var $after_consult = $('#after_idsease').attr("readonly", false);

        //手术事项
        var $textarea_tansitional = $('#transition').attr("readonly", false);
        //备注
        var $textarea_remark = $('#remark').attr("readonly", false);

        //一开始就滚动到指定地方
        mScroll($before_consult);

        //保存手术记录按钮
        var $btn_savelog = $('#btn_savelog');
        $btn_savelog.click(function () {
            $.ajax({
                url: "/surgery/surgerylog",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                data: {
                    sid: ${requestScope.sid},
                    remark: $textarea_remark.val(),
                    firstConsult: $before_consult.val(),
                    endConsult: $after_consult.val(),
                    process: $textarea_tansitional.val()
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
    });
</script>
</body>
</html>
