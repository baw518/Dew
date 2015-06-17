package org.kosta.dew.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
   
public class MultiFileVO {
	private String id;
	private String title;
	private String content;
	private String videoPath;
	private List<MultipartFile> file;
	public MultiFileVO() {
		super();
	}
	public MultiFileVO(String id, String title, String content,
			String videoPath, List<MultipartFile> file) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.videoPath = videoPath;
		this.file = file;
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
	public String getVideoPath() {
		return videoPath;
	}
	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "MultiFileVO [id=" + id + ", title=" + title + ", content="
				+ content + ", videoPath=" + videoPath + ", file=" + file + "]";
	}
	
	
}
