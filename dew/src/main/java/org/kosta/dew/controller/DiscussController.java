 package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.service.DiscussService;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.discussionRequestVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String findDiscussContent(HttpServletRequest request,HttpServletResponse response,@CookieValue(value = "discussCookie", required = false) String cookieValue,Model model){
		DiscussVO dsvo = null;
		int no = Integer.parseInt(request.getParameter("no"));
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
		model.addAttribute("dsvo",dsvo);
		
		List<CommentVO> cmvo = discussService.findDiscussComment(no);
		model.addAttribute("cmvo",cmvo);

		
		return "discussion_show_discussion";

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
		
		discussService.deleteDiscussComment(no);	
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
	public List<CommentVO> show_discussion_comment(HttpServletRequest request,CommentVO cmvo){
		int no = Integer.parseInt(request.getParameter("discussionNo"));
		String id = request.getParameter("id");
		String content=request.getParameter("content");
		cmvo = new CommentVO(no, id, content);
		discussService.registerDiscussComment(cmvo);
		List<CommentVO> cmlist = discussService.findDiscussComment(no);
		return cmlist;
	}
	@RequestMapping("replyView.do")
	@ResponseBody
	public CommentVO replyView(HttpServletRequest request){
	
		String no = request.getParameter("no");
		CommentVO cmvo = discussService.findDiscussCommentByNo(no);
	
		return cmvo;
	}
	/**
	 * 토론방 등록요청 
	 * 관리자에게 토론방 게시글 넘버,아이디를 넘김
	 * @param request
	 * @return
	 */
	@RequestMapping("insertManager.do")
	public String insertManager(HttpServletRequest request){
		int no = Integer.parseInt(request.getParameter("no"));
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		discussionRequestVO vo = new discussionRequestVO(id, null, no);
		discussService.insertRequest(vo);

		return "redirect:report_showContentByNo.do?errorNo="+no+"&type="+type;
	}
	/**
	 * 토론방 삭제요청 
	 * 관리자에게 토론방 게시글 넘버,아이디를 넘김
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteManager.do")
	public String deleteManager(HttpServletRequest request){
		int discussionNo = Integer.parseInt(request.getParameter("discussionNo"));
		String id = request.getParameter("id");
		discussionRequestVO vo = new discussionRequestVO(id, null, discussionNo);
		discussService.deleteRequest(vo);
		return "redirect:findDiscussContent.do?no="+discussionNo;
	}
	
	/**
	 * 커맨트에대한 답글커맨트 ajax로 다는곳.
	 * @param vo
	 * @return
	 */
	@RequestMapping("DSajaxWriteCommentReply.do")
	@ResponseBody
	public List<CommentVO> ajaxWriteCommentReply(CommentVO vo){
		//답변커맨트와 같은 ref들중에서, restep이 답변커맨트보다 더 큰 커맨트들의 restep을 1씩 증가시킨다.
		discussService.commentReplyStepPlus(vo);
		
		//답변글의 restep과 relevel을 증가시켜 insert한다.
		vo.setReStep(vo.getReStep()+1);
		vo.setRelevel(vo.getRelevel()+1);
		discussService.ajaxWriteCommentReply(vo);
		
		//해당글의 커맨트리스트 받아오기
		List<CommentVO> cmvo = discussService.findDiscussComment(vo.getBoardNo());
		return cmvo;
	}
	//관리자가 게시글을 강제삭제(쇼컨텐츠에서)
	@RequestMapping("delete.do")
	public String delete(HttpServletRequest request){
		String no = request.getParameter("discussionNo");
		discussService.delete(no);
		return "redirect:discussion_listView.do";
	}
	//삭제요청 페이지에서 게시글 삭제
	@RequestMapping("discussion_requestDelete.do")
	public String requestDelete(HttpServletRequest request){
		String no = request.getParameter("no");
		discussService.delete(no);
		// discussRequest 테이블 내용도 삭제
		discussService.deleteDiscussRequest(no);
		return "redirect:member_deleteRequest.do";
	}
	//삭제요청 페이지에서 게시글 삭제요청을 취소
	@RequestMapping("discussion_requestNoDelete.do")
	public String requestNoDelete(HttpServletRequest request){
		String no = request.getParameter("no");
		// discussRequest 테이블 내용도 삭제
		discussService.deleteDiscussRequest(no);
		return "redirect:member_deleteRequest.do";
	}
	//등록요청 페이지에서 게시글 등록
	@RequestMapping("discussion_requestInsert.do")
	public String requestInsert(HttpServletRequest request){
		int no = Integer.parseInt(request.getParameter("no"));
	
		discussService.insert(no);
	
		discussService.InsertDiscussRequest(no);
		
		return "redirect:member_insertRequest.do";
	}
	//등록요청 페이지에서 게시글 등록요청을 취소
	@RequestMapping("discussion_requestNoInsert.do")
	public String requestNoInsert(HttpServletRequest request){
		int no = Integer.parseInt(request.getParameter("no"));
		// discussRequest 테이블 내용 삭제
		discussService.InsertDiscussRequest(no);
		return "redirect:member_insertRequest.do";
	}
}
