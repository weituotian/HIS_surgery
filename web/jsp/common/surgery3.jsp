<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="log_table" class="table">
    <caption>手术记录：</caption>
    <tbody>
    <tr>
        <th>术前诊断</th>
        <td>
            <label>
                <input id="before_disease" type="text" class="form-control" value="<s:property value="surgery.log.firstDiagnosis"/>" readonly>
            </label>
        </td>
    </tr>
    <tr>
        <th>术后诊断</th>
        <td>
            <label>
                <input id="after_idsease" type="text" class="form-control"  value="<s:property value="surgery.log.endDiagnosis"/>" readonly>
            </label>
        </td>
    </tr>
    <tr>
        <th>记录事项</th>
        <td>
            <label style="width: 100%">
                <textarea style="height: 100px" id="transition" class="form-control"  readonly><s:property value="surgery.log.process"/> </textarea>
            </label>
        </td>
    </tr>
    <tr>
        <th>备注</th>
        <td>
            <label style="width: 100%">
                <textarea id="remark" class="form-control"  readonly><s:property value="surgery.log.remark"/></textarea>
            </label>
        </td>
    </tr>
    </tbody>
</table>

