package org.kosta.dew.model.vo;

import java.util.List;

public class ProjectManageVO {
	private List<ProjectVO> creatingProject;
	private List<ProjectVO> joinProject;
	private List<ProjectVO> processingProject;
	private List<ProjectVO> requestProject;
	public ProjectManageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectManageVO(List<ProjectVO> creatingProject,
			List<ProjectVO> joinProject, List<ProjectVO> processingProject,
			List<ProjectVO> requestProject) {
		super();
		this.creatingProject = creatingProject;
		this.joinProject = joinProject;
		this.processingProject = processingProject;
		this.requestProject = requestProject;
	}
	public List<ProjectVO> getCreatingProject() {
		return creatingProject;
	}
	public void setCreatingProject(List<ProjectVO> creatingProject) {
		this.creatingProject = creatingProject;
	}
	public List<ProjectVO> getJoinProject() {
		return joinProject;
	}
	public void setJoinProject(List<ProjectVO> joinProject) {
		this.joinProject = joinProject;
	}
	public List<ProjectVO> getProcessingProject() {
		return processingProject;
	}
	public void setProcessingProject(List<ProjectVO> processingProject) {
		this.processingProject = processingProject;
	}
	public List<ProjectVO> getRequestProject() {
		return requestProject;
	}
	public void setRequestProject(List<ProjectVO> requestProject) {
		this.requestProject = requestProject;
	}
	@Override
	public String toString() {
		return "ProjectManageVO [creatingProject=" + creatingProject
				+ ", joinProject=" + joinProject + ", processingProject="
				+ processingProject + ", requestProject=" + requestProject
				+ "]";
	}
	
}
