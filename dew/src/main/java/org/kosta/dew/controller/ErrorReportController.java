package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.ErrorReportService;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorReportController {
	@Resource
	private ErrorReportService errorReportService;

	@RequestMapping("report_writeForm.do")
	public String reportWriteView(){
		return "errorReport_writeForm";
	}
	@RequestMapping("report_listView.do")
	public ModelAndView reportView(){
		List<ErrorReportVO> list = null;
		ModelAndView mav = new ModelAndView("errorReport_listView");
		mav.addObject("errorcode", errorReportService.getReportErrorCode());
		mav.addObject("exception",errorReportService.getReportExceptionMessage());
		return mav;
	}
	
	@RequestMapping("report_showContent.do")
	public ModelAndView reportShowContent(String errorNo,String type){
		ModelAndView mav = new ModelAndView("errorReport_showContent");
		ErrorReportVO vo = errorReportService.getContent(errorNo,type);
		if(type.equals("exception")){
			mav.addObject("exception", vo);	
		}else{
			mav.addObject("errorcode",vo);
		}
		return mav;
	}
	
	@RequestMapping("report_write.do")
	public ModelAndView reportWrite(HttpSession session,ErrorReportVO vo, String type,String title){
		System.out.println(vo + " Type : " + type );
		int errorNo = errorReportService.reportWrite(vo,type,title);
		
		ModelAndView mav = new ModelAndView("redirect:/report_write_result.do?errorNo="+ errorNo);
		
		

		return mav;
	}
	
	@RequestMapping("report_write_result.do")
	public String reportWriteResult(int errorNo){
		System.out.println(errorNo);
		//errorReportService.getContent(errorNo);
		return "";
	}
}
