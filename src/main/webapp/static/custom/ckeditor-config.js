CKEDITOR.editorConfig = function( config ){
//	config.width = 700;
	config.uiColor = '#D6FCE1';// AADC6E
//	config.language = 'en';
	config.startupFocus = true; // 获取焦点
	
	// 修改换行符
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	
	// 取消 "拖拽以改变尺寸"功能 plugins/resize/plugin.js
	config.resize_enabled = false;
	//CKFinder.SetupCKEditor(null, '/ckfinder/'); 
	
	// 去掉预览
	config.image_previewText = " ";
	
	//提示这里的type=image表示开启的图片上传功能。Flash，file上传的默认控件打开配置方式相同只是type不同
	/*
	 * config.filebrowserUploadUrl = 'upload.do?type=File';
	 * config.filebrowserImageUploadUrl = 'upload.do?type=Image';
	 * config.filebrowserFlashUploadUrl = 'upload.do?type=Flash';
	 * */
	config.filebrowserImageUploadUrl = '../upload/upload_ckeditor?type=Image';
	
}