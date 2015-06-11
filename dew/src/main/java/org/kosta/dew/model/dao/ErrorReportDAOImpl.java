package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.ErrorReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class ErrorReportDAOImpl implements ErrorReportDAO {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ErrorReportVO> getReportErrorCode() {
		return sqlSessionTemplate.selectList("errorReport.getReportErrorCode");
	}

	@Override
	public List<ErrorReportVO> getReportExceptionMessage() {
		return sqlSessionTemplate.selectList("errorReport.getReportExceptionMessage");
	}

	@Override
	public List<ErrorReportVO> getReportView() {
		return sqlSessionTemplate.selectList("errorReport.getReportView");
	}

	@Override
	public ErrorReportVO getContent(String errorNo, String type) {
		ErrorReportVO vo = null;
		if(type.equals("exception")){
			System.out.println("exception start");
			vo = sqlSessionTemplate.selectOne("errorReport.getContentException", errorNo);
		}else{
			System.out.println("error start");
			vo = sqlSessionTemplate.selectOne("errorReport.getContentErrorCode", errorNo);
		}
		return vo;
	}


	
	
}
