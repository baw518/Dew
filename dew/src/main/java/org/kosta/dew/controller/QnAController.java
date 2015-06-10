package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.service.QnAService;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.QnAListVO;
import org.kosta.dew.model.vo.QnAVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("QnA_listview.do")
	public String listview(HttpServletRequest request,Model model){
		
		//페이지번호
		String pageNo = request.getParameter("pageNo");
		//페이지가 없을경우 1페이지를 보여줌
		if(pageNo==null){
			pageNo="1";
		}
		int pageNum = Integer.parseInt(pageNo);
		
		//해당 페이지번호에 해당하는 게시물들을 리스트에 저장
		List<QnAVO> list = qnAService.getAllList(pageNum);
		
		//페이징
		PagingBean pagingBean = new PagingBean(qnAService.getAllCount(),pageNum);
		
		//리스트와 페이징을 저장하여 보낸다
		QnAListVO vo = new QnAListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		
		return "QnA_listview";
	}
	
	@RequestMapping("QnA_showcontent.do")
	public String showContent(String qnaNo,HttpServletRequest request,HttpServletResponse response,Model model){
		
		QnAVO qvo = null;
		Cookie [] cookies=request.getCookies();
		
		if(cookies==null||cookies.length==0){
			response.addCookie(new Cookie("hitcookie","|"+qnaNo+"|"));
			qvo = qnAService.showContent(qnaNo);
		}
		else{
			Cookie cookie=null;
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("hitcookie")){
					cookie=cookies[i];
					break;
				}
			}
			
			if(cookie==null){
				response.addCookie(new Cookie("hitcookie","|"+qnaNo+"|"));
				qvo = qnAService.showContent(qnaNo);
			}
			else{
				String value=cookie.getValue();
				
				if(value.indexOf("|"+qnaNo+"|")!=-1){
					qvo = qnAService.showContentNoHit(qnaNo);
				}
				else{
					qvo = qnAService.showContent(qnaNo);
					value+="|"+qnaNo+"|";
					response.addCookie(new Cookie("hitcookie",value));
				}
			}
		}
		
		model.addAttribute("qvo", qvo);
		return "QnA_showcontent";
	}
}