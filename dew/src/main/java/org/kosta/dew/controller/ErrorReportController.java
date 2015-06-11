package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.service.ErrorReportService;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorReportController {
	@Resource
	private ErrorReportService errorReportService;

	@RequestMapping("report_listView.do")
	public ModelAndView reportView(){
		List<ErrorReportVO> list = null;
		ModelAndView mav = new ModelAndView("errorReport_listView");
		mav.addObject("errorcode", errorReportService.getReportErrorCode());
		mav.addObject("exception",errorReportService.getReportExceptionMessage());
		System.out.println("getErrorCode : " + errorReportService.getReportErrorCode() + " \n getExceptionMessage :" +errorReportService.getReportExceptionMessage());
		return mav;
	}
	
	@RequestMapping("report_showContent.do")
	public ModelAndView ReportShowContent(String errorNo,String type){
		ModelAndView mav = new ModelAndView("errorReport_showContent");
		System.out.println("errorNo : " + errorNo + " type : " + type);
		
		return mav;
	}
}
