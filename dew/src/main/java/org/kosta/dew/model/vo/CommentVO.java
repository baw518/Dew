package org.kosta.dew.model.vo;


public class CommentVO {
	private int commentNo;
	private int boardNo;
	private String id;
	private String content;
	private String commentDate;
	private int ref;
	private int reStep;
	private int relevel;
	private String projectSub;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int commentNo, int boardNo, String id, String content,
			String commentDate, int ref, int reStep, int relevel,String projectSub) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.id = id;
		this.content = content;
		this.commentDate = commentDate;
		this.ref = ref;
		this.reStep = reStep;
		this.relevel = relevel;
		this.projectSub = projectSub;
	}
	
	public CommentVO(int boardNo, String id, String content) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.content = content;
	}

	public CommentVO(int commentNo, String content) {
		super();
		this.commentNo = commentNo;
		this.content = content;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
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
	public String getProjectSub(){
		return projectSub;
	}
	public void setProjectSub(String projectSub){
		this.projectSub = projectSub;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", boardNo=" + boardNo
				+ ", id=" + id + ", content=" + content + ", commentDate="
				+ commentDate + ", ref=" + ref + ", reStep=" + reStep
				+ ", relevel=" + relevel + "]";
	}
	
}
