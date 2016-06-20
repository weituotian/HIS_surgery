<table id="patient_table" class="table">
    <caption>输入病人编号获得信息:</caption>
    <tbody>
    <tr>
        <th rowspan="3">病人信息</th>
        <th>编号：</th>
        <td>
            <label>
                <input id="t_id" type="text" placeholder="输入病人编号获得信息:">
            </label>
        </td>
        <th>姓名：</th>
        <td>
            <label>
                <input id="t_name" type="text" readonly="readonly">
            </label>
        </td>
        <th>年龄：</th>
        <td>
            <label>
                <input id="t_age" type="text" readonly="readonly">
            </label>
        </td>
        <th>性别：</th>
        <td>
            <label>
                <input id="t_sex" type="text" readonly="readonly">
            </label>
        </td>
    </tr>
    <tr>
        <th>电话:</th>
        <td>
            <label>
                <input id="t_phone" type="text" readonly="readonly">
            </label>
        </td>
        <th>电子邮箱：</th>
        <td>
            <label>
                <input id="t_email" type="text" readonly="readonly">
            </label>
        </td>
        <th>生日：</th>
        <td>
            <label>
                <input id="t_birthday" type="text" readonly="readonly">
            </label>
        </td>
    </tr>
    <tr>
        <th>地址：</th>
        <td colspan="7">
            <label style="width: 100%">
                <input id="t_address" type="text" style="width: 95%" readonly="readonly">
            </label>
        </td>
    </tr>
    </tbody>
</table>