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
	public ErrorReportVO getContent(String errorNo, String type) {
		return errorReportDAO.getContent(errorNo,type);
	}

}
