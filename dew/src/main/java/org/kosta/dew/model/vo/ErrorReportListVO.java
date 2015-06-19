package org.kosta.dew.model.vo;

import java.util.List;

public class ErrorReportListVO {

	List<ErrorReportVO> list ;
	private PagingBean pagingBean;
	public ErrorReportListVO(List<ErrorReportVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ErrorReportListVO [list=" + list + ", pagingBean=" + pagingBean
				+ "]";
	}
	public ErrorReportListVO() {
		super();
	}
	public List<ErrorReportVO> getList() {
		return list;
	}
	public void setList(List<ErrorReportVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	
	
}
