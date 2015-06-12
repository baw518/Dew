package org.kosta.dew.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.service.ProjectService;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		@RequestMapping(value="project_register.do",method=RequestMethod.POST)
		public ModelAndView registerProject(ProjectVO pvo, DepartVO dvo){
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
	public ModelAndView updateProject(ProjectVO pvo, DepartVO dvo, String beforeSubject){
		projectService.updateProject(pvo,dvo);
		System.out.println(beforeSubject);
		return new ModelAndView("redirect:project_View.do?projectNo="+pvo.getProjectNo());
	}
	
	@RequestMapping("project_delete.do")
	public ModelAndView deleteProject(String projectNo){
		projectService.deleteDepart(projectNo);
		projectService.deleteProject(projectNo);
		return new ModelAndView("redirect:project_listView.do");
	}
	@RequestMapping("registerProjectComment.do")
	public ModelAndView registerProjectComment(ProjectVO pvo){
		return new ModelAndView("");
	}
	@RequestMapping("updateProjectComment.do")
	public ModelAndView updateProjectComment(ProjectVO pvo){
		return new ModelAndView("");
	}
	@RequestMapping("deleteProjectComment.do")
	public ModelAndView deleteProjectComment(ProjectVO pvo){
		return new ModelAndView("");
	}
	
}
