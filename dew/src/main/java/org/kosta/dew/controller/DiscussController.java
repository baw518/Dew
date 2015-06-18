package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.service.DiscussService;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
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
	/**
	 * 토론방 게시글 상세보기
	 * @param request
	 * @return
	 */
	@RequestMapping("findDiscussContent.do")
	public ModelAndView findDiscussContent(HttpServletRequest request,HttpServletResponse response,@CookieValue(value = "discussCookie", required = false) String cookieValue){
		DiscussVO dsvo = null;
		String no = request.getParameter("no");
		if (cookieValue == null) {
			// discussCookie 존재하지 않으므로 cookie 생성하고 count 증가");
			response.addCookie(new Cookie("discussCookie", "|" + no + "|"));
			dsvo = discussService.findDiscussContenHitUp(no);
		} else if (cookieValue.indexOf("|" + no + "|") == -1) {
			// discussCookie 존재하지만 {}번글은 처음 조회하므로 count증가", no);
			cookieValue += "|" + no + "|";
			// 글번호를 쿠키에 추가
			response.addCookie(new Cookie("discussCookie", cookieValue));
			dsvo = discussService.findDiscussContenHitUp(no);
		} else {
			// discussCookie 존재하고 이전에 해당 게시물 읽었으므로 count 증가x");
			dsvo = discussService.findDiscussContent(no);
		}
		return new ModelAndView("discussion_show_discussion","dsvo",dsvo);

/*		String no = request.getParameter("no");
		DiscussVO dsvo  = discussService.findDiscussContent(no);
		return new ModelAndView("discussion_show_discussion","dsvo",dsvo);*/
	}
	/**
	 * 토론방 생성버튼 클릭 시
	 * 토론방 생성 form으로 가는 메소드
	 * @return
	 */
	@RequestMapping("registerDiscussionForm.do")
	public String registerDiscussionForm(){
		return "discussion_registerDiscussionForm";
	}
	/**
	 * 토론방 생성 메소드
	 * @param request
	 * @return
	 */
	@RequestMapping("registerDiscussion.do")
	public String registerDiscussion(HttpServletRequest request){
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		discussService.registerDiscussion(new DiscussVO(id, title, content, subject));
		return "redirect:discussion_listView.do";
	}
	/**
	 * 토론방 댓글 생성
	 * @param request
	 * @return
	 */
	@RequestMapping("registerDiscussComment.do")
	public ModelAndView registerDiscussComment(HttpServletRequest request){
		int discussionNo = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		discussService.registerDiscussComment(new CommentVO(discussionNo, id, content));
		return new ModelAndView("redirect:findDiscussContent.do?no="+discussionNo);
	}
	
	/**
	 * 토론방 댓글 수정버튼 클릭 시
	 * ajax로 textarea 보여주는 메소드
	 * @param request
	 * @return
	 */
	@RequestMapping("updateDiscussCommentForm.do")
	@ResponseBody
	public CommentVO updateDiscussCommentForm(HttpServletRequest request){
		String no = request.getParameter("no");
		CommentVO cmvo = discussService.findDiscussCommentByNo(no);
		return cmvo;
	}
	/**
	 * 토론방 상세보기
	 * 댓글 수정form에서 받은 값으로
	 * 댓글 수정하는 메소드
	 * @param request
	 * @return
	 */
	@RequestMapping("updateDiscussComment.do")
	public String updateDiscussComment(HttpServletRequest request){
		int no = Integer.parseInt(request.getParameter("no"));
		String index = request.getParameter("index");
		String content=request.getParameter("content");
		CommentVO cmvo = new CommentVO(no, content);
		discussService.updateDiscussComment(cmvo);
		return "redirect:findDiscussContent.do?no="+index;
	}
	/**
	 * 토론방 댓글 삭제
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteDiscussComment.do")
	@ResponseBody
	public ModelAndView deleteDiscussComment(HttpServletRequest request){
		String no = request.getParameter("no");
		String index = request.getParameter("index");
		System.out.println("no "+no);
		/*discussService.deleteDiscussComment(no);	*/
		return new ModelAndView("redirect:findDiscussContent.do?no="+index);
	}
	/**
	 * 토론방 상세보기에서
	 * ajax로 덧글 불러오는 메소드
	 * @param request
	 * @return
	 */
	@RequestMapping("show_discussion_comment.do")
	@ResponseBody
	public List<CommentVO> show_discussion_comment(HttpServletRequest request){
/*		CommentVO cvo = new CommentVO();*/
		String discussionNo = request.getParameter("discussionNo");
		List<CommentVO> cmlist = discussService.findDiscussComment(discussionNo);
		return cmlist;
	}
	@RequestMapping("replyView.do")
	@ResponseBody
	public CommentVO replyView(HttpServletRequest request){
		System.out.println("리프으으을");
		String no = request.getParameter("no");
		CommentVO cmvo = discussService.findDiscussCommentByNo(no);
		System.out.println("리플폼 +"+no);
		return cmvo;
	}
	/**
	 * 토론방 삭제요청 
	 * 관리자에게 토론방 게시글 넘버를 넘김
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteManager.do")
	public String deleteManager(HttpServletRequest request){
		String discussionNo = request.getParameter("discussionNo");
		/*
		 * 관리자에게 넘기는 메소드
		 */
		return "redirect:findDiscussContent.do?no="+discussionNo;
	}
}
