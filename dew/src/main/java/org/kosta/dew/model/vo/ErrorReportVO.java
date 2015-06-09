package org.kosta.dew.model.vo;

public class ErrorReportVO {
	private String exceptionMessage;
	private String errorCode;
	private String id;
	private String errorReportNo;
	private int hits;
	private String content;
	private String writer;
	public String getExceptionMessage() {
		return exceptionMessage;
	}
	public void setExceptionMessage(String exceptionMessage) {
		this.exceptionMessage = exceptionMessage;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
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
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
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
	public ErrorReportVO(String exceptionMessage, String errorCode, String id,
			String errorReportNo, int hits, String content, String writer) {
		super();
		this.exceptionMessage = exceptionMessage;
		this.errorCode = errorCode;
		this.id = id;
		this.errorReportNo = errorReportNo;
		this.hits = hits;
		this.content = content;
		this.writer = writer;
	}
	public ErrorReportVO() {
		super();
	}
	
	@Override
	public String toString() {
		return "ErrorReport [exceptionMessage=" + exceptionMessage
				+ ", errorCode=" + errorCode + ", id=" + id
				+ ", errorReportNo=" + errorReportNo + ", hits=" + hits
				+ ", content=" + content + ", writer=" + writer + "]";
	}
	
	
}
