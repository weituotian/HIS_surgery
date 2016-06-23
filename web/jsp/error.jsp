<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>错误页面</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/about_us.css">
</head>

<body>
<div class="container">
    <jsp:include page="common/nav.jsp"/>
</div>

<div class="container">
    <div class="header">
    </div>

    <div class="content">
        <div class="about_us_header">
            <h4>唔，好像遇到错误了哦...</h4>
        </div>
        <div class="about_us_body">
            <div class="block1">
                <img id="pic_doctor" src="${pageContext.request.contextPath}/images/error.png">
            </div>
            <div class="block2">
                <div class="articles1">
                    <p>
                        <s:property value="errormsg"/>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="common/footer.jsp"/>
</div>


<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
