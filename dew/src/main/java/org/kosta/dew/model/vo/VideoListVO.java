package org.kosta.dew.model.vo;

import java.util.List;

public class VideoListVO {
	private List<VideoVO> list;
	private PagingBean pagingBean;
	public VideoListVO() {
		super();
	}
	public VideoListVO(List<VideoVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<VideoVO> getList() {
		return list;
	}
	public void setList(List<VideoVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "VieioListVo [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}
