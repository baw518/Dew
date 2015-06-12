package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.DiscussService;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		return new ModelAndView("discussion_listView","dslvo",discussService.getAllDiscussList(pageNo));
	}
	@RequestMapping("findDiscussContent.do")
	public ModelAndView findDiscussContent(HttpServletRequest request){
		String no = request.getParameter("no");
		DiscussVO dsvo  = discussService.findDiscussContent(no);
		return new ModelAndView("discussion_show_discussion","dsvo",dsvo);
	}
	@RequestMapping("show_discussion_comment.do")
	@ResponseBody
	public List<CommentVO> show_discussion_comment(HttpServletRequest request){
/*		CommentVO cvo = new CommentVO();*/
		String discussionNo = request.getParameter("discussionNo");
		List<CommentVO> cmlist = discussService.findDiscussComment(discussionNo);
		return cmlist;
	}
	@RequestMapping("deleteDiscussComment.do")
	@ResponseBody
	public ModelAndView deleteDiscussComment(HttpServletRequest request){
		String no = request.getParameter("no");
		String index = request.getParameter("index");
		discussService.deleteDiscussComment(no);
		return new ModelAndView("redirect:findDiscussContent.do?no="+index);
	}
	@RequestMapping("registerDiscussComment.do")
	public ModelAndView registerDiscussComment(HttpServletRequest request){
		int discussionNo = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		discussService.registerDiscussComment(new CommentVO(discussionNo, id, content));
		return new ModelAndView("redirect:findDiscussContent.do?no="+discussionNo);
	}
}
