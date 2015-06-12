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
			vo = sqlSessionTemplate.selectOne("errorReport.getContentException", errorNo);
		}else{
			vo = sqlSessionTemplate.selectOne("errorReport.getContentErrorCode", errorNo);
		}
		return vo;
	}

	@Override
	public ErrorReportVO getContent(int errorNo) {
		return sqlSessionTemplate.selectOne("errorReport.getContentRegisterResult", errorNo);
	}

	@Override
	public int reportWrite(ErrorReportVO vo, String type,String title) {
		if(type.equals("exception")){
			sqlSessionTemplate.insert("errorReport.writeReportExceptionTitle", title);
			sqlSessionTemplate.insert("errorReport.writeReportException", vo);
		}else{
			sqlSessionTemplate.insert("errorReport.writeReportErrorcodeTitle", title);
			sqlSessionTemplate.insert("errorReport.writeReportErrorcode", vo);
		}
		
		return sqlSessionTemplate.selectOne("errorReport.currentValue");
	}


	
	
}
