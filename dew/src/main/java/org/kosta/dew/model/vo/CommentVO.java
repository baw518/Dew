package org.kosta.dew.model.vo;

import java.sql.Date;

public class CommentVO {
	private int no;
	private int index;
	private String id;
	private String content;
	private Date date;
	private int ref;
	private int reStep;
	private int relevel;
	
	
	public CommentVO(int index, String id, String content) {
		super();
		this.index = index;
		this.id = id;
		this.content = content;
	}
	public CommentVO(int no, int index, String id, String content, Date date,
			int ref, int reStep, int relevel) {
		super();
		this.no = no;
		this.index = index;
		this.id = id;
		this.content = content;
		this.date = date;
		this.ref = ref;
		this.reStep = reStep;
		this.relevel = relevel;
	}
	public CommentVO() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReStep() {
		return reStep;
	}
	public void setReStep(int reStep) {
		this.reStep = reStep;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	
}
