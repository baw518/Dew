package org.kosta.dew.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.dew.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping("register.do")
	public ModelAndView registerMember(MemberVO mvo){
		return new ModelAndView("redirect:registerResult.do?id=java");
	}
	
	@RequestMapping("registerResult.do")
	public ModelAndView memberDelete(String id){
		return new ModelAndView("registerMember_result","info",id);
	}
	
	@RequestMapping("deleteMember.do")
	public String memberDelete(MemberVO vo){
		return "home.do";
	}
	
	@RequestMapping("loginView.do")
	public String memberLoginView(){
		return "login_View";
	}
	
	@RequestMapping("login.do")
	public ModelAndView memberLogin(MemberVO vo ){
		return new ModelAndView("home.do");
	}
	
	@RequestMapping("updateView.do")
	public String memberUpdateView(){
		return "update_View";
	}
	
	@RequestMapping("update.do")
	public ModelAndView memberUpdate(MemberVO vo ){
		return new ModelAndView("update_result");
	}
	
	@RequestMapping("logout.do")
	public String memberLogout(HttpServletRequest request){
		return "home.do";
	}
	
	@RequestMapping("findIdView.do")
	public String findMemberIdView(){
		return "find_View";
	}
	
	@RequestMapping("findId.do")
	@ResponseBody
	public String findMemberId(MemberVO vo){
		String id =null;
		return id;
	}
	
	@RequestMapping("findPasswordView.do")
	public String findMemberPwView(){
		return "findpassword_view";
	}
	
	@RequestMapping("findPassword.do")
	public ModelAndView findMemberPW(){
		return new ModelAndView("findPassword_result");
	}
	
	@RequestMapping("getMemberPoint.do")
	@ResponseBody
	public int getMemberPoint(MemberVO vo){
		int point = -1;
		return point;
	}
	
	@RequestMapping("getWritingByMember.do")
	@ResponseBody
	public List getWritingByMember(MemberVO vo ){
		List list = null;
		return list;
	}
	
	@RequestMapping("getReplyByMember.do")
	@ResponseBody
	public List getReplyByMember(MemberVO vo){
		List list = null;
		return list;
	}
	
	@RequestMapping("addPoint.do")
	public String addPoint(int point){
		return "";
	}
	
	@RequestMapping("chargePoint.do")
	public String chargePoint(int point){
		return "";
	}
	@RequestMapping("QnABetPoint.do")
	public String QnABetPoint(int point){
		return "";
	}
	@RequestMapping("exchangePoint.do")
	public String exchangePoint(int point){
		return "";
	}
}
