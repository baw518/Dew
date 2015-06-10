package org.kosta.dew.model.vo;

import java.util.ArrayList;
import java.util.List;
/**
 * 리스트(list.jsp) 화면에서 보여줄 게시물 리스트를 저장하고<br>
 * 페이징 정보 객체를 저장하는 클래스 
 * @author KOSTA-00-KANGSA
 *
 */
public class DiscussListVO {
	private List<DiscussVO> list;
	private PagingBean pagingBean;
	public DiscussListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiscussListVO(List<DiscussVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<DiscussVO> getList() {
		return list;
	}
	public void setList(List<DiscussVO> list) {
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
		return "DiscussListVO [list=" + list + ", pagingBean=" + pagingBean
				+ "]";
	}

}