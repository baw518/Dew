package org.kosta.dew.model.vo;

import java.util.ArrayList;


public class ProjectVO {
	private String projectName;
	private int point;
	private ArrayList<DepartVO> departVO;
	private String deadline;
	public ProjectVO() {
		super();
	}
	public ProjectVO(String projectName, int point,
			ArrayList<DepartVO> departVO, String deadline) {
		super();
		this.projectName = projectName;
		this.point = point;
		this.departVO = departVO;
		this.deadline = deadline;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public ArrayList<DepartVO> getDepartVO() {
		return departVO;
	}
	public void setDepartVO(ArrayList<DepartVO> departVO) {
		this.departVO = departVO;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	@Override
	public String toString() {
		return "ProjectVO [projectName=" + projectName + ", point=" + point
				+ ", departVO=" + departVO + ", deadline=" + deadline + "]";
	}
	
}
