package org.kosta.dew.model.vo;

import java.sql.Date;

public class VideoVO {
	private int videoNo;
	private String id;
	private String title;
	private String content;
	private String videoDate;
	private String hit;
	private String videoPath;
	public VideoVO() {
		super();
	}
	public VideoVO(int videoNo, String id, String title, String content,
			String videoDate, String hit, String videoPath) {
		super();
		this.videoNo = videoNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.videoDate = videoDate;
		this.hit = hit;
		this.videoPath = videoPath;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
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
	public String getVideoDate() {
		return videoDate;
	}
	public void setVideoDate(String videoDate) {
		this.videoDate = videoDate;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getVideoPath() {
		return videoPath;
	}
	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}
	@Override
	public String toString() {
		return "VideoVO [videoNo=" + videoNo + ", id=" + id + ", title="
				+ title + ", content=" + content + ", videoDate=" + videoDate
				+ ", hit=" + hit + ", videoPath=" + videoPath + "]";
	}
	
}

