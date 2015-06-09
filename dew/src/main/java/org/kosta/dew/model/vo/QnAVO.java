package org.kosta.dew.model.vo;

import java.sql.Date;

public class QnAVO {

	private int qnaNo;
	private String title;
	private String id;
	// 분류 번호 
	private Date date;
	private String hits;
	private String status;
	private int replyNo;
	private int replyTier;
	private int replyTierSequnce;
	private int replyLevel;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getReplyTier() {
		return replyTier;
	}
	public void setReplyTier(int replyTier) {
		this.replyTier = replyTier;
	}
	public int getReplyTierSequnce() {
		return replyTierSequnce;
	}
	public void setReplyTierSequnce(int replyTierSequnce) {
		this.replyTierSequnce = replyTierSequnce;
	}
	public int getReplyLevel() {
		return replyLevel;
	}
	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}
	public QnAVO(int qnaNo, String title, String id, Date date, String hits,
			String status, int replyNo, int replyTier, int replyTierSequnce,
			int replyLevel) {
		super();
		this.qnaNo = qnaNo;
		this.title = title;
		this.id = id;
		this.date = date;
		this.hits = hits;
		this.status = status;
		this.replyNo = replyNo;
		this.replyTier = replyTier;
		this.replyTierSequnce = replyTierSequnce;
		this.replyLevel = replyLevel;
	}
	public QnAVO() {
		super();
	}
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", title=" + title + ", id=" + id
				+ ", date=" + date + ", hits=" + hits + ", status=" + status
				+ ", replyNo=" + replyNo + ", replyTier=" + replyTier
				+ ", replyTierSequnce=" + replyTierSequnce + ", replyLevel="
				+ replyLevel + "]";	}
	
}
