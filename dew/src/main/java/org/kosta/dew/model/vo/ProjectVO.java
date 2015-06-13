package org.kosta.dew.model.vo;

import java.util.List;


public class ProjectVO {
	private int projectNo;
	private String projectName;
	private String id;
	private String content;
	private int point;
	private int progressing;
	private String achieve;
	private int hit;
	private String project_date;
	private List<DepartVO> departVO;
	private List<CommentVO> commentVO;
	private String deadline;
	public ProjectVO() {
		super();
	}
	
	public ProjectVO(int projectNo, String projectName, String id,
			String content, int point, int progressing, String achieve,
			int hit, String project_date, List<DepartVO> departVO,
			List<CommentVO> commentVO, String deadline) {
		super();
		this.projectNo = projectNo;
		this.projectName = projectName;
		this.id = id;
		this.content = content;
		this.point = point;
		this.progressing = progressing;
		this.achieve = achieve;
		this.hit = hit;
		this.project_date = project_date;
		this.departVO = departVO;
		this.commentVO = commentVO;
		this.deadline = deadline;
	}

	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getProgressing() {
		return progressing;
	}
	public void setProgressing(int progressing) {
		this.progressing = progressing;
	}
	public String getAchieve() {
		return achieve;
	}
	public void setAchieve(String achieve) {
		this.achieve = achieve;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getProject_date() {
		return project_date;
	}
	public void setProject_date(String project_date) {
		this.project_date = project_date;
	}
	public List<DepartVO> getDepartVO() {
		return departVO;
	}
	public void setDepartVO(List<DepartVO> departVO) {
		this.departVO = departVO;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	public List<CommentVO> getCommentVO() {
		return commentVO;
	}

	public void setCommentVO(List<CommentVO> commentVO) {
		this.commentVO = commentVO;
	}

	@Override
	public String toString() {
		return "ProjectVO [projectNo=" + projectNo + ", projectName="
				+ projectName + ", id=" + id + ", content=" + content
				+ ", point=" + point + ", progressing=" + progressing
				+ ", achieve=" + achieve + ", hit=" + hit + ", project_date="
				+ project_date + ", departVO=" + departVO + ", commentVO="
				+ commentVO + ", deadline=" + deadline + "]";
	}


	
}
