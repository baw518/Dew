package org.kosta.dew.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.dew.model.vo.VideoVO;

public interface VideoDAO {

	public abstract int write(VideoVO Vvo);

	public abstract Integer checkAdmin();

	public abstract List<VideoVO> getVideoList(String pageNo);

	public abstract VideoVO showContent(int no);

	public abstract void updateCount(int no);

	public abstract void deleteVideo(String no);

	public abstract void updateVideo(VideoVO Vvo);

	public abstract int totalContent();

	public abstract int file(VideoVO vo, String file);

	public abstract List<HashMap<String, String>> getVideoName(String no);

	public abstract void deleteVideoFile(String no);

	public abstract void deleteVideoFileName(String no, String dbFileName);



}