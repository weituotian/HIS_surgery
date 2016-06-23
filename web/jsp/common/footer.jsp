<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .pageFooter {
        clear: both;
        width: 100%;
        height: 24%;
        margin-bottom: 10px;
        font-family: 宋体, serif;
    }

    .contact {
        width: 25%;
        float: left;
    }

    .contact ul{
        padding: 0;
        text-align: center;
    }

    .contact h4 {
        font-weight: bold;
        font-size: 20px;
        text-align: center;
    }

    .contact ul li {
        margin-left: 13px;
        padding: 2px;
        color: black;
        list-style: none;
        font-size: 20px;
    }

    .copyright {
        font: normal 100% Helvetica, Arial, sans-serif;
        text-align: center;
        font-size:10px;
        font-weight: bold;
        width: 30%;
        margin: 0 auto;
    }
</style>
<div class="pageFooter">
    <div class="contact">
        <h4>关于手术麻醉管理</h4>
        <ul>
            <li>关于我们</li>
            <li>联系我们</li>
            <li>加入我们</li>
        </ul>
    </div>
    <div class="contact">
        <h4>如何使用</h4>
        <ul>
            <li>帮助</li>
        </ul>
    </div>
    <div class="contact">
        <h4>社区</h4>
        <ul>

        </ul>
    </div>
    <div class="contact">
        <h4>一切尽在</h4>
        <ul>
            <li><img src="${pageContext.request.contextPath}/images/footer.png" alt="页脚图" height="64" width="64"/></li>
        </ul>
    </div>
    <div class="copyright">Icons made by <a href="http://www.flaticon.com/authors/madebyoliver"
                                            title="Madebyoliver">Madebyoliver</a> from <a
            href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a
            href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0"
            target="_blank">CC 3.0 BY</a></div>
</div>
