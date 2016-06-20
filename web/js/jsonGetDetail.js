/**
 * 封装了ajax获得各种实体的json的js
 */

/**
 * 全局函数，判断是否函数,是返回true
 */
function isNum(value) {
    //正则表达式判断是否整数
    return (!(/^(\+|-)?\d+$/.test(value)) || value < 0);
}

/**
 * 基本检查
 * @param $ele
 * @returns {number} 错误代码
 * 1为空，2为相同，3为不是整数
 */
function basecheck($ele){
    //旧的值
    var oldvalue = $ele.attr("oldId");

    //这次输入的医生ID
    var value = $ele.val();

    //记录输入的id
    $ele.attr("oldId", value);

    if (value == "") {
        //为空直接跳过
        return 1;
    }
    if (oldvalue == value) {
        //两次输入相同，跳过
        return 2;
    }
    //正则表达式判断是否整数
    if (isNum(value)) {
        //showDialog("医生工号必须是正整数！");
        return 3;
    }

    return 0;
}

/**
 * 获取医生基本信息
 * @param $ele input元素
 * @param callback
 */
function getDoctorDetail($ele, callback) {

    var checkcode = basecheck($ele);
    if (checkcode!=0) {
        //基本检查不通过就直接返回
        return checkcode;
    }

    var value = $ele.val();

    console.log("输入医生编号：" + value);

    //元素标志输入成功
    $ele.attr("success", true);

    //正式ajax请求
    $.ajax({
        url: "/doctor/getdetail",
        type: "POST",
        datatype: "json",
        timeout: 3000,
        data: {
            id: value
        },
        success: function (rdata, textStatus) {
            //var data = $.parseJSON(rdata);
            callback && callback(rdata);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest + textStatus + errorThrown);
        }
    });

    return 0;
}

function getNurseDetail($ele,callback){
    var checkcode = basecheck($ele);
    if (checkcode!=0) {
        //基本检查不通过就直接返回
        return checkcode;
    }

    //元素标记输入成功
    $ele.attr("success", true);

    var value = $ele.val();

    console.log("输入护士编号：" + value);

    //正式ajax请求
    $.ajax({
        url: "/nurse/getdetail",
        type: "POST",
        datatype: "json",
        timeout: 3000,
        data: {
            id: value
        },
        success: function (rdata, textStatus) {
            //var data = $.parseJSON(rdata);
            callback && callback(rdata);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest + textStatus + errorThrown);
        }
    });

    return 0;
}