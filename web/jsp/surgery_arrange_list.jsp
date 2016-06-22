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

    <title>手术安排列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">
    <%--自定义css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <%--自定义style--%>
    <style>
        .container .table th, .container .table td {

        }
    </style>
</head>
<body>

<div class="container">
    <jsp:include page="common/nav.jsp"/>
    <div class="row">
        <h3 class="pull-left">手术安排</h3>
    </div>
    <div class="row table-responsive">
        <table class="table table-striped table-hover">
            <caption>所有已经安排的手术:</caption>
            <thead>
            <tr>
                <th>手术编号</th>
                <th>姓名</th>
                <th>手术日期</th>
                <th>手术名称</th>
                <th>主刀医生</th>
                <th>疾病</th>
                <th>手术室</th>
                <th>助手</th>
                <th>护士</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="mypage.result" id="each">
                <tr>
                    <td><s:property value="#each.code"/></td>
                    <td><s:property value="#each.patient.name"/></td>
                    <td><s:date name="#each.applyTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><s:property value="#each.name"/></td>
                    <td><s:property value="#each.doctor.name"/></td>
                    <td><s:property value="#each.disease"/></td>
                    <td><s:property value="#each.room.name"/></td>
                    <td>
                        <s:iterator value="#each.assists" var="assist">
                            <s:property value="#assist.name"/>/
                        </s:iterator>
                    </td>
                    <td>
                        <s:iterator value="#each.nurses" var="nurse">
                            <s:property value="#nurse.nurseName"/>/
                        </s:iterator>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="/surgery/page_arrange/<s:property value="#each.code"/>"
                           target="_blank">
                            修改
                        </a>
                        <a class="btn btn-primary" href="/anaesthsia/page_add/<s:property value="#each.code"/>" target="_blank">
                            麻醉<s:if test="#each.ana!=null">已</s:if>申请
                        </a>
                        <a class="btn btn-primary" id="anaesthsia_tolog" href="/anaesthsia/page_log/<s:property value="#each.code"/>" target="_blank">
                            麻醉<s:if test="#each.ana.state==1">已</s:if>记录
                        </a>
                        <a class="btn btn-primary" href="/surgery/page_log/<s:property value="#each.code"/>"
                           target="_blank">
                            记录
                        </a>
                    </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
    <div class="row text-center">
        <%--分页条--%>
        <ul id="pagination" class="pagination">
        </ul>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<%--为bootstrap优化的分页插件--%>
<script src="${pageContext.request.contextPath}/js/jquery-page-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/dialog.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //分页条的设置
        var $pagination = $('#pagination');

        var size =${mypage.pageSize};
        var setting = {
            page_total: ${mypage.totalPage},// 总页数
            page_current: ${mypage.pageNo},// 当前页面
            page_step: 1,// 步长
            buttonClickCallback: function (page, ele) {
                console.log("分页被点击！");
                //ele是使用分页插件的jq元素
                window.location.href = "/surgery/listA/size_" + size + "_page_" + page;
            }
        };

        //创建分页条
        $pagination.paging(setting);
    });
</script>
</body>
</html>
