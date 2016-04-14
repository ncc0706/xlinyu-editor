# 富文本编辑器

## ckeditor

下载地址：http://ckeditor.com/download

> 下载了完整的程序之后，先要对程序中的不必要的东西进行删除。凡是文件名或文件夹名前面有"\_"的文件或文件夹都可以删除，这些文件是一些说明文件或者实例文件。另外，./lang文件夹中，只保留：zh_cn.js，en.js文件即可，这个文件夹是程序的语言包，因为其它语言大家用不到，放在那里也占用空间，所以删掉。./skins文件夹是编辑器的界面，根据情况保留至少一个文件夹即可，其中kama是可自定颜色UI的文件，建议保留，当然如果不在乎空间大小的话，也可以全部上传。


### 安装

在页面<head\>中引入ckeditor核心文件ckeditor.js 
``` javascript 
<script type="text/javascript" src="ckeditor/ckeditor.js"\></script>
```
在需要调用的地方写一个textarea控件
``` html 
<textarea name="comment"  id="comment" rows="27" cols="80"></textarea>
```

让ckeditor替换textarea
``` javascript
<script type="text/javascript" charset="UTF-8">
	(function(){
		CKEDITOR.replace('editor1', {
			customConfig:'${pageContext.request.contextPath }/static/custom/ckeditor-config.js'
		});
	})()
</script>
```

去掉预览中的英语
``` javascript
config.image_previewText = '外联图片请直接输入图片地址。';
```

打开ckeditor默认的图片上传控件


### 安装jar

mvn install:install-file -DgroupId=com.ckeditor -DartifactId=ckeditor-java-core -Dversion=3.5.3 -Dpackaging=jar -Dfile=ckeditor-java-core-3.5.3.jar


## 文件上传

https://blueimp.github.io/jQuery-File-Upload/


