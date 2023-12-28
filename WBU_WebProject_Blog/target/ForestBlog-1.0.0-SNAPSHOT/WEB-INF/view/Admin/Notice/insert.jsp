<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 添加公告
    </rapid:override>
<rapid:override name="header-style">
    <style>

    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="mtc-elem-quote">
        <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/notice">公告列表</a>
              <a><cite>添加公告</cite></a>
        </span>
    </blockquote>

    <form class="mtc-form"  method="post" id="myForm" action="/admin/notice/insertSubmit">
        <div class="mtc-form-item">
            <label class="mtc-form-label">标题  <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <input type="text" name="noticeTitle" lay-verify="title" id="title" class="mtc-input" required>
            </div>
        </div>

        <div class="mtc-form-item mtc-form-text">
            <label class="mtc-form-label">内容  <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <textarea class="mtc-textarea mtc-hide" name="noticeContent" lay-verify="content" id="content" required></textarea>
            </div>
        </div>
        
        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit="" lay-filter="" >添加</button>
            </div>
        </div>
    </form>




</rapid:override>
<rapid:override name="footer-script">
    <script>
        mtc.use(['form', 'layedit', 'laydate'], function() {
            var form = mtc.form
                , layer = mtc.layer
                , layedit = mtc.layedit
                , laydate = mtc.laydate;


            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                ,content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                    url: '/admin/upload/img' //接口url
                    ,type: 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

        });
        //end
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
