package org.kosta.dew.model.vo;

import java.util.List;

public class MemberListVO {
	private List<MemberVO> list;
	private PagingBean pagingBean;
	public MemberListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberListVO(List<MemberVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<MemberVO> getList() {
		return list;
	}
	public void setList(List<MemberVO> list) {
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
		return "MemberListVO [list=" + list + ", pagingBean=" + pagingBean
				+ "]";
	}
	
}
