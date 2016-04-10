package com.xlinyu.web.base.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	private static final Logger logger = Logger.getLogger(IndexController.class);
	
	@RequestMapping({"/", "/index", "/home"})
	public String index(){
		
		logger.info(".......首页.........");
		
		return "index";
	}
	
}
