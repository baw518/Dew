package org.kosta.dew.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.MemberService;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
import org.kosta.dew.model.vo.discussionRequestVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource(name = "memberServiceImpl")
	private MemberService memberSerivce;

	@RequestMapping("member_login_form.do")
	public String loginForm() {

		return "member_loginForm";
	}

	@RequestMapping("member_login.do")
	public ModelAndView login(HttpServletRequest request, MemberVO vo) {
		String id = request.getParameter("id");
		String password = request.getParameter("memberPassword");
		String url = "";

		int count = memberSerivce.deltemembercheck(vo.getId());
		// 카운터가 0나오면 탈퇴한 회원이 아니다 1나오면 탈퇴한 회원

		vo = memberSerivce.login(vo);
		if (count == 0) {
			System.out.println("로그인.do vo = " + vo);
			if (vo != null) {
				HttpSession session = request.getSession();

				session.setAttribute("mvo", vo);

				url = "redirect:home.do";
			} else if (vo == null) {

				url = "error";
			}
		} else if (count == 1) {
			url = "member_deleteid_result";
		}
		return new ModelAndView(url);
	}

	@RequestMapping("member_logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}
	@RequestMapping("member_register.do")
	public String register(HttpServletRequest request,
			HttpServletResponse response, MemberVO vo, UserTypeVO uvo,MultipartFile image) {
		uvo = memberSerivce.findName(uvo);
		memberSerivce.register(vo);
		memberSerivce.userregister(uvo, vo);
		int n=0;
		if(!(image.isEmpty())){
			try {
				image.transferTo(new File(path+vo.getId()+".jpg"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			FileInputStream fis=null;
			FileOutputStream fos=null;
			try {
				fis=new FileInputStream(path+"noImage.jpg");
				fos=new FileOutputStream(path+vo.getId()+".jpg");
				byte buffer[]=new byte[1024];
				while((n=fis.read(buffer))!=-1){
					fos.write(buffer,0,n);
					fos.flush();
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "member_register_result";
	}


	@RequestMapping("member_registerView.do")
	public ModelAndView registerForm(HttpServletRequest request,
			UserTypeVO uvo, String radio) {

		List<UserTypeVO> list = memberSerivce.usertype(uvo);

		return new ModelAndView("member_registerView", "list", list);
	}

	@RequestMapping("member_findidView.do")
	public String findbyidView() {

		return "member_findidView";
	}

	@RequestMapping("member_findbyid.do")
	public ModelAndView finbyid(HttpServletRequest request, MemberVO vo,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mv = null;

		vo = memberSerivce.findbyid(vo);
		if (vo != null) {

			mv = new ModelAndView("member_findbyid_result", "vo", vo);
		} else {
			mv = new ModelAndView("member_findbyid_fail");
		}
		return mv;
	}

	@RequestMapping("member_findpasswordView.do")
	public String findbypasswordView() {

		return "member_findpasswordView";
	}

	@RequestMapping("member_findbypassword.do")
	public ModelAndView findbypassword(HttpServletRequest request, MemberVO vo,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mv = null;
		vo = memberSerivce.findbypassword(vo);
		if (vo != null) {
			mv = new ModelAndView("member_findbypassword_result", "vo", vo);
		} else {
			mv = new ModelAndView("member_findbypassword_resultfail");
		}
		return mv;
	}

	@RequestMapping("member_findbypassowrd2.do")
	public ModelAndView findbypassword2(HttpServletRequest request,
			MemberVO vo, HttpServletResponse response)
			throws UnsupportedEncodingException {
		vo = memberSerivce.findbypassword2(vo);

		return new ModelAndView("member_findbypassword_result2", "vo", vo);
	}

	@RequestMapping("member_deletemember.do")
	public ModelAndView deletemember(HttpServletRequest request, MemberVO vo) {
		System.out.println(request.getAttribute("id"));

		memberSerivce.deletemember(vo);

		System.out.println("dleteo vo = " + vo);
		HttpSession session = request.getSession(false);
		if (session != null) {// 세션이 연결되어있을때

			session.setAttribute("vo", vo);

		} else if (vo == null) {
			return new ModelAndView("deletemember_fail");
		}
		return new ModelAndView("redirect:home.do");
	}

	@RequestMapping("member_deleteview.do")
	public String deltememberForm(MemberVO vo, Model model) {

		model.addAttribute("vo", vo);
		return "member_dletepassword";
	}

	@RequestMapping("member_updateview.do")
	public String updatememberForm() {

		return "member_update";
	}

	@Resource(name="uploadPath")
    private String path;
	@RequestMapping("member_update.do")
	public ModelAndView updateMember(HttpServletRequest request,
			HttpServletResponse response, MemberVO vo, MultipartFile memberImage) throws InterruptedException {
		HttpSession session = request.getSession(false);
		FileOutputStream fos = null;
		if (session != null) {// 세션이 연결되어있을때
			if(memberImage.getOriginalFilename()!=""){
			try {
				byte[] imageData=memberImage.getBytes();
				fos=new FileOutputStream(path+vo.getId()+".jpg");
				fos.write(imageData);
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(fos!=null){
					try {
						fos.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			}
			memberSerivce.update(vo);
			session.setAttribute("vo", vo);
		}

		return new ModelAndView("member_update_result");
	}

	@RequestMapping("member_mypageForm.do")
	public String mypageForm() {

		return "member_mypageForm";
	}

	@RequestMapping("member_profileForm.do")
	public String profileForm() {

		return "member_profileform";
	}
	@RequestMapping("member_view.do")
	public ModelAndView memberView(String pageNo,Model model){
		return new ModelAndView("member_memberView","mlvo",memberSerivce.allMember(pageNo));
	}
	@RequestMapping("member_deleteRequest.do")
	public String deleteRequest(Model model){
		List<discussionRequestVO> list = memberSerivce.showDeleteRequest();
		model.addAttribute("list", list);
		return "member_showDeleteRequest";
	}
	@RequestMapping("member_insertRequest.do")
	public String insertRequest(Model model){
		List<discussionRequestVO> list = memberSerivce.showInsertRequest();
		model.addAttribute("list", list);
		return "member_showInsertRequest";
	}
}
