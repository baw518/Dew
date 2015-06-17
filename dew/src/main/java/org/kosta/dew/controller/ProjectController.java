package org.kosta.dew.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.ProjectService;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectManageVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {
	@Resource
	private ProjectService projectService;
	   @RequestMapping("project_main.do")
	   public String projectMain(){
		   return "projectView_projectMain";
	   }
	   @RequestMapping("project_registerForm.do")
	   public String projectRegisterShow(){
		   return "projectView_projectRegister";
	   }
	   @RequestMapping("project_projectRequestForm.do")
		public ModelAndView projectRequestView(){
			return new ModelAndView("projectView_projectRequest");
		}
	   @RequestMapping("project_projectManageForm.do")
		public ModelAndView projectManageView(HttpServletRequest request){
		   HttpSession session=request.getSession(false);
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			String id=mvo.getId();
		   ProjectManageVO pmvo=new ProjectManageVO();
		   pmvo.setCreatingProject(projectService.findProjectById(id));
		   pmvo.setJoinProject(projectService.findJoinProjectById(id));
		   pmvo.setProcessingProject(projectService.findProcessProjectById(id));
			return new ModelAndView("projectView_projectManage","pmvo",pmvo);
		}
		@RequestMapping(value="project_register.do",method=RequestMethod.POST)
		public ModelAndView registerProject(ProjectVO pvo, DepartVO dvo,HttpServletRequest request){
			HttpSession session=request.getSession(false);
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			pvo.setId(mvo.getId());
			projectService.registerProject(pvo, dvo);
			return new ModelAndView("redirect:project_View.do?projectNo="+pvo.getProjectNo());
	}
	@RequestMapping("project_View.do")
	public ModelAndView projectView(String projectNo,HttpServletRequest request,HttpServletResponse response){
		ProjectVO pvo=null;
		Cookie [] cookies=request.getCookies();
		if(cookies==null||cookies.length==0){
			response.addCookie(new Cookie("hitcookie","|"+projectNo+"|"));
			pvo = projectService.getProjectContent(projectNo);
		}
		else{
			Cookie cookie=null;
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("hitcookie")){
					cookie=cookies[i];
					break;
				}
			}
			// 쿠키는 있지만 hitcookie가 없어서 hitcookie를 만듬
						if(cookie==null){
							response.addCookie(new Cookie("hitcookie","|"+projectNo+"|"));
							pvo = projectService.getProjectContent(projectNo);
						}
						
						// hitcookie가 있는경우
						else{
							String value=cookie.getValue();
							
							//해당 글번호에대한 쿠키가 있으므로 조회수 증가시키지 않는다.
							if(value.indexOf("|"+projectNo+"|")!=-1){
								pvo = projectService.getProjectContentNohit(projectNo);
							}
							
							//해당글번호의 쿠키가 없으므로 조회수를 증가시키고 쿠키를 만듬.
							else{
								pvo = projectService.getProjectContent(projectNo);
								value+="|"+projectNo+"|";
								response.addCookie(new Cookie("hitcookie",value));
							}
						}
		}
		return new ModelAndView("projectView_projectView","pvo",pvo);
	}
	@RequestMapping("project_listView.do")
	public ModelAndView ProjectList(String pageNo){
		ProjectListVO plvo=projectService.makeProjectListVO(pageNo);
		return new ModelAndView("projectView_projectList","plvo",plvo);
	}
	
	@RequestMapping("project_updateForm.do")
	public ModelAndView updateProjectForm(String projectNo){
		ProjectVO pvo=projectService.getProjectContent(projectNo);
		return new ModelAndView("projectView_projectUpdate","pvo",pvo);
	}
	@RequestMapping("project_update.do")
	public ModelAndView updateProject(ProjectVO pvo, DepartVO dvo){
		projectService.updateProject(pvo,dvo);
		return new ModelAndView("redirect:project_View.do?projectNo="+pvo.getProjectNo());
	}
	
	@RequestMapping("project_delete.do")
	public ModelAndView deleteProject(String projectNo,boolean manage){
		String path="redirect:project_listView.do";
		if(manage==true)
			path="redirect:project_projectManageForm.do";
		projectService.deleteDepart(projectNo);
		projectService.deleteProject(projectNo);
		return new ModelAndView(path);
	}
	@RequestMapping("registerProjectComment.do")
	public ModelAndView findAndRegisterProjectComment(String projectNo,String content,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		projectService.findRegisterComment(new CommentVO(Integer.parseInt(projectNo),mvo.getId(),content));
		return new ModelAndView("redirect:project_View.do?projectNo="+projectNo);
	}
	@RequestMapping("joinProjectAjax.do")
	@ResponseBody
	public boolean joinProjectAjax(String projectNo,String joinContent,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		String id=mvo.getId();
		CommentVO cvo=new CommentVO();
		cvo.setBoardNo(Integer.parseInt(projectNo));
		cvo.setId(id);
		boolean flag=projectService.joinCheck(cvo);
		if(flag==false)
			projectService.joinProject(new CommentVO(Integer.parseInt(projectNo),id,joinContent));
		return flag;
	}
	@RequestMapping("updateProjectComment.do")
	public ModelAndView updateProjectComment(CommentVO cvo){
		projectService.updateProjectComment(cvo);
		return new ModelAndView("redirect:project_View.do?projectNo="+cvo.getBoardNo());
	}
	@RequestMapping("deleteProjectComment.do")
	public ModelAndView deleteProjectComment(int commentNo,String projectNo){
		projectService.deleteProjectComment(commentNo);
		return new ModelAndView("redirect:project_View.do?projectNo="+projectNo);
	}
	@RequestMapping("deleteJoinComment.do")
	public ModelAndView deleteJoinComment(String commentNo){
		projectService.deleteJoinComment(commentNo);
		return new ModelAndView("redirect:project_projectManageForm.do");
	}
	@RequestMapping("startProject.do")
	public ModelAndView startProject(String projectNo){
		projectService.startProject(projectNo);
		return new ModelAndView("redirect:project_projectManageForm.do");
	}
	
}
