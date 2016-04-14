package com.xlinyu.web.upload;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/jquery-upload")
public class JqueryUploadController {

	
	
	/**
	 * 跳转到jquery上传页面
	 */
	@RequestMapping(value = "/u", method = RequestMethod.GET)
	public String toJqueryUpload(){
		
		return "jquery-upload/u";
	}
	
	@RequestMapping(value = "/u", method = RequestMethod.POST)
	public void jqueryUpload(){
		
	}
	
}
