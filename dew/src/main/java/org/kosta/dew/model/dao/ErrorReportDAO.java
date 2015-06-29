package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.ErrorReportVO;

public interface ErrorReportDAO {

	List<ErrorReportVO> getReportErrorCode();
	List<ErrorReportVO> getReportExceptionMessage();
	List<ErrorReportVO> getReportView();
	ErrorReportVO getContent(String error, String type);
	ErrorReportVO getContent(int errorNo);
	int reportWrite(ErrorReportVO vo, String type, String title);
	List<ErrorReportVO> getReference(String refer, String type, int pageNum);
	int getAllException(String refer);
	int getAllError(String refer);
	List<ErrorReportVO> findWord(String startWord, String endWord,String containsWord,String type);
	int reportUpdate(ErrorReportVO vo);
	boolean duplicateTitle(ErrorReportVO vo, String type, String title);
	void updateDiscussionStatus(int errorNo);

}