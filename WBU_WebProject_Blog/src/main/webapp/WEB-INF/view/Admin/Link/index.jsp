<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 链接列表
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 mtc*/

        .mtc-table {
            margin-top: 0;
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
              <a><cite>链接列表</cite></a>
        </span>
    </blockquote>

    <table class="mtc-table" >
        <colgroup>
            <col width="100">
            <col width=50">
            <col width="100">
            <col width="100">
            <col width="50">
            <col width="50">
            <col width="100">
            <col width="50">
        </colgroup>
        <thead>
        <tr>
            <th>名称</th>
            <th>URL</th>
            <th>联系方式</th>
            <th>创建时间</th>
            <th>Order</th>
            <th>状态</th>
            <th>操作</th>
            <th>ID</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${linkList}" var="l">
            <tr>
                <td>
                    ${l.linkName}
                </td>
                <td >
                    <a href="${l.linkUrl}" target="_blank">${l.linkUrl}</a>
                </td>
                <td>
                    ${l.linkOwnerContact}
                </td>
                <td>
                      <fmt:formatDate value="${l.linkUpdateTime}" pattern="yyyy年MM月dd日"/>
                </td>
                <td>
                    ${l.linkOrder}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${l.linkStatus==1}">
                            显示
                        </c:when>
                        <c:otherwise>
                            <span style="color:#FF5722;">隐藏</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="/admin/link/edit/${l.linkId}" class="mtc-btn mtc-btn-mini">编辑</a>
                    <a href="/admin/link/delete/${l.linkId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>
                </td>
                <td>${l.linkId}</td>
            </tr>

        </c:forEach>
        </tbody>
    </table>





</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
