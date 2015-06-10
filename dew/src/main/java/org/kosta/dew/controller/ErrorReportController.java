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
	
	
	@RequestMapping("reportView.do")
	public String reportView(){
		return "errorReport_view";
	}
	/*@RequestMapping("reportView.do")
	public ModelAndView reportView(){
			List<ErrorReportVO> list = errorReportService.getReportView();
		return new ModelAndView("errorReport_view","errorReport",list);
	}*/
	
}
