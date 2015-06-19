package org.kosta.dew.model.vo;

import java.util.List;

public class ProjectListVO {
	private List<ProjectVO> list;
	private PagingBean pagingBean;
	public ProjectListVO() {
		super();
	}
	public ProjectListVO(List<ProjectVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<ProjectVO> getList() {
		return list;
	}
	public void setList(List<ProjectVO> list) {
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
		return "ProjectListVO [list=" + list + ", pagingBean=" + pagingBean
				+ "]";
	}
	
	
}
