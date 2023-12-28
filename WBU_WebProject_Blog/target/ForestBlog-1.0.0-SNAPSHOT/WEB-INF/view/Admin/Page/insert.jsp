<%--保留此处 start--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%--保留此处 end--%>
<rapid:override name="title">
    - 编辑页面
</rapid:override>

<rapid:override name="content">
    <blockquote class="mtc-elem-quote">
        <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/page">页面列表</a>
              <a><cite>新建页面</cite></a>
        </span>
    </blockquote>


    <form class="mtc-form" method="post" id="myForm"
          action="/admin/page/insertSubmit">
        <div class="mtc-form-item">
            <label class="mtc-form-label">别名<span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-inline">
                <input type="text" name="pageKey" lay-verify="key" id="key" value=""
                       class="mtc-input">
            </div>
            <div class="mtc-form-mid mtc-word-aux">请填写2到20位，仅允许字母、下划线和减号组成（<span style="color: #FF5722;">请确保别名没重复</span>）</div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">标题 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-inline">
                <input type="text" name="pageTitle" lay-verify="title" id="title" value=""
                       class="mtc-input">
            </div>
        </div>

        <div class="mtc-form-item mtc-form-text">
            <label class="mtc-form-label">内容 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <textarea class="mtc-textarea mtc-hide" name="pageContent"
                          id="content"></textarea>
            </div>
        </div>

        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit="" lay-filter="demo1">新建</button>
                <button type="reset" class="mtc-btn mtc-btn-primary">重置</button>
            </div>
        </div>
    </form>

</rapid:override>


<rapid:override name="footer-script">

    <script>


        mtc.use(['form', 'layedit', 'laydate'], function () {
            var form = mtc.form
                , layer = mtc.layer
                , layedit = mtc.layedit
                , laydate = mtc.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                    url: '/admin/upload/img' //接口url
                    , type: 'post' //默认post
                }
            });


            //创建一个编辑器
            var editIndex = layedit.build('content', {
                    height: 350,
                }
            );

            mtc.code({
                elem: 'pre', //默认值为.mtc-code
            });

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 2) {
                        return '标题至少得2个字符啊';
                    }
                },
                key: [/^[a-zA-Z_-]{2,20}$/, '别名输入不规范'],
                content: function (value) {
                    layedit.sync(editIndex);
                }
            });
            layedit.build('content', {
                tool: [
                    'strong' //加粗
                    , 'italic' //斜体
                    , 'underline' //下划线
                    , 'del' //删除线

                    , '|' //分割线

                    , 'left' //左对齐
                    , 'center' //居中对齐
                    , 'right' //右对齐
                    , 'link' //超链接
                    , 'unlink' //清除链接
                    , 'face' //表情
                    , 'image' //插入图片
                    , 'code'
                ]
            });


        })
    </script>

</rapid:override>


<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp" %>

