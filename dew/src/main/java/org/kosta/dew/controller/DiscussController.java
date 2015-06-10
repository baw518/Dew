package org.kosta.dew.controller;

import javax.annotation.Resource;

import org.kosta.dew.model.service.DiscussService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DiscussController {
	@Resource(name="discussServiceImpl")
	private DiscussService discussService;
	@RequestMapping("show_Discussion_list.do")
	public ModelAndView getAllDiscussList(String pageNo){
		System.out.println("토론방 컨트롤러");
		System.out.println(pageNo);
		return new ModelAndView("discussion_show_Discussion_list","dslvo",discussService.getAllDiscussList(pageNo));
	}
}
