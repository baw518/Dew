package org.kosta.dew.model.vo;

public class discussionRequestVO {
	private String id;
	private String separation;
	private int no;
	public discussionRequestVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public discussionRequestVO(String id, String separation, int no) {
		super();
		this.id = id;
		this.separation = separation;
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeparation() {
		return separation;
	}
	public void setSeparation(String separation) {
		this.separation = separation;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "discussionRequestVO [id=" + id + ", separation=" + separation
				+ ", no=" + no + "]";
	}
	
}
