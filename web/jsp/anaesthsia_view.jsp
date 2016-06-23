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

    <title>麻醉申请查看</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>

<jsp:include page="common/nav.jsp"/>
<div class="container">
    <h3>麻醉申请查看</h3>
    <s:if test="surgery.state==0">
        <h3>(已失效)(手术处于申请状态,不在已安排状态)</h3>
    </s:if>
    <div class="row">
        <%--手术讯息--%>
        <jsp:include page="common/surgery1.jsp"/>
        <%--病人信息--%>
        <%@include file="common/patient.jsp" %>
    </div>
    <div class="row">
        <jsp:include page="common/anaesthsia.jsp"/>
        <s:if test="surgery.ana.state==1">
            <%--麻醉处于已记录状态就显示出来--%>
            <jsp:include page="common/anaesthsia2.jsp"/>
        </s:if>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
