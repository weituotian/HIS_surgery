/**
 * 分页插件
 */

(function ($) {

    //分页条的类
    var myPager = function (opts, $parent) {
        //一开始的页面，从1开始
        this.page_cur = opts.page_current;
        //总共的页数
        this.page_total = opts.page_total;
        //步长
        this.page_step = opts.page_step;
        //回调方法
        this.buttonClickCallback = opts.buttonClickCallback;
        //使用分页条的元素
        this.parent = $parent;
    };
    //分页条的函数
    myPager.prototype = {
        /**
         * 获取导航条的变量
         * @param variable
         * @returns {*}
         */
        getvariable: function (variable) {
            switch (variable) {
                case 'page_cur':
                    return this.page_cur;
                    break;
                case 'page_total':
                    return this.page_total;
                    break;
                case 'page_step':
                    return this.page_step;
                    break;
                default:
                    return null;
            }
        },
        /**
         * 更新变量
         * @param opts
         */
        updateVariable: function (opts) {
            //现在的页面
            if (opts.page_current)this.page_cur = opts.page_current;
            //总共的页数
            if (opts.page_total)this.page_total = opts.page_total;
            //步长
            if (opts.page_step)this.page_step = opts.page_step;
            //回调方法
            if (opts.buttonClickCallback)this.buttonClickCallback = opts.buttonClickCallback;
            //重绘
            this.draw();
        },
        /**
         * 回调函数
         * @param page
         */
        clickCallback: function (page) {
            console.log(page);
            this.buttonClickCallback && this.buttonClickCallback(page, this.parent);
        },
        /**
         * 绘制页码，从s到f-1页
         * @param s
         * @param f
         * @constructor
         */
        drawCode: function (s, f) {
            //分页条本身
            var self = this;
            var page_cur = this.page_cur;
            //循环创建
            for (var i = s; i < f; i++) {
                //将i传进index
                (function (index) {
                    //创建标签
                    var $li = $('<li></li>');
                    var $a = $('<a>' + index + '</a>').appendTo($li);

                    //高亮当前页面
                    if (index == page_cur) {
                        $li.addClass("active");
                    }
                    //绑定点击事件
                    $a.click(function () {
                        self.click(index);
                    });
                    //
                    self.parent.append($li);
                })(i);
            }
        },
        /**
         * 绘制末尾
         */
        drawLast: function () {
            //分页条本身
            var self = this;

            var $dot = $('<li><a>...</a></li>').appendTo(this.parent);
            var $end = $('<li><a>' + this.page_total + '</a></li>').appendTo(this.parent);
            $end.click(function () {
                self.click(self.page_total);
            });
        },
        /**
         * 绘制开头
         */
        drawFirst: function () {
            //分页条本身
            var self = this;
            var $end = $('<li><a>' + 1 + '</a></li>').appendTo(this.parent);
            $end.click(function () {
                self.click(1);
            });

            var $dot = $('<li><a>...</a></li>').appendTo(this.parent);
        },
        drawCenter: function () {

            //总共的页数
            var page_total = this.page_total;
            //步长
            var page_step = this.page_step;
            //现在的页面
            var page_cur = this.page_cur;

            if (page_total < page_step * 2 + 6) {//能全部显示的情况
                this.drawCode(1, page_total + 1);
            }
            else if (page_cur < page_step * 2 + 1) {//拉到最前头的情况
                this.drawCode(1, page_step * 2 + 4);
                this.drawLast();
            }
            else if (page_cur > page_total - page_step * 2) {//拉到最后头的情况
                this.drawFirst();
                this.drawCode(page_total - page_step * 2 - 2, page_total + 1);
            }
            else {//当前页数在中间的情况
                this.drawFirst();
                this.drawCode(page_cur - page_step, page_cur + page_step + 1);
                this.drawLast();
            }
        },
        /**
         * 绘制分页条
         */
        draw: function () {
            var $parent = this.parent;
            //myPager本身
            var self = this;
            //清空
            $parent.empty();

            //绘制控件
            var button_pre = $('<li><a>上一页</a></li>');
            var button_next = $('<li><a>下一页</a></li>');
            //绑定事件
            button_pre.click(function () {
                self.preClick();
            });
            button_next.click(function () {
                self.nextClick();
            });
            $parent.append(button_pre);
            $parent.append(this.drawCenter());
            $parent.append(button_next);

        },
        /**
         * 上一页按钮被点击
         */
        preClick: function () {
            this.page_cur--;
            if (this.page_cur < 1) {
                //这种情况正好是第1页，按上一页无动于衷
                this.page_cur = 1;
            } else {
                this.clickCallback(this.page_cur);
                //重绘
                this.draw();
            }
        },
        /**
         * 下一页按钮被点击
         */
        nextClick: function () {
            this.page_cur++;
            if (this.page_cur > this.page_total) {
                //这种情况正好是最后一页，按下一页无动于衷
                this.page_cur = this.page_total;
            } else {
                this.clickCallback(this.page_cur);
                //重绘
                this.draw();
            }
        },
        click: function (page) {
            console.log(page);
            this.page_cur = page;
            this.clickCallback(this.page_cur);
            //重绘
            this.draw();
        }
    };

    var methods = {
        init: function (settings) {
            var opts = $.extend({}, $.fn.paging.defaults, settings); //使用jQuery.extend 覆盖插件默认参数
            return this.each(function () {

                var self = this;//该元素本身
                var $this = $(self).empty();//JQ对象

                //新建对象
                var myPagebar = new myPager(opts, $this);

                //绘制分页条
                myPagebar.draw();

                //绑定数据
                $this.data("pager", myPagebar);
            });
        },
        /**
         * 重新设置某些参数
         * @param settings
         */
        settings: function (settings) {
            //this表示调用这个分页条插件额jq对象
            var pager = this.data('pager');
            pager.updateVariable(settings);
        },
        /**
         * 获得某option的值
         * @param variable option的名字
         */
        getvar: function (variable) {
            var pager = this.data('pager');
            pager.getvariable(variable);
        },
        /**
         * 主动点击某一页
         */
        click: function (page) {
            var pager = this.data('pager');
            pager.click(page);
        },
        /**
         * 重新点击当前页
         */
        refresh: function () {
            var pager = this.data('pager');
            pager.click(pager.page_cur);
        }
    };

    $.fn.paging = function () {
        //arguments[0]是传进来的第一个参数
        var method = arguments[0];

        if (methods[method]) {
            method = methods[method];
            arguments = Array.prototype.slice.call(arguments, 1);
        } else if (typeof(method) == 'object' || !method) {
            method = methods.init;
        } else {
            $.error('方法 ' + method + ' 并不存在于插件中！');
            return this;
        }

        //调用method方法，用this和arguments
        return method.apply(this, arguments);
    };

    //默认参数
    $.fn.paging.defaults = {
        page_total: 10,//总页数
        page_current: 1,//开始页面
        page_step: 3//步长
    };

})(jQuery);
