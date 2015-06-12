package org.kosta.dew.model.vo;


public class DepartVO {
	private String subject;
	private String mans;
	private int projectNo;
	public DepartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DepartVO(String subject, String mans, int projectNo) {
		super();
		this.subject = subject;
		this.mans = mans;
		this.projectNo = projectNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMans() {
		return mans;
	}
	public void setMans(String mans) {
		this.mans = mans;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	@Override
	public String toString() {
		return "DepartVO [subject=" + subject + ", mans=" + mans
				+ ", projectNo=" + projectNo + "]";
	}
	
}
