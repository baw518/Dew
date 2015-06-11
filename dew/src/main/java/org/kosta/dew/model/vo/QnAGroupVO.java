package org.kosta.dew.model.vo;

public class QnAGroupVO {
	private String qnAGroupNo;
	private String qnAGroupName;
	public QnAGroupVO() {
		super();
	}
	public QnAGroupVO(String qnAGroupNo, String qnAGroupName) {
		super();
		this.qnAGroupNo = qnAGroupNo;
		this.qnAGroupName = qnAGroupName;
	}
	public String getQnAGroupNo() {
		return qnAGroupNo;
	}
	public void setQnAGroupNo(String qnAGroupNo) {
		this.qnAGroupNo = qnAGroupNo;
	}
	public String getQnAGroupName() {
		return qnAGroupName;
	}
	public void setQnAGroupName(String qnAGroupName) {
		this.qnAGroupName = qnAGroupName;
	}
	@Override
	public String toString() {
		return "QnAGroupVO [qnAGroupNo=" + qnAGroupNo + ", qnAGroupName="
				+ qnAGroupName + "]";
	}
	
}
