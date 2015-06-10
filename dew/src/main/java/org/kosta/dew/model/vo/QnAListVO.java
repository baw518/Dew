package org.kosta.dew.model.vo;

import java.util.List;

public class QnAListVO {
	private List<QnAVO> list;
	private PagingBean pagingBean;
	public QnAListVO() {
		super();
	}
	public QnAListVO(List<QnAVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<QnAVO> getList() {
		return list;
	}
	public void setList(List<QnAVO> list) {
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
		return "QnAListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}