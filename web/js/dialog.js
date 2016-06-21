/**
 * 各种公共函数
 */

/**
 * 全局函数，显示对话框,此函数依赖于bootstrap.js
 * @param text 修改对话框的文本
 * @param callback 对话框确定按钮被点击的回调函数
 */
function showDialog(text, callback) {
    var mydialog = $('#myModal');
    mydialog.find('div.modal-body').text(text);
    mydialog.modal('show');
    mydialog.on('hide.bs.modal', function () {
        // 执行一些动作...
        callback && callback();
    })
}
