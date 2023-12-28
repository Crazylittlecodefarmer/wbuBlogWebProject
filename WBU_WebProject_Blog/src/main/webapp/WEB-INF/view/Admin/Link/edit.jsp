<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 编辑链接
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
              <a href="/admin/link">链接列表</a>
              <a><cite>编辑链接</cite></a>
        </span>
    </blockquote>
    <div class="mtc-row">
        <div class="mtc-col-md4">
            <form class="mtc-form" method="post" id="myForm" action="/admin/link/editSubmit">
                <div class="mtc-form-item">
                    <div class="mtc-input-block">
                        <strong>编辑标签</strong>
                    </div>
                    <input type="hidden" name="linkId" value="${linkCustom.linkId}">
                    <div class="mtc-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkName" value="${linkCustom.linkName}" autocomplete="off" class="mtc-input" required>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        URL  <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkUrl" value="${linkCustom.linkUrl}" autocomplete="off" class="mtc-input" required>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        联系方式
                        <input type="text" name="linkOwnerContact" value="${linkCustom.linkOwnerContact}" autocomplete="off" class="mtc-input" >
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        描述
                        <input type="text" name="linkDescription" value="${linkCustom.linkDescription}" autocomplete="off" class="mtc-input" >
                    </div>

                    <br>
                    <div class="mtc-input-block">
                         Order
                        <input type="number" name="linkOrder" value="${linkCustom.linkOrder}" autocomplete="off" class="mtc-input" min="0" max="10">
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        状态 <br>
                        <input type="radio" name="linkStatus" value="1" title="显示" <c:if test="${linkCustom.linkStatus==1}">checked</c:if>>
                        <input type="radio" name="linkStatus" value="0" title="隐藏" <c:if test="${linkCustom.linkStatus==0}">checked</c:if>>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        <button class="mtc-btn" lay-filter="formDemo" type="submit">保存</button>
                    </div>
                </div>
            </form>
            <blockquote class="mtc-elem-quote mtc-quote-nm">
                温馨提示：
                <ul>
                    <li>URL：如 http://Mingtc.com</li>
                    <li>Order：默认是0，Order越大排名越靠前</li>
                </ul>
            </blockquote>
        </div>
        <div class="mtc-col-md8">
            <table class="mtc-table" >
                <colgroup>
                    <col width="50">
                    <col width="300">
                    <col width="100">
                    <col width="50">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>id</th>
                    <th>名称</th>
                    <th>URL</th>
                    <th>Order</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${linkList}" var="l">

                    <tr>
                        <td>${l.linkId}</td>
                        <td>
                            ${l.linkName}
                        </td>
                        <td>
                             ${l.linkUrl}
                        </td>
                        <td>
                            ${l.linkOrder}
                        </td>
                        <td>
                            <a href="/admin/link/edit/${l.linkId}" class="mtc-btn mtc-btn-mini">编辑</a>
                            <a href="/admin/link/delete/${l.linkId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>

                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
