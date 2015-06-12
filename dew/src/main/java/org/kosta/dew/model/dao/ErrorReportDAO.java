package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.ErrorReportVO;

public interface ErrorReportDAO {

	List<ErrorReportVO> getReportErrorCode();
	List<ErrorReportVO> getReportExceptionMessage();
	List<ErrorReportVO> getReportView();
	ErrorReportVO getContent(String errorNo, String type);
	ErrorReportVO getContent(int errorNo);
	int reportWrite(ErrorReportVO vo, String type, String title);

}