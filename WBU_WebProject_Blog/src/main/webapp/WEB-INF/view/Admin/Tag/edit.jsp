<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 编辑标签
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 mtc*/
        .mtc-input-block {
            margin:0px 10px;
        }
        .mtc-table {
            margin-top: 0;
        }
        .mtc-col-md4 {
            padding:10px;
        }
        .mtc-col-md8 {
            padding:10px;
        }
        .mtc-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="mtc-elem-quote">
        <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/tag">标签列表</a>
              <a><cite>编辑标签</cite></a>
        </span>
    </blockquote>
    <div class="mtc-row">
        <div class="mtc-col-md4" >
            <form class="mtc-form" method="post" id="myForm" action="/admin/tag/editSubmit">
                <div class="mtc-form-item">
                    <div class="mtc-input-block">
                        <strong>编辑标签</strong>
                    </div>
                    <input type="hidden" name="tagId" value="${tag.tagId}">
                    <div class="mtc-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="tagName" value="${tag.tagName}" autocomplete="off" class="mtc-input" required>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        标签描述
                        <input type="text" name="tagDescription" value="${tag.tagDescription}" autocomplete="off" class="mtc-input" >
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        <button class="mtc-btn" lay-filter="formDemo" type="submit">保存</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="mtc-col-md8">
            <table class="mtc-table" >
                <colgroup>
                    <col width="300">
                    <col width="50">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>名称</th>
                    <th>文章数</th>
                    <th>操作</th>
                    <th>id</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tagList}" var="c">

                    <tr>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.tagName}</a>
                        </td>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.articleCount}</a>
                        </td>
                        <td>
                            <a href="/admin/tag/edit/${c.tagId}" class="mtc-btn mtc-btn-mini">编辑</a>
                            <c:if test="${c.articleCount==0}">
                                <a href="/admin/tag/delete/${c.tagId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>
                            </c:if>
                        </td>
                        <td>${c.tagId}</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
            <blockquote class="mtc-elem-quote mtc-quote-nm">
                温馨提示：
                <ul>
                    <li>如果该分类包含文章，将不可删除</li>
                    <li>分类状态为1表示将显示在侧边栏，为0表示不显示在侧边栏(依然显示在正文)</li>
                </ul>
            </blockquote>
        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
