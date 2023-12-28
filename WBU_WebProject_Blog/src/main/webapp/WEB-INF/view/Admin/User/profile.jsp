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

        .mtc-word-aux {
            color: #FF5722 !important;
        }
        .mtc-form-label {
            width: 120px;
        }
        input {
            border: 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="mtc-elem-quote">
         <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/user">用户列表</a>
              <c:choose>
                  <c:when test="${sessionScope.user.userId==user.userId}">
                      <a><cite>个人信息</cite></a>
                  </c:when>
                  <c:otherwise>
                      <a><cite>用户信息</cite></a>
                  </c:otherwise>
              </c:choose>
        </span>
    </blockquote>
    <br><br>
    <form class="mtc-form" action="/admin/profile/save" id="userForm"
          method="post">
        <div class="mtc-form-item">
            <a class="mtc-btn mtc-btn-primary"  href="/admin/profile/edit">编辑</a>
            <label class="mtc-form-label">头像</label>
            <div class="mtc-input-inline">
                <div class="mtc-upload">
                    <div class="mtc-upload-list" style="">
                        <img class="mtc-upload-img" src="${user.userAvatar}" id="demo1" width="100"
                             height="100">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">用户名 </label>
            <div class="mtc-input-inline">
                <input type="text" value="${user.userName}"  id="userName" required
                       autocomplete="off" class="mtc-input" disabled>
            </div>
            <div class="mtc-form-mid mtc-word-aux" id="userNameTips"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">密码 </label>
            <div class="mtc-input-inline">
                <input type="password" value="${user.userPass}" id="userPass" required
                       autocomplete="off" class="mtc-input" min="3" max="20" disabled>
            </div>
            <div class="mtc-form-mid mtc-word-aux"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">昵称 </label>
            <div class="mtc-input-inline">
                <input type="text"  value="${user.userNickname}" required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="mtc-input" disabled>
            </div>
            <div class="mtc-form-mid mtc-word-aux"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">Email </label>
            <div class="mtc-input-inline">
                <input type="email"  value="${user.userEmail}" id="userEmail" required
                       class="mtc-input" disabled>
            </div>
            <div class="mtc-form-mid mtc-word-aux" id="userEmailTips"></div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">URL </label>
            <div class="mtc-input-inline">
                <input type="url"  value="${user.userUrl}" placeholder="" autocomplete="off"
                       class="mtc-input" disabled>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">注册时间 </label>
            <div class="mtc-input-inline">
                <input type="text"  value="<fmt:formatDate value="${user.userRegisterTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
" placeholder="" autocomplete="off"
                       class="mtc-input" disabled>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">最后登录时间 </label>
            <div class="mtc-input-inline">
                <input type="text"  value='<fmt:formatDate value="${user.userLastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
' placeholder="" autocomplete="off"
                       class="mtc-input" disabled>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">最后登录IP </label>
            <div class="mtc-input-inline">
                <input type="text"  value="${user.userLastLoginIp}" placeholder="" autocomplete="off"
                       class="mtc-input" disabled>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">状态 </label>
            <div class="mtc-input-inline">
                <input type="text"  value='<c:choose>
                    <c:when test="${user.userStatus==0}">禁用
                    </c:when>
                    <c:otherwise>正常
                    </c:otherwise>
                </c:choose>' placeholder="" autocomplete="off"
                       class="mtc-input" disabled>
            </div>
        </div>
    </form>

</rapid:override>
<rapid:override name="footer-script">

    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
