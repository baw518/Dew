package org.kosta.dew.model.service;

import org.kosta.dew.model.vo.VideoListVO;
import org.kosta.dew.model.vo.VideoVO;

public interface VideoService {

	public abstract void write(VideoVO vvo);

	public abstract VideoListVO getVideoList(String pageNo);

	public abstract VideoVO showContent(int no);

	public abstract VideoVO showContentNoHit(int no);

	public abstract boolean checkAdmin(String no, String pass);

	public abstract void deleteVideo(String no);

	public abstract void updateVideo(VideoVO vvo);

	

}