package org.kosta.dew.model.dao;

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


}