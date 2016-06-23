<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang=zh-cmn-Hans>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>关于我们</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/about_us.css">
</head>

<body>


<jsp:include page="jsp/common/nav.jsp"/>
<div class="containerAbout">

    <div class="content">
        <div class="about_us_header">
            <h4>关于我们</h4>
        </div>
        <div class="about_us_body">
            <div class="block1">
                <img id="pic_doctor" src="${pageContext.request.contextPath}images/about_us1.png">
            </div>
            <div class="block2">
                <div class="articles1">
                    <p>
                        中国最大的手术麻醉管理平台，目前拥有两个注册用户。
                        <br>
                        <br>
                        小组成员：姚嘉辉 赖梓恒
                        <br>
                        <br>
                        旨在为用户提供全方位的手术解决方案，真正做到为用户负责。

                    </p>
                    <hr id="hr1">
                </div>
                <div class="articles2">
                    <ul>
                        <li>商务合作：
                            <a href="mailto:liwenchiilai@gmail.com">
                                liwenchiilai@gmail.com
                            </a>
                        </li>
                        <li>使用帮助：
                            <a href="mailto:liwenchiilai@gmail.com">
                                921977939@qq.com
                            </a>
                        </li>
                        <li>社区：
                            <a href="mailto:liwenchiilai@gmail.com">
                                github@gmail.com
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="jsp/common/footer.jsp"/>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
