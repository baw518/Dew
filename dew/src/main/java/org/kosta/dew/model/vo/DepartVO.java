package org.kosta.dew.model.vo;


public class DepartVO {
	private String subject;
	private String mans;
	public DepartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DepartVO(String subject, String mans) {
		super();
		this.subject = subject;
		this.mans = mans;
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
	@Override
	public String toString() {
		return "DepartVO [subject=" + subject + ", mans=" + mans + "]";
	}
	
}
