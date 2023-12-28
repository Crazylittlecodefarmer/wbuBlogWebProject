<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 公告列表
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
          <a><cite>公告列表</cite></a>
        </span>
    </blockquote>


            <table class="mtc-table" >
                <colgroup>
                    <col width="400">
                    <col width="50">
                    <col width="100">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>标题</th>
                    <th>Order</th>
                    <th>状态</th>
                    <th>操作</th>
                    <td>ID</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${noticeList}" var="c">

                    <tr>
                        <td>
                            <a href="/notice/${c.noticeId}" target="_blank">${c.noticeTitle}</a>
                        </td>
                        <td>
                                ${c.noticeOrder}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${c.noticeStatus == 1}">
                                    显示
                                </c:when>
                                <c:otherwise>
                                    <span style="color:#FF5722;">隐藏</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/admin/notice/edit/${c.noticeId}" class="mtc-btn mtc-btn-mini">编辑</a>
                            <a href="/admin/notice/delete/${c.noticeId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>
                        </td>
                        <td >${c.noticeId}</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
            <blockquote class="mtc-elem-quote mtc-quote-nm">
                温馨提示：
                <ul>
                    <li>Order的大小决定显示的顺序</li>
                </ul>
            </blockquote>


</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
