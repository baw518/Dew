package org.kosta.dew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.QnAService;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.QnAGroupVO;
import org.kosta.dew.model.vo.QnAListVO;
import org.kosta.dew.model.vo.QnAVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QnAController {
	@Resource
	private QnAService qnAService;
	
	/**
	 * QnA 페이징 적용 게시판
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_listView.do")
	public String listview(HttpServletRequest request,Model model){
		
		//페이지번호
		String pageNo = request.getParameter("pageNo");
		//페이지가 없을경우 1페이지를 보여줌
		if(pageNo==null){
			pageNo="1";
		}
		int pageNum = Integer.parseInt(pageNo);	
		
		//해당 페이지번호에 해당하는 게시물들을 리스트에 저장
		List<QnAVO> list =  qnAService.getAllList(pageNum);
		
		//페이징
		PagingBean pagingBean = new PagingBean(qnAService.getAllCount(),pageNum);
		
		//리스트와 페이징을 저장하여 보낸다
		QnAListVO vo = new QnAListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		
		
		//분류받아와서 보내기
		List<QnAGroupVO> groupList = qnAService.getGroupList();
		model.addAttribute("groupList", groupList);
		
		return "QnA_listView";
	}
	
	/**
	 * QnA게시판 상세글보기
	 * @param qnaNo
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_showContent.do")
	public String showContent(String qnaNo,HttpServletRequest request,HttpServletResponse response,Model model){
		
		QnAVO qvo = null;
		//쿠키를 받아옴
		Cookie [] cookies=request.getCookies();
		
		//쿠키가 없는경우 쿠키를만들고, 조회수 증가시킴
		if(cookies==null||cookies.length==0){
			response.addCookie(new Cookie("hitcookie","|"+qnaNo+"|"));
			qvo = qnAService.showContent(qnaNo);
		}
		
		//쿠키가 있는경우
		else{
			Cookie cookie=null;
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("hitcookie")){
					cookie=cookies[i];
					break;
				}
			}
			
			// 쿠키는 있지만 hitcookie가 없어서 hitcookie를 만듬
			if(cookie==null){
				response.addCookie(new Cookie("hitcookie","|"+qnaNo+"|"));
				qvo = qnAService.showContent(qnaNo);
			}
			
			// hitcookie가 있는경우
			else{
				String value=cookie.getValue();
				
				//해당 글번호에대한 쿠키가 있으므로 조회수 증가시키지 않는다.
				if(value.indexOf("|"+qnaNo+"|")!=-1){
					qvo = qnAService.showContentNoHit(qnaNo);
				}
				
				//해당글번호의 쿠키가 없으므로 조회수를 증가시키고 쿠키를 만듬.
				else{
					qvo = qnAService.showContent(qnaNo);
					value+="|"+qnaNo+"|";
					response.addCookie(new Cookie("hitcookie",value));
				}
			}
		}
		 String content = "";
	     content = qvo.getContent().replaceAll("<", "&lt;");
	     content = content.replaceAll(">", "&gt");
	    qvo.setContent(content);
	
		model.addAttribute("qvo", qvo);
		

		//글에대한 질문자 아이디를 받아오기
		String questionID = qnAService.getQuestionId(qvo.getRef());
		model.addAttribute("questionID", questionID);
		
		//해당글의 커맨트리스트 받아오기
		List<CommentVO> cmvo = qnAService.showCommentList(qvo.getQnaNo());
		model.addAttribute("cmvo", cmvo);

		return "QnA_showcontent";
	}
	
	
	/**
	 * 그룹선택시 선택된 그룹들만 보여주기.
	 * 그룹,페이징 적용 QnA 게시판 
	 * @param qnAGroupNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_SelectedListView.do")
	public String selectedListView(String qnAGroupNo,HttpServletRequest request,Model model){
		//페이지번호
		String pageNo = request.getParameter("pageNo");
		//페이지가 없을경우 1페이지를 보여줌
		if(pageNo==null){
			pageNo="1";
		}
		int pageNum = Integer.parseInt(pageNo);	
		
		//해당 페이지번호와 그룹에 맞는 게시물들을 리스트에 저장
		Map<String,String> map = new HashMap<String,String>();
		map.put("pageNo", pageNo);
		map.put("qnAGroupNo", qnAGroupNo);
		List<QnAVO> list =  qnAService.getSelectedList(map);
		
		//그룹 적용된 페이징
		PagingBean pagingBean = new PagingBean(qnAService.getSelectedCount(qnAGroupNo),pageNum);
		
		//리스트와 페이징을 저장하여 보낸다
		QnAListVO vo = new QnAListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		
		
		//분류받아와서 보내기
		List<QnAGroupVO> groupList = qnAService.getGroupList();
		model.addAttribute("groupList", groupList);
		//선택된 분류보내기
		model.addAttribute("selectGroupNo", qnAGroupNo);
		
		return "QnA_listView";
	}
	
	/**
	 * 분류그룹 받아와서 콤보박스로 보내기
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_WriteForm.do")
	public String writeForm(Model model){
		//분류받아와서 보내기
		List<QnAGroupVO> groupList = qnAService.getGroupList();
		model.addAttribute("groupList", groupList);
		return "QnA_WriteForm";
	}
	
	/**
	 * 게시판에 질문글 등록
	 * @param vo
	 * @param title
	 * @return
	 */
	@RequestMapping("QnA_Write.do")
	public String write(QnAVO vo,HttpServletRequest request){
		//로그인 세션이 풀렸는지 확인
		HttpSession session  = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		//세션이 풀렸을경우 글쓰기작업중지. 로그인폼으로
		String path ="QnA_ReleaseSession";
		
		if(mvo!=null){
			//포인트 차감
			qnAService.pointMinus(vo);
			
			//글작성
			qnAService.write(vo);
			
			//세션에 포인트수정하여 재설정
			int beforePoint = mvo.getPoint();
			int minusPoint = vo.getPoint();
			mvo.setPoint(beforePoint-minusPoint);
			session.setAttribute("mvo", mvo);
			
			path = "redirect:QnA_showContent.do?qnaNo="+vo.getQnaNo();
		}
		
		//상세글보기로 리다이렉트
		return path;
	}
	
	/**
	 * 게시판 질문내용 수정폼 보이기
	 * @param qnaNo
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_UpdateForm.do")
	public String updateForm(String qnaNo,Model model){
		//분류받아와서 보내기
		List<QnAGroupVO> groupList = qnAService.getGroupList();
		model.addAttribute("groupList", groupList);
		
		//글번호로 작성글내용받아오기
		QnAVO qvo = qnAService.showContentNoHit(qnaNo);
		model.addAttribute("qvo", qvo);
		
		return "QnA_UpdateForm";
	}
	
	/**
	 * 게시판 질문내용 수정하기
	 * @param vo
	 * @return
	 */
	@RequestMapping("QnA_Update.do")
	public String update(QnAVO vo,HttpServletRequest request){
		//로그인 세션이 풀렸는지 확인
		HttpSession session  = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		//세션이 풀렸을경우 글수정 작업중지. 로그인폼으로
		String path ="QnA_ReleaseSession";	
		if(mvo!=null){
			//글 수정
			qnAService.update(vo);
			path = "redirect:QnA_showContent.do?qnaNo="+vo.getQnaNo();
		}
		
		
		//상세글보기로 리다이렉트
		return path;
	}
	
	/**
	 * QnA게시판 게시글 삭제.
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_delete.do")
	public String delete(QnAVO vo,Model model,HttpServletRequest request){
		//로그인 세션이 풀렸는지 확인
		HttpSession session  = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		//세션이 풀렸을경우 글수정 작업중지. 로그인폼으로
		String path ="QnA_ReleaseSession";	
		
		if(mvo!=null){
			qnAService.deleteContent(vo);
			path = "redirect:QnA_listView.do";
		}

		return path;
	}
	
	/**
	 * QnA게시판 답글폼 보여주기
	 * @param qnaNo
	 * @param model
	 * @return
	 */
	@RequestMapping("QnA_replyForm.do")
	public String replyForm(String qnaNo,Model model){
		//분류받아와서 보내기
		List<QnAGroupVO> groupList = qnAService.getGroupList();
		model.addAttribute("groupList", groupList);
		
		//글번호로 작성글 받아오기
		QnAVO qvo = qnAService.showContentNoHit(qnaNo);
		model.addAttribute("qvo", qvo);
		

		return "QnA_replyForm";
	}
	
	/**
	 * 답변글 달기
	 * @param vo
	 * @return
	 */
	@RequestMapping("QnA_WriteReply.do")
	public String writeReply(QnAVO vo,HttpServletRequest request){
		//로그인 세션이 풀렸는지 확인
		HttpSession session  = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		//세션이 풀렸을경우 글수정 작업중지. 로그인폼으로
		String path ="QnA_ReleaseSession";	
		
		if(mvo!=null){
			//답변글과 같은 ref들중에서, restep이 답변글보다 더 큰 글들의 restep을 1씩 증가시킨다.
			qnAService.replyRestepPlus(vo);
			
			//답변글의 restep과 relevel을 증가시켜 insert한다.
			vo.setRestep(vo.getRestep()+1);
			vo.setRelevel(vo.getRelevel()+1);
			qnAService.writeReply(vo);
			path = "redirect:QnA_showContent.do?qnaNo="+vo.getQnaNo();
		}
		
		return path;
	}
	
	/**
	 * ajax 커맨트등록
	 * @param vo
	 * @return
	 */
	@RequestMapping("ajaxWriteComment.do")
	@ResponseBody
	public List<CommentVO> ajaxWriteComment(CommentVO vo){
		//커맨트 쓰기
		qnAService.ajaxWriteComment(vo);
		
		//해당글의 커맨트리스트 받아오기
		List<CommentVO> cmvo = qnAService.showCommentList(vo.getBoardNo());
		
		return cmvo;
	}
	
	/**
	 * ajax 커맨트 삭제
	 * @param vo
	 * @return
	 */
	@RequestMapping("ajaxDeleteComment.do")
	@ResponseBody
	public List<CommentVO> ajaxDeleteComment(CommentVO vo){
		//커맨트 삭제
		qnAService.ajaxDeleteComment(vo);
		
		//해당글의 커맨트리스트 받아오기
		List<CommentVO> cmvo = qnAService.showCommentList(vo.getBoardNo());
		return cmvo;
	}
	
	/**
	 * ajax 커맨트 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("ajaxUpdateComment.do")
	@ResponseBody
	public List<CommentVO> ajaxUpdateComment(CommentVO vo){
		//커맨트 수정
		qnAService.ajaxUpdateComment(vo);
		
		//해당글의 커맨트리스트 받아오기
		List<CommentVO> cmvo = qnAService.showCommentList(vo.getBoardNo());
		return cmvo;
	}
	
	/**
	 * 질문자가 답변을 채택하는곳
	 * @param questionNO
	 * @param answerNO
	 * @param qvo
	 * @return
	 */
	@RequestMapping("QnA_replyChoose.do")
	public String replyChoose(String questionNO,String answerNO,QnAVO qvo,HttpServletRequest request){
		//로그인 세션이 풀렸는지 확인
		HttpSession session  = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		//세션이 풀렸을경우 글수정 작업중지. 로그인폼으로
		String path ="QnA_ReleaseSession";	
		
		if(mvo!=null){
			//답변채택
			qnAService.replyChoose(questionNO,answerNO,qvo);
			path = "redirect:QnA_showContent.do?qnaNo="+answerNO;
		}
		return path;
	}
	
	/**
	 * 커맨트에대한 답글커맨트 ajax로 다는곳.
	 * @param vo
	 * @return
	 */
	@RequestMapping("ajaxWriteCommentReply.do")
	@ResponseBody
	public List<CommentVO> ajaxWriteCommentReply(CommentVO vo){
		//답변커맨트와 같은 ref들중에서, restep이 답변커맨트보다 더 큰 커맨트들의 restep을 1씩 증가시킨다.
		System.out.println(vo);
		qnAService.commentReplyStepPlus(vo);
		
		//답변글의 restep과 relevel을 증가시켜 insert한다.
		vo.setReStep(vo.getReStep()+1);
		vo.setRelevel(vo.getRelevel()+1);
		qnAService.ajaxWriteCommentReply(vo);
		
		//해당글의 커맨트리스트 받아오기
		List<CommentVO> cmvo = qnAService.showCommentList(vo.getBoardNo());
		System.out.println(cmvo);
		return cmvo;
	}
}