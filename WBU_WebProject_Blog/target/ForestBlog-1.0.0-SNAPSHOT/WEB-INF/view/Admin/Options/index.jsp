<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 基本信息列表
    </rapid:override>
<rapid:override name="header-style">
    <style>
    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="mtc-elem-quote">
        <span class="mtc-breadcrumb" lay-separator="/">
          <a href="/admin">首页</a>
          <a><cite>基本信息</cite></a>
        </span>
    </blockquote>
    <form class="mtc-form" action="/admin/options/editSubmit" method="post">

    <div class="mtc-tab mtc-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="mtc-tab-title">
            <li class="mtc-this">基本信息</li>
            <li>小工具</li>
        </ul>
        <div class="mtc-tab-content">
            <br><br>
            <c:choose>
                <c:when test="${option.optionId>0}">
                    <input type="hidden" name="optionId" value="${option.optionId}">
                </c:when>
                <c:otherwise>
                    <%--给一个默认值，这个地方很奇怪，本来不需要加的--%>
                    <input type="hidden" name="optionId" value="1">
                </c:otherwise>
            </c:choose>

            <div class="mtc-tab-item mtc-show">
                <div class="mtc-form-item">
                    <label class="mtc-form-label">站点名称</label>
                    <div class="mtc-input-inline">
                        <input type="text" name="optionSiteTitle"  value="${option.optionSiteTitle}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">站点描述</label>
                    <div class="mtc-input-block">
                        <input type="text" name="optionSiteDescrption"   value="${option.optionSiteDescrption}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">首页描述</label>
                    <div class="mtc-input-block">
                        <input type="text" name="optionMetaDescrption"  value="${option.optionMetaDescrption}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">首页关键词</label>
                    <div class="mtc-input-block">
                        <input type="text" name="optionMetaKeyword"  value="${option.optionMetaKeyword}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
            </div>
            <div class="mtc-tab-item">
                <div class="mtc-form-item">
                    <label class="mtc-form-label">头像</label>
                    <div class="mtc-input-inline">
                        <div class="mtc-upload">
                            <div class="mtc-upload-list" style="">
                                <img class="mtc-upload-img" src="${option.optionAboutsiteAvatar}" id="demo1" width="100"
                                     height="100">
                                <p id="demoText"></p>
                            </div>
                            <button type="button" class="mtc-btn" id="test1">上传图片</button>
                            <input type="hidden" id="optionAboutsiteAvatar" name="optionAboutsiteAvatar" value="${option.optionAboutsiteAvatar}">
                        </div>
                    </div>
                    <div class="mtc-form-mid mtc-word-aux">建议 150px*150px</div>

                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">昵称</label>
                    <div class="mtc-input-inline">
                        <input type="text" name="optionAboutsiteTitle"   value="${option.optionAboutsiteTitle}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">说明</label>
                    <div class="mtc-input-block">
                        <input type="text" name="optionAboutsiteContent"   value="${option.optionAboutsiteContent}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">微信二维码</label>
                    <div class="mtc-input-inline">
                        <div class="mtc-upload">
                            <div class="mtc-upload-list" style="">
                                <img class="mtc-upload-img" src="${option.optionAboutsiteWechat}" id="demo2" width="100"
                                     height="100">
                                <p id="demoText2"></p>
                            </div>
                            <button type="button" class="mtc-btn" id="test2">上传图片</button>
                            <input type="hidden" id="optionAboutsiteWechat" name="optionAboutsiteWechat" value="${option.optionAboutsiteWechat}">
                        </div>
                    </div>
                    <div class="mtc-form-mid mtc-word-aux">建议 430px*430px</div>

                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">QQ</label>
                    <div class="mtc-input-inline">
                        <input type="text" name="optionAboutsiteQq"   value="${option.optionAboutsiteQq}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">微博</label>
                    <div class="mtc-input-inline">
                        <input type="text" name="optionAboutsiteWeibo"  value="${option.optionAboutsiteWeibo}"    autocomplete="off" class="mtc-input">
                    </div>
                </div>
                <div class="mtc-form-item">
                    <label class="mtc-form-label">Github</label>
                    <div class="mtc-input-inline">
                        <input type="text" name="optionAboutsiteGithub"  value="${option.optionAboutsiteGithub}"   autocomplete="off" class="mtc-input">
                    </div>
                </div>
            </div>
        </div>

    </div>

        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit lay-filter="formDemo">保存设置</button>
            </div>
        </div>
    </form>




</rapid:override>
<rapid:override name="footer-script">
    <script>
        //上传头像
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
                    $("#optionAboutsiteAvatar").attr("value", res.data.src);
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

        //上传微信号
        mtc.use('upload', function () {
            var $ = mtc.jquery,
                upload = mtc.upload;
            var uploadInst = upload.render({
                elem: '#test2',
                url: '/admin/upload/img',
                before: function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#demo2').attr('src', result);
                    });
                },
                done: function (res) {
                    $("#optionAboutsiteWechat").attr("value", res.data.src);
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                },
                error: function () {
                    var demoText = $('#demoText2');
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

<%@ include file="../Public/framework.jsp"%>
