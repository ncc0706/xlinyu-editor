CKEDITOR.editorConfig = function( config ){
//	config.width = 700;
	config.uiColor = '#D6FCE1';// AADC6E
	config.toolbar = 'Basic';
//	config.language = 'en';
	config.startupFocus = true; // 获取焦点
	
	// 取消 "拖拽以改变尺寸"功能 plugins/resize/plugin.js
	config.resize_enabled = false;
	//CKFinder.SetupCKEditor(null, '/ckfinder/'); 
	
}