package org.kosta.dew.controller;

import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {
	@RequestMapping("registerProject.do")
	public ModelAndView registerProject(ProjectVO pvo){
		return new ModelAndView("");
	}
	@RequestMapping("projectView.do")
	public ModelAndView projectView(ProjectVO pvo){
		return new ModelAndView("");
	}
	@RequestMapping("updateProject.do")
	public ModelAndView updateProject(ProjectVO pvo){
		return new ModelAndView("");
	}
	@RequestMapping("deleteProject.do")
	public String deleteProject(ProjectVO pvo){
		return "";
	}
	@RequestMapping("getProjectList.do")
	public ModelAndView getProjectList(ProjectVO pvo){
		return new ModelAndView("");
	}
	@RequestMapping("getProjecterList.do")
	public ModelAndView getProjecterList(ProjectVO pvo){
		return new ModelAndView("");
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
