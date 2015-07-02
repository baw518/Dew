package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.ErrorReportService;
import org.kosta.dew.model.vo.ErrorReportListVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.PagingBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorReportController {
	/*****************************
	 * ErrorReport Controller 
	 * ErrorReport function 
	 * 1. 글쓰기
	 * 2. 편집
	 * 3. 편집등록
	 * 4. ID & Title 중복 불가
	 * 5. 게시글 상세 보기
	 *****************************/
	
	// ErrorReportService Object injection
	@Resource
	private ErrorReportService errorReportService;

	// 글쓰기 폼으로 이동
	@RequestMapping("report_writeForm.do")
	public String reportWriteView(){
		return "errorReport_writeForm";
	}
	
	// 단어로 검색 뷰로 이동
	@RequestMapping("report_findWordView.do")
	public String reportFindWordView(){
		return "errorReport_findWord";
	}
	
	/* ErrorNo 와 게시글의 Type 을 전달 받아 수정할 게시글의 내용을 
	 * 편집 View로 전달 
	***************************************************************** */
	@RequestMapping("report_updateView.do")
	public ModelAndView reportUpdateView(String errorNo,String type){
		ModelAndView mav = new ModelAndView("errorReport_updateForm");
		mav.addObject("evo", errorReportService.getContent(Integer.parseInt(errorNo)));
		mav.addObject("type",type);
		return mav;
	}
	
	/*
	 *  ErrorReport Main View
	 *  ErrorCode와 Exception Message 를 검색하여 
	 *  View로 전달
	 ******************************************************************/
	@RequestMapping("report_listView.do")
	public ModelAndView reportView(){
		List<ErrorReportVO> list = null;
		ModelAndView mav = new ModelAndView("errorReport_listView");
		mav.addObject("errorcode", errorReportService.getReportErrorCode());
		mav.addObject("exception",errorReportService.getReportExceptionMessage());
		return mav;
	}
	
	/* 글의 제목과 타입을 전달 받아 해당 제목의 글들을 검색하여
	 *  수정이력으로 표시
	 ******************************************************************/
	@RequestMapping("report_referView.do")
	public String reportReferenceView(HttpServletRequest request,Model model,String refer,String type){
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean ;
		if(pageNo==null){
			pageNo="1";
		}
		int pageNum = Integer.parseInt(pageNo);
		List<ErrorReportVO> list =  errorReportService.getReference(refer,type,pageNum);
		
		if(type.equals("ExceptionMessage")){
			 pagingBean = new PagingBean(errorReportService.getAllException(refer),pageNum);	
		}else{
			pagingBean = new PagingBean(errorReportService.getAllError(refer),pageNum);
		}
		
		
		ErrorReportListVO vo = new ErrorReportListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("refer",refer);
		model.addAttribute("type",type);
		return "errorReport_referView";
	}
	
	/*
	 *   글의 제목과 타입을 전달 받아 해당 제목의 최신글의 내용을 
	 *   받아와 뷰로 전달
	 ******************************************************************/
	@RequestMapping("report_showContent.do")
	public ModelAndView reportShowContent(String error,String type){
		ModelAndView mav = new ModelAndView("errorReport_showContent");
		ErrorReportVO vo = errorReportService.getContent(error,type);
		if(type.equals("exception")){
			mav.addObject("exception", vo);	
			mav.addObject("type","ExceptionMessage");
		}else{
			mav.addObject("errorcode",vo);
			mav.addObject("type","ErrorCode");
		}
		return mav;
	}
	
	// ErrorNo와 타입을 전달 받아 해당글의 내용을 View로 전달
	@RequestMapping("report_showContentByNo.do")
	public String reportShowCotentByNo(Model model,int errorNo,String type){
		// System.out.println(" ERROR NO : " + errorNo);
		if(type.equals("ExceptionMessage")){
			model.addAttribute("exception", errorReportService.getContent(errorNo));
			model.addAttribute("type", "ExceptionMessage");
		}else{
			model.addAttribute("errorcode", errorReportService.getContent(errorNo));
			model.addAttribute("type", "ErrorCode");
		}
		return "errorReport_showContent";
	}
	
	/*
	 *  글쓰기 메소드
	 *  1. 글의 내용에 스크립트나 태그가 있을 때 홈페이지가 깨지는것을 막기 위해 
	 *     < 는 &lt;   > 는 &gt; 로 변경
	 *  2. command 를 전달 받아 수정과 새로 쓰기 판별
	 *  3. id & title 내용을 찾아 중복 되는 내용이 있는지 판별 
	 *      중복되는 내용이 잇으면 registerFail 로 이동 
	 *  4. 모든 글쓰기 조건이 충족 할 때, vo 를 서비스로 전달하여 글쓰기 완료  
	 ******************************************************************/
	@RequestMapping("report_write.do")
	public String reportWrite(HttpSession session,ErrorReportVO vo, String type,String title,String command,Model model){
		int errorNo = -1 ;
		String content = "";
		content = vo.getContent().replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt");
		vo.setContent(content);
		if (command.equals("register")){
			// System.out.println(type);
			errorNo = errorReportService.writeReport(vo,type,title);
			if(errorNo == -1 ){
				return "errorReport_registerFail";
			}
		}else{
			errorNo = errorReportService.reportUpdate(vo);
		}
		return "redirect:/report_write_result.do?errorNo="+ errorNo;

	}
	
	/*
	 *  글쓰기 후 다시한번 글쓰기가 되지 않도록 redirect로 errorNo 를 받아
	 *   글쓰기 결과를 보여주는 뷰
	 ******************************************************************/
	@RequestMapping("report_write_result.do")
	public ModelAndView reportWriteResult(int errorNo){
		ModelAndView mav = new ModelAndView("errorReport_writeResult");
		mav.addObject("result",errorReportService.getContent(errorNo));
		return mav;
	}
	
	/*
	 * 편집 등록 :
	 *   편집과 헷갈릴 수 있지만 같은 제목의 글의 내용을 수정 할 때, 
	 *   글의 제목은 바꿀 수 없고 내용만 바꿀 수 있는 메소드. 
     ******************************************************************/
	@RequestMapping("report_update.do")
	public String reportUpdate(ErrorReportVO vo, String type,String title){
		int errorNo = errorReportService.writeReport(vo,type,title);
		return "redirect:/report_write_result.do?errorNo="+errorNo;
	}
	
	/*
	 * 시작 단어, 중간 단어 , 끝 단어 를 가지고 해당 글의 제목을 검색 해 주는 메소드
	 *  Search Controller 에 통합 검색이 있으므로 사용하지 않는다
	 ******************************************************************/
	
	@RequestMapping("report_findWord.do")
	public String reportFindWord(String startWord ,String endWord ,String containsWord ,String type, Model model){
		// System.out.println("StartWord : " + startWord + " endWord : " + endWord + " containsWord : " + containsWord);
		List<ErrorReportVO> list = errorReportService.findWord(startWord, endWord, containsWord, type);
		model.addAttribute("result",list);
		model.addAttribute("type",type);
		// System.out.println(errorReportService.findWord(startWord, endWord, containsWord, type));
		return "errorReport_findResult";
	}
	
}
