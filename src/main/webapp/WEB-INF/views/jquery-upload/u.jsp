<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<!-- Force latest IE rendering engine or ChromeFrame if installed -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
<meta charset="utf-8">
<title>jQuery File Upload Demo</title>
<meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/jquery-upload/css/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/jquery-upload/css/style.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/jquery-upload/css/blueimp-gallery.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/jquery-upload/css/jquery.fileupload.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/jquery-upload/css/jquery.fileupload-ui.css">

</head>
<body>
<div class="container">
    
    <form id="fileupload" action="#" method="POST" enctype="multipart/form-data">
        <input type="hidden" id="path" value="${pageContext.request.contextPath }" />
        <div class="row fileupload-buttonbar">
            <div class="col-lg-7">
                
                <span class="btn btn-success fileinput-button">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>选择文件</span>
                    <input type="file" name="files[]" multiple>
                </span>
                <button type="submit" class="btn btn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>开始上传</span>
                </button>
                <button type="reset" class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>取消上传</span>
                </button>
                <button type="button" class="btn btn-danger delete">
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>删除</span>
                </button>
                <input type="checkbox" class="toggle">
                <!-- <span class="fileupload-process"></span> -->
            </div>
            
            <div class="col-lg-5 fileupload-progress fade">
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                </div>
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
    </form>
    
</div>

<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>

<!-- 显示可上传的模板 -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>上传1111111</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>取消</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>取消。。。。。</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery/jquery.min.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/vendor/jquery.ui.widget.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/network/tmpl.min.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/network/load-image.all.min.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/network/canvas-to-blob.min.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/network/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/network/jquery.blueimp-gallery.min.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.iframe-transport.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload-process.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload-image.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload-audio.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload-video.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload-validate.js"></script>

<script src="${pageContext.request.contextPath }/static/jquery-upload/js/jquery.fileupload-ui.js"></script>
<!-- 入口脚本 -->
<script src="${pageContext.request.contextPath }/static/jquery-upload/js/main.js"></script>

</body>
</html>