package org.kosta.dew.model.vo;

import java.util.List;

public class DiscussVO {
 private int discussionNo;
 private String id;
 private String title;
private String content;
private String discussionDate;
private String hit;
private String discussionSubject;
private CommentVO commentVO;
private int progress;
public DiscussVO() {
	super();
	// TODO Auto-generated constructor stub
}

public DiscussVO(String id, String title, String content,
		String discussionSubject,int progress) {
	super();
	this.id = id;
	this.title = title;
	this.content = content;
	this.discussionSubject = discussionSubject;
	this.progress = progress;
}

public DiscussVO(int discussionNo, String id, String title, String content,
		String discussionDate, String hit, String discussionSubject,
		CommentVO commentVO, int progress) {
	super();
	this.discussionNo = discussionNo;
	this.id = id;
	this.title = title;
	this.content = content;
	this.discussionDate = discussionDate;
	this.hit = hit;
	this.discussionSubject = discussionSubject;
	this.commentVO = commentVO;
	this.progress = progress;
}

public int getDiscussionNo() {
	return discussionNo;
}

public void setDiscussionNo(int discussionNo) {
	this.discussionNo = discussionNo;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
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

public String getDiscussionDate() {
	return discussionDate;
}

public void setDiscussionDate(String discussionDate) {
	this.discussionDate = discussionDate;
}

public String getHit() {
	return hit;
}

public void setHit(String hit) {
	this.hit = hit;
}

public String getDiscussionSubject() {
	return discussionSubject;
}

public void setDiscussionSubject(String discussionSubject) {
	this.discussionSubject = discussionSubject;
}

public CommentVO getCommentVO() {
	return commentVO;
}

public void setCommentVO(CommentVO commentVO) {
	this.commentVO = commentVO;
}

public int getProgress() {
	return progress;
}

public void setProgress(int progress) {
	this.progress = progress;
}

@Override
public String toString() {
	return "DiscussVO [discussionNo=" + discussionNo + ", id=" + id
			+ ", title=" + title + ", content=" + content + ", discussionDate="
			+ discussionDate + ", hit=" + hit + ", discussionSubject="
			+ discussionSubject + ", commentVO=" + commentVO + ", progress="
			+ progress + "]";
}


}
