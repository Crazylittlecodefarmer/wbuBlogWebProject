<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 编辑用户
</rapid:override>
<rapid:override name="header-style">
    <style>
        .mtc-form-item .mtc-input-inline {
            width: 300px;
        }
        .mtc-form-label {
            width: 120px;
        }
        .mtc-word-aux {
            color: #FF5722 !important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="mtc-elem-quote">
         <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/user">用户列表</a>
              <a><cite>编辑用户</cite></a>
        </span>
    </blockquote>
    <br><br>
    <form class="mtc-form" action="/admin/user/editSubmit" id="userForm"
          method="post">
        <input type="hidden" name="userId" id="userId" value="${user.userId}">
        <div class="mtc-form-item">
            <label class="mtc-form-label">头像</label>
            <div class="mtc-input-inline">
                <div class="mtc-upload">
                    <div class="mtc-upload-list" style="">
                        <img class="mtc-upload-img" src="${user.userAvatar}" id="demo1" width="100"
                             height="100">
                        <p id="demoText"></p>
                    </div>
                    <button type="button" class="mtc-btn" id="test1">上传图片</button>
                    <input type="hidden" name="userAvatar" id="userAvatar" value="${user.userAvatar}">
                </div>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">用户名 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-inline">
                <input type="text" value="${user.userName}" name="userName" id="userName" required
                       lay-verify="userName"
                       autocomplete="off" class="mtc-input" onblur="checkUserName()">
            </div>
            <div class="mtc-form-mid mtc-word-aux" id="userNameTips"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">密码 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-inline">
                <input type="password" name="userPass" value="${user.userPass}" id="userPass" required
                       autocomplete="off" class="mtc-input" min="3" max="20">
            </div>
            <div class="mtc-form-mid mtc-word-aux"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">昵称 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-inline">
                <input type="text" name="userNickname" value="${user.userNickname}" required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="mtc-input">
            </div>
            <div class="mtc-form-mid mtc-word-aux"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">Email <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-inline">
                <input type="email" name="userEmail" value="${user.userEmail}" id="userEmail" required
                       lay-verify="userEmail"
                       class="mtc-input" onblur="checkUserEmail()">
            </div>
            <div class="mtc-form-mid mtc-word-aux" id="userEmailTips"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">URL </label>
            <div class="mtc-input-inline">
                <input type="url" name="userUrl" value="${user.userUrl}" placeholder="" autocomplete="off"
                       class="mtc-input">
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">状态</label>
            <div class="mtc-input-block">
                <input type="radio" name="userStatus" value="1" title="正常" <c:if test="${user.userStatus==1}">checked</c:if>>
                <input type="radio" name="userStatus" value="0" title="禁用" <c:if test="${user.userStatus==0}">checked</c:if>>
            </div>
        </div>
        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit lay-filter="demo1" id="submit-btn">保存</button>
                <button type="reset" class="mtc-btn mtc-btn-primary">重置</button>
            </div>
        </div>
    </form>


</rapid:override>
<rapid:override name="footer-script">

    <script>
        //上传图片
        mtc.use('upload', function () {
            var $ = mtc.jquery,
                upload = mtc.upload;
            var uploadInst = upload.render({
                elem: '#test1',
                url: '/admin/upload/img',
                before: function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result);
                    });
                },
                done: function (res) {
                    $("#userAvatar").attr("value", res.data.src);
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                },
                error: function () {
                    var demoText = $('#demoText');
                    demoText.html('' +
                        '<span style="color: #FF5722;">上传失败</span>' +
                        ' <a class="mtc-btn mtc-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });

        });
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
