package org.kosta.dew.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.MemberService;
import org.kosta.dew.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource(name="memberServiceImpl")
	private MemberService memberSerivce;
	/*@RequestMapping("{viewId}.do")
    public String showView(@PathVariable String viewId){
       return viewId;
    }*/
	@RequestMapping("login_form.do")
	public String loginForm(){
		System.out.println("loginForm 도착");
		return "member_loginForm";
	}
	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest request,MemberVO vo){
		String id = request.getParameter("id");
		String password = request.getParameter("memberPassword");
		String url="";
		System.out.println("로그인.do id/pw = "+id+" "+password);
		vo = memberSerivce.login(vo);
		System.out.println("로그인.do vo = "+vo);
		if(vo!=null){
			HttpSession session = request.getSession();
			System.out.println(session);
			session.setAttribute("mvo", vo);
			System.out.println("로그인ㅅ ㅓㅇ공 :)");
			//return new ModelAndView("redirect:home.do");
			url = "redirect:home.do";
		}else if(vo==null){
			System.out.println("로그인실패 :(");
			//return new ModelAndView("error.jsp");
			url = "error";
		}
		return new ModelAndView(url);
	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}
}
