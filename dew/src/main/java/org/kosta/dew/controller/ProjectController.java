package org.kosta.dew.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
		   System.out.println(pmvo.getJoinProject());
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
	public ModelAndView projectView(String projectNo){
		ProjectVO pvo=projectService.getProjectContent(projectNo);
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
	public ModelAndView deleteProject(String projectNo){
		projectService.deleteDepart(projectNo);
		projectService.deleteProject(projectNo);
		return new ModelAndView("redirect:project_listView.do");
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
		System.out.println(flag);
		System.out.println(cvo);
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
	
	
}
