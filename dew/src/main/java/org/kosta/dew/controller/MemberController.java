package org.kosta.dew.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.MemberService;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource(name = "memberServiceImpl")
	private MemberService memberSerivce;

	/*
	 * @RequestMapping("{viewId}.do") public String showView(@PathVariable
	 * String viewId){ return viewId; }
	 */
	@RequestMapping("login_form.do")
	public String loginForm() {
		System.out.println("loginForm 도착");
		return "member_loginForm";
	}

	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest request, MemberVO vo) {
		String id = request.getParameter("id");
		String password = request.getParameter("memberPassword");
		String url = "";
		System.out.println("로그인.do id/pw = " + id + " " + password);
		
		int count =memberSerivce.deltemembercheck(vo.getId());
		//카운터가 0나오면 탈퇴한 회원이 아니다 1나오면 탈퇴한 회원
		System.out.println(count);
		
		vo = memberSerivce.login(vo);
		if(count==0){
		System.out.println("로그인.do vo = " + vo);
		if (vo != null) {
			HttpSession session = request.getSession();
			System.out.println(session);
			session.setAttribute("mvo", vo);

			// return new ModelAndView("redirect:home.do");
			url = "redirect:home.do";
		} else if (vo == null) {

			// return new ModelAndView("error.jsp");
			url = "error";
		}
		}else if(count==1){
			url="member_deleteid_result";
		}
		return new ModelAndView(url);
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}

	@RequestMapping("register.do")
	public String register(HttpServletRequest request,
			HttpServletResponse response, MemberVO vo, UserTypeVO uvo) {

		uvo = memberSerivce.findName(uvo);

		memberSerivce.register(vo);

		memberSerivce.userregister(uvo, vo);

		return "member_register_result";
	}

	@RequestMapping("registerView.do")
	public ModelAndView registerForm(HttpServletRequest request,
			UserTypeVO uvo, String radio) {

		System.out.println("radio : " + radio);
		List<UserTypeVO> list = memberSerivce.usertype(uvo);
		System.out.println(list);
		return new ModelAndView("member_registerView", "list", list);
	}

	@RequestMapping("findidView.do")
	public String findbyidView() {
		System.out.println("findbyid 도착");
		return "member_findidView";
	}

	@RequestMapping("findbyid.do")
	public ModelAndView finbyid(HttpServletRequest request, MemberVO vo,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mv = null;
		System.out.println("1");
		vo = memberSerivce.findbyid(vo);
		if(vo!=null){
		System.out.println(2);
		System.out.println(vo);
			mv=new ModelAndView("member_findbyid_result", "vo", vo);
		}else{
			mv=new ModelAndView("member_findbyid_fail");
		}
		return mv;
	}

	@RequestMapping("findpasswordView.do")
	public String findbypasswordView() {
		System.out.println("member_findpasswordView 도착");
		return "member_findpasswordView";
	}

	@RequestMapping("findbypassword.do")
	public ModelAndView findbypassword(HttpServletRequest request, MemberVO vo,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mv=null;
		vo = memberSerivce.findbypassword(vo);
		if(vo!=null){
		mv=new ModelAndView("member_findbypassword_result", "vo", vo);
		}
		else{
			mv=new ModelAndView("member_findbypassword_resultfail");
		}
		return mv;
	}

	@RequestMapping("findbypassowrd2.do")
	public ModelAndView findbypassword2(HttpServletRequest request,
			MemberVO vo, HttpServletResponse response)
			throws UnsupportedEncodingException {
		vo = memberSerivce.findbypassword2(vo);

		return new ModelAndView("member_findbypassword_result2", "vo", vo);
	}

	@RequestMapping("deltemember.do")
	public ModelAndView deletemember(HttpServletRequest request, MemberVO vo) {

		memberSerivce.deletemember(vo);

		System.out.println("dleteo vo = " + vo);
		HttpSession session = request.getSession(false);
		if (session != null) {// 세션이 연결되어있을때
			// memberSerivce.deletemember(vo);
			session.setAttribute("vo", vo);

		}
		return new ModelAndView("redirect:home.do");
	}

	@RequestMapping("dletepassword.do")
	public String deltememberForm() {
		System.out.println("dleleteForm 도착");
		return "member_dletepassword";
	}

	@RequestMapping("memberupdateview.do")
	public String updatememberForm() {
		System.out.println("updateForm 도착");
		return "member_update";
	}

	@RequestMapping("update.do")
	public ModelAndView updateMember(HttpServletRequest request,
			HttpServletResponse response, MemberVO vo) {

		System.out.println(vo);
		HttpSession session = request.getSession(false);
		if (session != null) {// 세션이 연결되어있을때
			memberSerivce.update(vo);
			session.setAttribute("vo", vo);

		}

		return new ModelAndView("member_update_result");
	}

}
