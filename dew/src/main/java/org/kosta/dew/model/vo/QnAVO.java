package org.kosta.dew.model.vo;

import java.sql.Date;

public class QnAVO {
	private int qnaNo;
	private String id;
	private int groupNo;
	private String title;
	private String content;
	private String date;
	private int hit;
	private int point;
	private int answerStatus;
	private int ref;
	private int restep;
	private int relevel;

	public QnAVO() {
		super();
	}

	public QnAVO(int qnaNo, String id, int groupNo, String title,
			String content, String date, int hit, int point, int answerStatus,
			int ref, int restep, int relevel) {
		super();
		this.qnaNo = qnaNo;
		this.id = id;
		this.groupNo = groupNo;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.point = point;
		this.answerStatus = answerStatus;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(int answerStatus) {
		this.answerStatus = answerStatus;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", id=" + id + ", groupNo=" + groupNo
				+ ", title=" + title + ", content=" + content + ", date="
				+ date + ", hit=" + hit + ", point=" + point
				+ ", answerStatus=" + answerStatus + ", ref=" + ref
				+ ", restep=" + restep + ", relevel=" + relevel + "]";
	}

	
	
}
