package com.xlinyu.web.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xlinyu.web.news.model.News;

@Controller
@RequestMapping("/news")
public class NewsController {

	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addNews(News news){
		
		System.out.println(news);
		
		return "news/news_list";
	}
	
}
