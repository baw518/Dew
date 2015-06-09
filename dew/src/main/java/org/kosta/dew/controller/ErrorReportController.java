package org.kosta.dew.controller;

import org.kosta.dew.model.vo.ErrorReportVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorReportController {
	
	@RequestMapping("latestGetCodeStoreList.do")
	public ModelAndView latestGetCodeStoreList(){
		return new ModelAndView();
	}
	
	@RequestMapping("registerCodeStoreView.do")
	public String registerCodeStoreView(){
		return "";
	}
	
	@RequestMapping("")
	public ModelAndView editCodeStore(ErrorReportVO vo ){
		return new ModelAndView("");
	}
	
	@RequestMapping("")
	public ModelAndView preCodeStore(ErrorReportVO vo){
		return new ModelAndView("");
	}
	
	@RequestMapping("registerDiscussion.do")
	public ModelAndView registerDiscussion(ErrorReportVO vo ){
		return new ModelAndView();
	}
	
	@RequestMapping("getAllCodeStore.do")
	public ModelAndView getAllCodeStore(String keyword){
		return new ModelAndView();
	}
	
	@RequestMapping("getAllCodeStore.do")
	public ModelAndView getAllCodeStore(String keyword,boolean flag){
		return new ModelAndView();
	}
	
	
}
