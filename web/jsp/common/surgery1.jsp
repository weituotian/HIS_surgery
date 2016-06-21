<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--手术讯息--%>
<table id="surgery_arrange_table" class="table">
    <caption>手术讯息</caption>
    <tbody>
    <tr>
        <th>手术名称：</th>
        <td><label for="sur_name"></label>
            <input type="text" id="sur_name" class="common form-control" value="<s:property value="surgery.name"/>" readonly>
        </td>
        <th>疾病诊断：</th>
        <td><label for="sur_disease"></label>
            <input type="text" id="sur_disease" class="common form-control" value="<s:property value="surgery.disease"/>" readonly>
        </td>
    </tr>
    <tr>
        <th>医生：</th>
        <td>
            <input type="text" id="sur_doctor" class="common form-control" placeholder="输入医生编号" value="<s:property value="surgery.doctor.id"/>" readonly>
            <label for="sur_doctor" id="doctor_name"></label>
        </td>
        <th>申请时间：</th>
        <td style="width: 50%">
            <div class="input-group date form_time col-md-5" data-date="" style="width: auto"
                 data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
                <input id="sur_time" class="form-control" size="16" type="text" value="<s:date name="surgery.applyTime" format="yyyy-MM-dd HH:mm:ss"/>" readonly>
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    </tbody>
</table>
