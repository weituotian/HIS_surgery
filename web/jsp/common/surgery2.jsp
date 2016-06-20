<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #surgery_table th {
        width: 20%;
    }

    #surgery_table input {
        width: 30%;
    }
</style>
<%--手术安排--%>
<table id="surgery_table" class="table">
    <caption>手术安排：</caption>
    <tbody>
    <tr>
        <th>手术助手：</th>
        <td id="td_assist">
            <s:iterator value="surgery.assists" id="each">
                <%--did是自定义的记录医生id--%>
                <div did="<s:property value="#each.id"/> ">
                <span>
                    <s:property value="#each.name"/>
                </span>
                        <%--减号--%>
                    <button type="button" class="btn btn-default btn-link">
                        <span class="glyphicon glyphicon-minus"></span>
                    </button>
                </div>
            </s:iterator>
        </td>
        <td>
            <label for="add_assist"></label>
            <input type="text" id="input_assist" class="common" placeholder="输入医生编号添加医生" readonly>
            <%--加号--%>
            <button type="button" id="add_assist" class="btn btn-default btn-link">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
        </td>
    </tr>
    <tr>
        <th>护士：</th>
        <td id="td_nurse">
            <s:iterator value="surgery.nurses" id="each">
                <div nid="<s:property value="#each.nurseId"/>">
                    <span><s:property value="#each.nurseName"/></span>
                        <%--减号--%>
                    <button type="button" class="btn btn-default btn-link delete">
                        <span class="glyphicon glyphicon-minus"></span>
                    </button>
                </div>
            </s:iterator>
        </td>
        <td>
            <input type="text" id="input_nurse" class="common" placeholder="输入护士编号添加护士" readonly>
            <label for="add_nurse" id="doctor_name"></label>
            <%--加号--%>
            <button type="button" id="add_nurse" class="btn btn-default btn-link">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
        </td>
    </tr>
    <tr>
        <th>科室</th>
        <td>
            <select id="input_room" class="form-control">
                <s:iterator value="roomlist" id="each">
                    <option value="<s:property value="#each.num"/>"
                            <s:if test="#each.num==surgery.room.num">selected</s:if>
                    >
                        <s:property value="#each.name"/>
                    </option>
                </s:iterator>
            </select>
        </td>
    </tr>
    </tbody>
</table>

