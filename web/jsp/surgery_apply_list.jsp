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

    <title>手术申请列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" media="screen">

    <%--自定义css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>

<jsp:include page="common/nav.jsp"/>
<div class="container">
    <div class="row">
        <h3 class="pull-left">手术申请</h3>
        <a class="btn btn-primary pull-right" href="/surgery/page_add" target="_blank"><span class="glyphicon glyphicon-plus"></span>新建手术申请</a>
    </div>
    <div class="row">
        <table class="table table-striped table-hover">
            <caption>所有正在申请的手术:</caption>
            <thead>
            <tr>
                <th>手术编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>手术日期</th>
                <th>手术名称</th>
                <th>主刀医生</th>
                <th>疾病</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="mypage.result" id="each">
                <tr>

                    <td><s:property value="#each.code"/></td>
                    <td><s:property value="#each.patient.name"/></td>
                    <td>
                        <s:if test="#each.patient.sex==1">
                            男
                        </s:if>
                        <s:else>
                            女
                        </s:else>
                    </td>
                    <td><s:property value="#each.patient.age"/></td>
                    <td><s:date name="#each.applyTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><s:property value="#each.name"/></td>
                    <td><s:property value="#each.doctor.name"/></td>
                    <td><s:property value="#each.disease"/></td>
                    <td>
                        <a class="btn btn-primary" href="/surgery/page_view/<s:property value="#each.code"/>" target="_blank">
                            查看
                        </a>
                        <a class="btn btn-primary" href="/surgery/page_update/<s:property value="#each.code"/>" target="_blank">
                            修改
                        </a>
                        <a class="btn btn-primary dispose" sid="<s:property value="#each.code"/>">
                            废弃
                        </a>
                        <a class="btn btn-primary " href="/surgery/page_arrange/<s:property value="#each.code"/>" target="_blank">
                            安排
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

<!-- 模态框（Modal） -->
<jsp:include page="common/dialog.jsp"/>
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog"--%>
     <%--aria-labelledby="myModalLabel" aria-hidden="true">--%>
    <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×--%>
                <%--</button>--%>
                <%--<h4 class="modal-title" id="myModalLabel">--%>
                    <%--消息--%>
                <%--</h4>--%>
            <%--</div>--%>
            <%--<div class="modal-body">--%>
                <%--按下 ESC 按钮退出。--%>
            <%--</div>--%>
            <%--<div class="modal-footer">--%>
                <%--<button type="button" class="btn btn-primary" data-dismiss="modal" id="modal_sure">确定--%>
                <%--</button>--%>
                <%--&lt;%&ndash;<button type="button" class="btn btn-primary">&ndash;%&gt;--%>
                <%--&lt;%&ndash;提交更改&ndash;%&gt;--%>
                <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
            <%--</div>--%>
        <%--</div><!-- /.modal-content -->--%>
    <%--</div><!-- /.modal-dialog -->--%>
<%--</div>--%>


<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<%--为bootstrap优化的分页插件--%>
<script src="${pageContext.request.contextPath}/js/jquery-page-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
    /**
     * 全局函数，显示对话框
     * @param text
     */
    function showDialog(text,callback) {
        var mydialog = $('#myModal');
        mydialog.find('div.modal-body').text(text);
        mydialog.modal('show');
        mydialog.on('hide.bs.modal', function () {
            // 执行一些动作...
            callback && callback();
        })
    }

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
                window.location.href = "/surgery/list/size_" + size + "_page_" + page;
            }
        };

        //创建分页条
        $pagination.paging(setting);

        //废弃按钮被点击
        $('a.btn.dispose').each(function () {
            var $this = $(this);
            $this.click(function () {
                var sid = $this.attr("sid");
                console.log("废弃按钮被点击！sid ="+sid);
                $.ajax({
                    url: "/surgery/dispose",
                    type: "POST",
                    datatype: "json",
                    timeout: 3000,
                    data: {
                        sid:sid
                    },
                    success: function (rdata, textStatus) {
                        //var data = $.parseJSON(rdata);
                        showDialog(rdata.msg, function () {
                            if (rdata.success) {
                                window.location.reload(true);
                            }
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });
            });
        });
    });
</script>
</body>
</html>
