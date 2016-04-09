<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ckeditor.CKEditorConfig"%>    
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>${pageContext.request.contextPath }</title>
	<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath }/static/ckeditor/ckeditor.js"></script>
	
	</head>
<body>
<!-- <form>
    <textarea name="editor1" id="editor1" rows="10" cols="80">
        This is my textarea to be replaced with CKEditor.
    </textarea>
</form> -->

<form action="${pageContext.request.contextPath}/news/add" method="post">
标题:<input name="title" type="text"/><p/>
内容:<textarea name="content" id="editor" name="editor" rows="5" cols="20"></textarea>
<label>公告</label>:<input type="radio" name="ntype" value="1"/>
<label>新闻</label>:<input type="radio" name="ntype" value="2"/>
<input type="submit" value="添加">
</form>

</body>
<script type="text/javascript" charset="UTF-8">
	(function(){
		CKEDITOR.replace('editor', {
			customConfig:'${pageContext.request.contextPath }/static/custom/ckeditor-config.js'
		});
	})()
</script>
</html>