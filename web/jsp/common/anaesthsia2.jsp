<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="anaesthsia_log_table" class="table">
    <caption>麻醉记录：</caption>
    <tbody>
    <tr>
        <th>麻醉记录</th>
        <td>
            <label for="anaesthsia_log"></label>
            <textarea style="height: 125px" id="anaesthsia_log" class="form-control" readonly><s:property value="surgery.ana.log"/></textarea>
        </td>
    </tr>
    <tr>
        <th>麻醉备注</th>
        <td>
            <label for="anaesthsia_remark"></label>
            <textarea style="height: 80px" id="anaesthsia_remark" class="form-control" readonly><s:property value="surgery.ana.remark"/></textarea>
        </td>
    </tr>
    </tbody>
</table>