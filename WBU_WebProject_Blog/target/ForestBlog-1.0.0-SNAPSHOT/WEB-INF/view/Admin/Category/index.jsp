<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 分类列表
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
              <a href="/admin/category">分类列表</a>
              <a><cite>添加分类</cite></a>
        </span>
    </blockquote>
    <div class="mtc-row">
        <div class="mtc-col-md4">
            <form class="mtc-form"  method="post" id="myForm" action="/admin/category/insertSubmit">
                <div class="mtc-form-item">
                    <div class="mtc-input-block">
                        <strong>添加分类</strong>
                    </div>
                    <div class="mtc-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="categoryName" placeholder="请输入分类名称" autocomplete="off" class="mtc-input" required>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        父节点 <span style="color: #FF5722; ">*</span>
                        <select name="categoryPid" class="mtc-input" required>
                            <option value="0">无</option>
                            <c:forEach items="${categoryList}" var="c">
                                <c:if test="${c.categoryPid==0}">
                                    <option value="${c.categoryId}">${c.categoryName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        分类描述
                        <input type="text" name="categoryDescription" placeholder="请输入分类描述" autocomplete="off" class="mtc-input" >
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        图标样式
                        <input type="text" name="categoryIcon" placeholder="请输入图标样式,如 fa fa-coffee" autocomplete="off" class="mtc-input" >
                    </div>
                    <br>
                    <div class="mtc-input-block">
                        <button class="mtc-btn" lay-filter="formDemo" type="submit">添加</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="mtc-col-md8" >
            <table class="mtc-table" >
                <colgroup>
                    <col width="300">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                    <col width="50">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>名称</th>
                    <th>文章数</th>
                    <th>操作</th>
                    <th>ID</th>
                    <th>pid</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categoryList}" var="c">
                    <c:if test="${c.categoryPid==0}">
                        <tr>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.categoryName}</a>
                            </td>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.articleCount}</a>
                            </td>
                            <td>
                                <a href="/admin/category/edit/${c.categoryId}" class="mtc-btn mtc-btn-mini">编辑</a>
                                <c:if test="${c.articleCount==0}">
                                    <a href="/admin/category/delete/${c.categoryId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>
                                </c:if>
                            </td>
                            <td>${c.categoryId}</td>
                            <td>${c.categoryPid}</td>
                        </tr>
                        <c:forEach items="${categoryList}" var="c2">
                            <c:if test="${c2.categoryPid==c.categoryId}">
                                <tr>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">——${c2.categoryName}</a>
                                    </td>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">${c2.articleCount}</a>
                                    </td>
                                    <td>
                                        <a href="/admin/category/edit/${c2.categoryId}" class="mtc-btn mtc-btn-mini">编辑</a>
                                        <c:if test="${c2.articleCount==0}">
                                            <a href="/admin/category/delete/${c2.categoryId}" class="mtc-btn mtc-btn-danger mtc-btn-mini" onclick="return confirmDelete()">删除</a>
                                        </c:if>
                                    </td>
                                    <td class="cate-parent">${c2.categoryId}</td>
                                    <td>${c2.categoryPid}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:if>


                </c:forEach>
                </tbody>
            </table>
            <blockquote class="mtc-elem-quote mtc-quote-nm">
                温馨提示：
                <ul>
                    <li>分类最多只有两级，一级分类pid=0，二级分类pid=其父节点id</li>
                    <li>如果该分类包含文章，将不可删除</li>
                </ul>
            </blockquote>
        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">

</rapid:override>

<%@ include file="../Public/framework.jsp"%>
