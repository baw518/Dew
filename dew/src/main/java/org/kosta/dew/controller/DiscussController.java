package org.kosta.dew.controller;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DiscussController {
	@RequestMapping("getAllDiscussList.do")
	public ModelAndView getAllDiscussList(){
		return new ModelAndView();
	}
	@RequestMapping("registerDiscussion.do")
	public ModelAndView registerDiscussion(DiscussVO vo){
		return new ModelAndView();
	}
	@RequestMapping("findDiscussContent.do")
	public ModelAndView findDiscussContent(){
		return new ModelAndView();
	}
	@RequestMapping("searchDisscuss.do")
	public ModelAndView searchDisscuss(String search){
		return new ModelAndView();
	}
	@RequestMapping("deleteRequestDiscuss.do")
	public ModelAndView deleteRequestDiscuss(DiscussVO dvo){
		return new ModelAndView();
	}
	@RequestMapping("registerDiscussComment.do")
	public ModelAndView registerDiscussComment(CommentVO cvo){
		return new ModelAndView();
	}
	@RequestMapping("updateDiscussComment.do")
	public ModelAndView updateDiscussComment(CommentVO cvo){
		return new ModelAndView();
	}
	@RequestMapping("deleteDiscussComment.do")
	public ModelAndView deleteDiscussComment(CommentVO cvo){
		return new ModelAndView();
	}
	
}
