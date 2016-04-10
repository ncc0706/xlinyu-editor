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
	
	
	// 表情的使用
	config.smiley_columns = 8;
	config.smiley_path = CKEDITOR.basePath + 'plugins/smiley/qq/';
	// 写个程序变量下表情包
	config.smiley_images = ['1.gif','10.gif','100.gif','11.gif','12.gif','13.gif','14.gif','15.gif','16.gif','17.gif','18.gif','19.gif','2.gif','20.gif','21.gif','22.gif','23.gif','24.gif','25.gif','26.gif','27.gif','28.gif','29.gif','3.gif','30.gif','31.gif','32.gif','33.gif','34.gif','35.gif','36.gif','37.gif','38.gif','39.gif','4.gif','40.gif','41.gif','42.gif','43.gif','44.gif','45.gif','46.gif','47.gif','48.gif','49.gif','5.gif','50.gif','51.gif','52.gif','53.gif','54.gif','55.gif','56.gif','57.gif','58.gif','59.gif','6.gif','60.gif','61.gif','62.gif','63.gif','64.gif','65.gif','66.gif','67.gif','68.gif','69.gif','7.gif','70.gif','71.gif','72.gif','73.gif','74.gif','75.gif','76.gif','77.gif','78.gif','79.gif','8.gif','80.gif','81.gif','82.gif','83.gif','84.gif','85.gif','86.gif','87.gif','88.gif','89.gif','9.gif','90.gif','91.gif','92.gif','93.gif','94.gif','95.gif','96.gif','97.gif','98.gif','99.gif'];
	//editor.css 添加样式出现滚动条
	//.cke_dialog_ui_html{height:350px;overflow:auto;}
	
}