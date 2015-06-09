package org.kosta.dew.controller;

import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.QnAVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@RequestMapping()
	public ModelAndView totalSearch(String keyword){
		return new ModelAndView();
	}
	
	@RequestMapping()
	public ModelAndView getMoreCode(String keyword,ErrorReportVO vo){
		return new ModelAndView();
	}
	
	@RequestMapping()
	public ModelAndView getMoreCode(String keyword, DiscussVO vo){
		return new ModelAndView();
	}
	
	@RequestMapping()
	public ModelAndView getMoreQnA(String keyword, QnAVO vo){
		return new ModelAndView();
	}
	
	@RequestMapping()
	public ModelAndView searchByWriter(MemberVO vo){
		return new ModelAndView();
	}
}
