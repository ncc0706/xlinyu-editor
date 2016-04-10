package com.xlinyu.web.base.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.support.XmlWebApplicationContext;

@Controller
@RequestMapping("/reload")
public class ReloadController {

	private static Logger logger = Logger.getLogger(ReloadController.class);
	
	@ResponseBody
	@RequestMapping("/properties")
	public void reloadProperties(HttpServletRequest request){
		
		logger.info(".....start......reload.......");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		ServletContext sc = request.getSession().getServletContext();
		XmlWebApplicationContext context = (XmlWebApplicationContext)WebApplicationContextUtils.getWebApplicationContext(sc);
		
		logger.info("上次读取配置时间: " + sdf.format(new Date(context.getStartupDate())));
		context.refresh();
		logger.info("本次读取配置时间: " + sdf.format(new Date(context.getStartupDate()))); 
		
		logger.info(".....reload........ok.......");
	}
}
