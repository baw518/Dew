package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.dew.model.service.DiscussService;
import org.kosta.dew.model.vo.DiscussVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DiscussController {
	@Resource(name="discussServiceImpl")
	private DiscussService discussService;
	/**
	 * 토론방 리스트 뷰
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("discussion_listView.do")
	public ModelAndView getAllDiscussList(String pageNo){
		System.out.println("토론방 컨트롤러");
		System.out.println(pageNo);
		return new ModelAndView("discussion_listView","dslvo",discussService.getAllDiscussList(pageNo));
	}
	@RequestMapping("findDiscussContent.do")
	public ModelAndView findDiscussContent(HttpServletRequest request){
		String no = request.getParameter("no");
		System.out.println(no);
		DiscussVO dsvo  = discussService.findDiscussContent(no);
		System.out.println(dsvo);
		return new ModelAndView("discussion_show_discussion","dsvo",dsvo);
	}
}
