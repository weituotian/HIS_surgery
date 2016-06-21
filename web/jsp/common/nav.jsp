<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="nav nav-pills">
    <li class="active"><a href="#">首页</a></li>
    <li><a href="#">关于我们</a></li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">手术<b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="/surgery/list/size_10_page_1">手术申请</a></li>
            <li class="divider"></li>
            <li><a href="/surgery/listA/size_10_page_1">手术安排</a></li>
            <li class="divider"></li>
            <li><a href="/surgery/listL/size_10_page_1">手术记录</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">麻醉<b class="caret bottom-up"></b></a>
        <ul class="dropdown-menu pull-right">
            <li><a href="#">麻醉申请</a></li>
            <li class="divider"></li>
            <li><a href="#">麻醉记录</a></li>
        </ul>
    </li>
</ul>
