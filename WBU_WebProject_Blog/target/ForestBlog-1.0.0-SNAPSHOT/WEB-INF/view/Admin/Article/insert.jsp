<%--保留此处 start--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%--保留此处 end--%>
    <rapid:override name="title">
        - 新建文章
    </rapid:override>

<rapid:override name="content">
    <blockquote class="mtc-elem-quote">
         <span class="mtc-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/article">文章列表</a>
              <a><cite>添加文章</cite></a>
        </span>
    </blockquote>



    <form class="mtc-form"  method="post" id="myForm" action="/admin/article/insertSubmit">

        <div class="mtc-form-item">
            <label class="mtc-form-label">标题 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <input type="text" name="articleTitle" lay-verify="title" id="title" autocomplete="off" placeholder="请输入标题" class="mtc-input">
            </div>
        </div>

        <div class="mtc-form-item mtc-form-text">
            <label class="mtc-form-label">内容 <span style="color: #FF5722; ">*</span></label>
            <div class="mtc-input-block">
                <textarea class="mtc-textarea mtc-hide" name="articleContent" lay-verify="content" id="content"></textarea>
            </div>

        </div>

        <div class="mtc-form-item">
            <label class="mtc-form-label">分类 <span style="color: #FF5722; ">*</span> </label>
            <div class="mtc-input-inline">
                <select name="articleParentCategoryId" id="articleParentCategoryId" lay-filter="articleParentCategoryId" required>
                    <option value="" selected="">一级分类</option>
                    <c:forEach items="${categoryList}" var="c">
                        <c:if test="${c.categoryPid==0}">
                            <option value="${c.categoryId}">${c.categoryName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="mtc-input-inline">
                <select name="articleChildCategoryId" id="articleChildCategoryId">
                    <option value="" selected>二级分类</option>
                </select>
            </div>
        </div>

        <div class="mtc-form-item" pane="">
            <label class="mtc-form-label">标签</label>
            <div class="mtc-input-block">
                <c:forEach items="${tagList}" var="t">
                    <input type="checkbox" name="articleTagIds" lay-skin="primary" title="${t.tagName}" value="${t.tagId}">
                </c:forEach>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">缩略图</label>
            <div class="mtc-input-inline">
                <div class="mtc-upload">
                    <div class="mtc-upload-list" style="">
                        <img class="mtc-upload-img"  id="demo1" width="100"
                             height="100">
                        <p id="demoText"></p>
                    </div>
                    <button type="button" class="mtc-btn" id="test1">上传图片</button>
                    <input type="hidden" name="articleThumbnail" id="articleThumbnail" >
                </div>
            </div>
        </div>
        <div class="mtc-form-item">
            <label class="mtc-form-label">状态</label>
            <div class="mtc-input-block">
                <input type="radio" name="articleStatus" value="1" title="发布" checked>
                <input type="radio" name="articleStatus" value="0" title="草稿" >
            </div>
        </div>
        <div class="mtc-form-item">
            <div class="mtc-input-block">
                <button class="mtc-btn" lay-submit="" lay-filter="demo1">立即提交</button>
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
                    $("#articleThumbnail").attr("value", res.data.src);
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

    <script>
        mtc.use(['form', 'layedit', 'laydate'], function() {
            var form = mtc.form
                , layer = mtc.layer
                , layedit = mtc.layedit
                , laydate = mtc.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                     url: '/admin/upload/img' //接口url
                    ,type: 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            layedit.build('content', {
                tool: [
                    'strong' //加粗
                    ,'italic' //斜体
                    ,'underline' //下划线
                    ,'del' //删除线
                    ,'|' //分割线
                    ,'left' //左对齐
                    ,'center' //居中对齐
                    ,'right' //右对齐
                    ,'link' //超链接
                    ,'unlink' //清除链接
                    ,'face' //表情
                    ,'image' //插入图片
                    ,'code'
                ]
            });

            mtc.use('code', function(){ //加载code模块
                mtc.code();
            });

            //二级联动
            form.on("select(articleParentCategoryId)",function () {
                var optionstring = "";
                var articleParentCategoryId = $("#articleParentCategoryId").val();
                <c:forEach items="${categoryList}" var="c">
                if(articleParentCategoryId==${c.categoryPid}) {
                    optionstring += "<option name='childCategory' value='${c.categoryId}'>${c.categoryName}</option>";
                }
                </c:forEach>
                $("#articleChildCategoryId").html("<option value=''selected>二级分类</option>"+optionstring);
                form.render('select'); //这个很重要
            })

     });
//        window.onbeforeunload = function() {
//            return "确认离开当前页面吗？未保存的数据将会丢失";
//        }



    </script>

</rapid:override>


<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp"%>
