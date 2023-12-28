<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="com.Mingtc.ssm.blog.util.MyUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 评论列表
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 mtc*/

        .mtc-btn {
            margin: 2px 0 !important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="mtc-elem-quote">
        <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/comment">评论列表</a>
              <a><cite>编辑评论</cite></a>
        </span>
    </blockquote>

    <form class="mtc-form"  method="post" id="myForm" action="/admin/comment/editSubmit">
        <input type="hidden" name="commentId" value="${comment.commentId}">
        <div class="mtc-form-item">
            <label class="mtc-form-label">昵称 </label>
            <div class="mtc-input-block">
                <input type="text" name="commentAuthorName"  value="${comment.commentAuthorName}" class="mtc-input">
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">邮箱 </label>
            <div class="mtc-input-block">
                <input type="text" name="commentAuthorEmail"  value="${comment.commentAuthorEmail}" class="mtc-input">
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">网址 </label>
            <div class="mtc-input-block">
                <input type="text" name="commentAuthorUrl"  value="${comment.commentAuthorUrl}" class="mtc-input">
            </div>
        </div>
        <div class="mtc-form-item mtc-form-text">
            <label class="mtc-form-label">内容</label>
            <div class="mtc-input-block">
                <textarea name="commentContent"  class="mtc-textarea">${comment.commentContent}</textarea>
            </div>
        </div>

        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit="" lay-filter="demo1">保存</button>
                <button type="reset" class="mtc-btn mtc-btn-primary" >重置</button>
            </div>
        </div>

    </form>


</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>