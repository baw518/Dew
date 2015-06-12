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
		System.out.println("토론방 컨트롤러");
		System.out.println(pageNo);
		return new ModelAndView("discussion_listView","dslvo",discussService.getAllDiscussList(pageNo));
	}
	@RequestMapping("findDiscussContent.do")
	public ModelAndView findDiscussContent(HttpServletRequest request){
		String no = request.getParameter("no");
		System.out.println("파인드토론방 : " + no);
		DiscussVO dsvo  = discussService.findDiscussContent(no);
		System.out.println("파인드토론방 : "+dsvo);
		return new ModelAndView("discussion_show_discussion","dsvo",dsvo);
	}
	@RequestMapping("show_discussion_comment.do")
	@ResponseBody
	public List<CommentVO> show_discussion_comment(HttpServletRequest request){
		System.out.println("댓글");
/*		CommentVO cvo = new CommentVO();*/
		String discussionNo = request.getParameter("discussionNo");
		System.out.println(discussionNo);
		List<CommentVO> cmlist = discussService.findDiscussComment(discussionNo);
		return cmlist;
	}
	@RequestMapping("deleteDiscussComment.do")
	@ResponseBody
	public ModelAndView deleteDiscussComment(HttpServletRequest request){
		System.out.println("딜리트 댓글");
		String no = request.getParameter("no");
		String index = request.getParameter("index");
		System.out.println("no:"+no+"   index:"+index);
		discussService.deleteDiscussComment(no);
		return new ModelAndView("redirect:findDiscussContent.do?no="+index);
	}
	@RequestMapping("registerDiscussComment.do")
	public ModelAndView registerDiscussComment(HttpServletRequest request){
		System.out.println("댓글등록컨트롤러");
		int discussionNo = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		System.out.println("게시글넘버 "+discussionNo+"댓글 ="+content+"세션 아이디 ="+id);
		/*discussService.registerDiscussComment(new CommentVO(discussionNo, id, content));*/
		return new ModelAndView("redirect:findDiscussContent.do?no="+discussionNo);
	}
}
