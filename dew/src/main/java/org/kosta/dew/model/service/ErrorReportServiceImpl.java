package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.ErrorReportDAO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.springframework.stereotype.Service;

@Service
public class ErrorReportServiceImpl implements ErrorReportService {
	
	@Resource
	private ErrorReportDAO errorReportDAO;
	
	@Override
	public List<ErrorReportVO> getReportErrorCode() {
		return errorReportDAO.getReportErrorCode();
	}
	
	@Override
	public List<ErrorReportVO> getReportExceptionMessage() {
		return errorReportDAO.getReportExceptionMessage();
	}

	@Override
	public List<ErrorReportVO> getReportView() {
		return errorReportDAO.getReportView();
	}

	@Override
	public ErrorReportVO getContent(String error, String type) {
		return errorReportDAO.getContent(error,type);
	}

	@Override
	public ErrorReportVO getContent(int errorNo) {
		return errorReportDAO.getContent(errorNo);
	}

	@Override
	public int reportWrite(ErrorReportVO vo, String type,String title) {
		return errorReportDAO.reportWrite(vo,type,title);
	}

	@Override
	public List<ErrorReportVO> getReference(String refer,String type, int pageNum) {
		return errorReportDAO.getReference(refer,type,pageNum);
	}

	@Override
	public int getAllException(String refer) {
		return errorReportDAO.getAllException(refer);
	}

	@Override
	public int getAllError(String refer) {
		return errorReportDAO.getAllError(refer);
	}



	@Override
	public List<ErrorReportVO> findWord(String startWord, String endWord, String containsWord,String type) {
		return errorReportDAO.findWord(startWord,endWord,containsWord,type);
	}

	@Override
	public int reportUpdate(ErrorReportVO vo) {
		return errorReportDAO.reportUpdate(vo);
	}


}
