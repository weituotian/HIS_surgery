<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="anaesthsia_table" class="table">
    <caption>麻醉申请：</caption>
    <tbody>
    <tr>
        <th>麻醉医生</th>
        <td>
            <input type="text" id="input_doctor" style="width: 20%;" class="common form-control pull-left" placeholder="输入医生编号" value="<s:property value="surgery.ana.doctor.id"/>" readonly>
            <label for="input_doctor"></label>
            <span id="Adoctor_name" class="text-center"></span>
        </td>
    </tr>
    <tr>
        <th>麻醉方法</th>
        <td>
            <label>
                <input id="anaesthsia_method" type="text" class="form-control"  value="<s:property value="surgery.ana.method"/>" readonly>
            </label>
        </td>
    </tr>
    <tr>
        <th>会诊意见</th>
        <td>
            <label style="width: 100%">
                <textarea style="height: 100px" id="anaesthsia_consult" class="form-control"  readonly><s:property value="surgery.ana.consultation"/></textarea>
            </label>
        </td>
    </tr>
    </tbody>
</table>