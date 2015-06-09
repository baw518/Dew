package org.kosta.dew.controller;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.QnAVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnAController {
	@RequestMapping("")
	public ModelAndView registerQuestion(int point, QnAVO qvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView updateQuestion(QnAVO qvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView deleteQuestion(QnAVO qvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView answerQuestion(QnAVO qvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView updateQuestionReply(QnAVO qvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView selectAnswer(QnAVO qvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView registerQnAComment(CommentVO cvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView updateQnAComment(CommentVO cvo){
		return new ModelAndView("");
	}
	@RequestMapping("")
	public ModelAndView deleteQnAComment(CommentVO cvo){
		return new ModelAndView("");
	}
	
	
}
