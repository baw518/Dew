package org.kosta.dew.model.service;

import java.util.HashMap;
import java.util.List;

import org.kosta.dew.model.vo.VideoListVO;
import org.kosta.dew.model.vo.VideoVO;

public interface VideoService {

	public abstract int write(VideoVO vvo);

	public abstract VideoListVO getVideoList(String pageNo);

	public abstract VideoVO showContent(int no);

	public abstract VideoVO showContentNoHit(int no);

	public abstract boolean checkAdmin(String no, String pass);

	public abstract void deleteVideo(String no);

	public abstract void updateVideo(VideoVO vvo);

	public abstract int file(VideoVO vo, String file);

	public abstract List<HashMap<String, String>> getVideoName(String no);

	public abstract void deleteVideoFile(String no);

	public abstract void deleteVideoFileName(String no, String dbFileName);

	

}