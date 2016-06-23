<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>主页</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">

    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>


<div class="container">
    <jsp:include page="jsp/common/nav.jsp"/>
    <div class="header">
        <img id="icon" src="${pageContext.request.contextPath}/images/footer.png" alt="页脚图" height="64" width="64"/>
        <h1>Anaesthesia Information Management System</h1>
    </div>
    <div class="content">
        <div class="image" id="image1">
            <img src="${pageContext.request.contextPath}/images/surgery.png" alt="手术" height="256" width="256"/>
            <div class="description">值得信赖的外科医生</div>
        </div>
        <div class="image" id="image2">
            <img src="${pageContext.request.contextPath}/images/surgery_big.png" alt="麻醉" height="256" width="256"/>
            <div class="description">可靠的麻醉科室</div>
        </div>
        <div class="image" id="image3">
            <img src="${pageContext.request.contextPath}/images/medical_record.png" alt="病历" height="256" width="256"/>
            <div class="description">详细的手术检查与记录</div>
        </div>
    </div>
<jsp:include page="jsp/common/footer.jsp"/>
</div>


<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</body>
</html>
