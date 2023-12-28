<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="header-style">
    <style>
        .entry-title {
            background: #f8f8f8;
        }
    </style>
    <link rel="stylesheet" href="/plugin/mtc/css/mtc.css">
</rapid:override>


<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <i class="fa fa-angle-right"></i>
        申请友链
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">
    <%--博客主体-左侧文章正文 start--%>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" style="min-height: 500px;">
                <header class="entry-header">
                    <h1 class="entry-title">
                           申请友链
                    </h1>
                </header><!-- .entry-header -->
                <div class="entry-content">
                    <div class="single-content">
                        <form class="mtc-form mtc-form-pane" id="applyLinkForm"  method="post">
                            <div class="mtc-form-item">
                                <label class="mtc-form-label">网站名称</label>
                                <div class="mtc-input-block">
                                    <input type="text" name="linkName"  placeholder="如：${options.optionSiteTitle}" class="mtc-input" required>
                                </div>
                            </div>
                            <div class="mtc-form-item">
                                <label class="mtc-form-label">网站地址</label>
                                <div class="mtc-input-block">
                                    <input type="url" name="linkUrl"  placeholder="如：" class="mtc-input" required>
                                </div>
                            </div>
                            <div class="mtc-form-item">
                                <label class="mtc-form-label">网站描述</label>
                                <div class="mtc-input-block">
                                    <input type="text" name="linkDescription" placeholder="如：${options.optionSiteDescrption}" class="mtc-input" required>
                                </div>
                            </div>

                            <div class="mtc-form-item mtc-form-text">
                                <label class="mtc-form-label">备注</label>
                                <div class="mtc-input-block">
                                    <textarea placeholder="申请原因和联系方式" class="mtc-textarea" name="linkOwnerContact" maxlength="100"></textarea>
                                </div>
                            </div>
                            <div class="mtc-form-item">
                                <button class="mtc-btn" lay-submit="">提交申请</button>
                            </div>
                        </form>


                    </div>

                    <br><br>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <li class="r-hide">
                                <a href="javascript:pr()" title="侧边栏">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article><!-- #post -->



        </main>
        <!-- .site-main -->
    </div>
    <%--博客主体-左侧文章正文end--%>
</rapid:override>

<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-3.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>