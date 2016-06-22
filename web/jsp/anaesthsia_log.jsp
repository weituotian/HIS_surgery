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

    <title>麻醉记录</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>

<div class="container">
    <jsp:include page="common/nav.jsp"/>

    <h3>麻醉记录(手术编号为<s:property value="surgery.code"/>)
        <s:if test="surgery.ana.state==1">
            <%--进行完麻醉记录可以跳到手术记录--%>
            <a class="btn btn-primary" href="/surgery/page_log/<s:property value="surgery.code"/>"
               target="_blank">麻醉记录完成，可去进行手术记录</a>
        </s:if>
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
        <a class="btn btn-primary" href="/anaesthsia/page_add/<s:property value="surgery.code"/>">修改麻醉申请</a>
    </div>
    <div class="row">
        <jsp:include page="common/anaesthsia2.jsp"/>
    </div>
    <div class="row">
        <button type="button" class="btn btn-primary" id="anaesthsia_logsubmit">保存麻醉记录</button>
    </div>
</div>

<jsp:include page="common/dialog.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<%--对话框--%>
<script src="${pageContext.request.contextPath}/js/dialog.js"></script>
<%--公共函数--%>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //麻醉记录
        var $anaesthsia_log = $('#anaesthsia_log').attr("readonly", false);
        //麻醉备注
        var $anaesthsia_remark = $('#anaesthsia_remark').attr("readonly", false);

        //提交保存麻醉记录
        var $anaesthsia_logsubmit = $('#anaesthsia_logsubmit');
        $anaesthsia_logsubmit.click(function () {
            $.ajax({
                url: "/anaesthsia/dolog",
                type: "POST",
                datatype: "json",
                data: {
                    //麻醉id
                    aid: "<s:property value="surgery.ana.code"/>",
                    log: $anaesthsia_log.val(),
                    remark: $anaesthsia_remark.val()
                },
                success: function (rdata, textStatus) {
                    showDialog(rdata.msg, function () {
                        if (rdata.success) {
                            //成功提交的话就刷新页面
                            window.location.reload(true);
                        }
                    });
                    //var data = $.parseJSON(rdata);
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
