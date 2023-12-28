<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 编辑公告
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
              <a><cite>编辑公告</cite></a>
        </span>
    </blockquote>

    <form class="mtc-form"  method="post" id="myForm" action="/admin/notice/editSubmit">
        <input type="hidden" name="noticeId" value="${notice.noticeId}">
        <div class="mtc-form-item">
            <label class="mtc-form-label">标题  <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <input type="text" name="noticeTitle" lay-verify="title" id="title" value="${notice.noticeTitle}" class="mtc-input" required>
            </div>
        </div>

        <div class="mtc-form-item mtc-form-text">
            <label class="mtc-form-label">内容  <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <textarea class="mtc-textarea mtc-hide" name="noticeContent" id="content" required>${notice.noticeContent}</textarea>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">Order </label>
            <div class="mtc-input-inline">
                <input type="number" name="noticeOrder" value="${notice.noticeOrder}"class="mtc-input" min="0" max="10" >
            </div>
            <div class="mtc-form-mid mtc-word-aux">输入1-10的数字,order越大排序越前</div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">状态</label>
            <div class="mtc-input-block">
                <input type="radio" name="noticeStatus" value="1" title="显示" <c:if test="${notice.noticeStatus==1}">checked</c:if>>
                <input type="radio" name="noticeStatus" value="0" title="隐藏" <c:if test="${notice.noticeStatus==0}">checked</c:if>>
            </div>

        </div>
        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit="" lay-filter="" type="submit">保存</button>
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
