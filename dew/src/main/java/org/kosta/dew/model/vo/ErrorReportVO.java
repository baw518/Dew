package org.kosta.dew.model.vo;

import java.sql.Date;

public class ErrorReportVO {
	private String exceptionMessage;
	private int errorNo;
	private String id;
	private String errorReportNo;
	private String errorCode;
	private int hit;
	private String content;
	private String writer;
	private Date reportDate;
	private int discussionStatus;
	
	
	
	public ErrorReportVO() {
		super();
	}



	public ErrorReportVO(String exceptionMessage, int errorNo, String id,
			String errorReportNo, String errorCode, int hit, String content,
			String writer, Date reportDate, int discussionStatus) {
		super();
		this.exceptionMessage = exceptionMessage;
		this.errorNo = errorNo;
		this.id = id;
		this.errorReportNo = errorReportNo;
		this.errorCode = errorCode;
		this.hit = hit;
		this.content = content;
		this.writer = writer;
		this.reportDate = reportDate;
		this.discussionStatus = discussionStatus;
	}



	public String getExceptionMessage() {
		return exceptionMessage;
	}



	public void setExceptionMessage(String exceptionMessage) {
		this.exceptionMessage = exceptionMessage;
	}



	public int getErrorNo() {
		return errorNo;
	}



	public void setErrorNo(int errorNo) {
		this.errorNo = errorNo;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getErrorReportNo() {
		return errorReportNo;
	}



	public void setErrorReportNo(String errorReportNo) {
		this.errorReportNo = errorReportNo;
	}



	public String getErrorCode() {
		return errorCode;
	}



	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}



	public int getHit() {
		return hit;
	}



	public void setHit(int hit) {
		this.hit = hit;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public Date getDate() {
		return reportDate;
	}



	public void setDate(Date reportDate) {
		this.reportDate = reportDate;
	}



	public int getDiscussionStatus() {
		return discussionStatus;
	}



	public void setDiscussionStatus(int discussionStatus) {
		this.discussionStatus = discussionStatus;
	}



	@Override
	public String toString() {
		return "ErrorReportVO [exceptionMessage=" + exceptionMessage
				+ ", errorNo=" + errorNo + ", id=" + id + ", errorReportNo="
				+ errorReportNo + ", errorCode=" + errorCode + ", hit=" + hit
				+ ", content=" + content + ", writer=" + writer + ", reportDate="
				+ reportDate + ", discussionStatus=" + discussionStatus + "]";
	}

	




	
	
	
	
	
	
}
