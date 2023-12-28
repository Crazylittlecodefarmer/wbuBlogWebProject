<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
       - 菜单列表
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
          <a><cite>菜单内容列表</cite></a>
        </span>
    </blockquote>

    <div class="mtc-row">
        <div class="mtc-col-md4">
            <form class="mtc-form"  method="post" id="myForm" action="/admin/menu/insertSubmit">
                <div class="mtc-form-item">
                    <div class="mtc-input-block">
                        <strong>添加菜单项目</strong>
                    </div>
                    <div class="mtc-input-block">
                        名称
                        <span style="color: #FF5722; ">*</span>
                        <input type="text" name="menuName" placeholder="如：如留言板" autocomplete="off" class="mtc-input" required>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        URL
                        <span style="color: #FF5722; ">*</span>
                        <input type="text" name="menuUrl" placeholder="如：http://liuyanzhao.com/message.html" autocomplete="off" class="mtc-input" >
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        图标
                        <input type="text" name="menuIcon" placeholder="如：fa fa-comment" autocomplete="off" class="mtc-input" >
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        菜单位置
                        <select name="menuLevel" id="">
                            <option value="1" selected>顶部菜单</option>
                            <option value="2" >主要菜单</option>
                        </select>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        <button class="mtc-btn" lay-filter="formDemo" type="submit">添加</button>
                    </div>
                </div>
            </form>
            <blockquote class="mtc-elem-quote mtc-quote-nm">
                温馨提示：
                <ul>
                    <li>1、图标为名称前面的字体图标，可选。采用的是<a href="http://fontawesome.io/icons/" target="_blank">fontawesome</a>图标</li>
                    <li>2、目前只有两种菜单：顶部菜单和主要菜单</li>
                </ul>
            </blockquote>
        </div>
        <div class="mtc-col-md8">

            <div class="mtc-tab mtc-tab-card">
                <ul class="mtc-tab-title">
                    <li class="mtc-this">顶部菜单</li>
                    <li>主要菜单</li>
                </ul>
                <div class="mtc-tab-content" style="height: auto;">
                    <div class="mtc-tab-item mtc-show">

                        <table class="mtc-table" >
                            <colgroup>
                                <col width="100">
                                <col width="200">
                                <col width="50">
                                <col width="100">
                                <col width="50">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>名称</th>
                                <th>URL</th>
                                <th>Order</th>
                                <th>操作</th>
                                <th>ID</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${menuList}" var="m">
                                <c:if test="${m.menuLevel == 1}">
                                <tr>
                                    <td>
                                        <i class="${m.menuIcon}"></i>
                                            ${m.menuName}
                                    </td>
                                    <td>
                                        <a href="${m.menuUrl}" target="_blank">${m.menuUrl}</a>
                                    </td>
                                    <td>${m.menuOrder}</td>
                                    <td>
                                        <a href="/admin/menu/edit/${m.menuId}" class="mtc-btn mtc-btn-mini" title="点击编辑">编辑</a>
                                        <a href="/admin/menu/delete/${m.menuId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" title="点击删除" onclick="return confirmDelete()">删除</a>
                                    </td>
                                    <td >${m.menuId}</td>
                                </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                        <blockquote class="mtc-elem-quote mtc-quote-nm">
                            温馨提示：
                            <ul>
                                <li>1、Order的大小为菜单中各项目的顺序</li>
                            </ul>
                        </blockquote>
                    </div>
                    <div class="mtc-tab-item">
                        <table class="mtc-table" >
                            <colgroup>
                                <col width="100">
                                <col width="200">
                                <col width="50">
                                <col width="100">
                                <col width="50">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>名称</th>
                                <th>URL</th>
                                <th>Order</th>
                                <th>操作</th>
                                <th>ID</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${menuList}" var="m">
                                <c:if test="${m.menuLevel == 2}">
                                    <tr>
                                        <td>
                                            <i class="${m.menuIcon}"></i>
                                                ${m.menuName}
                                        </td>
                                        <td>
                                            <a href="${m.menuUrl}" target="_blank">${m.menuUrl}</a>
                                        </td>
                                        <td>${m.menuOrder}</td>
                                        <td>
                                            <a href="/admin/menu/edit/${m.menuId}" class="mtc-btn mtc-btn-mini">编辑</a>
                                            <a href="/admin/menu/delete/${m.menuId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>
                                        </td>
                                        <td >${m.menuId}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                        <blockquote class="mtc-elem-quote mtc-quote-nm">
                            温馨提示：
                            <ul>
                                <li>1、Order的大小为菜单中各项目的顺序</li>
                                <li>2、主要菜单的分类目录是默认显示的</li>
                            </ul>
                        </blockquote>
                    </div>
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>



</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
