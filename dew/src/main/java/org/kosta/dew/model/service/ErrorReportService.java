package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.ErrorReportVO;

public interface ErrorReportService {

	Object writeResult = null;
	List<ErrorReportVO> getReportErrorCode();
	List<ErrorReportVO> getReportExceptionMessage();
	List<ErrorReportVO> getReportView();
	ErrorReportVO getContent(String errorNo, String type);
	ErrorReportVO getContent(int errorNo);
	int reportWrite(ErrorReportVO vo, String type, String title);
	ErrorReportVO writeResult(int errorNo);

}