<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>${pageContext.request.contextPath }</title>
	<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath }/static/ckeditor/ckeditor.js"></script>
	
	</head>
<body>
<form>
    <textarea name="editor1" id="editor1" rows="10" cols="80">
        This is my textarea to be replaced with CKEditor.
    </textarea>
</form>
</body>
<script type="text/javascript" charset="UTF-8">
	(function(){
		CKEDITOR.replace('editor1', {
			customConfig:'${pageContext.request.contextPath }/static/custom/ckeditor-config.js'
		});
	})()
</script>
</html>