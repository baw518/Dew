package org.kosta.dew.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		if(type.equals("exception") || type.equals("ExceptionMessage")){
			vo = sqlSessionTemplate.selectOne("errorReport.getContentException", errorNo);
		}else{
			vo = sqlSessionTemplate.selectOne("errorReport.getContentErrorCode", errorNo);
		}
		return vo;
	}

	@Override
	public ErrorReportVO getContent(int errorNo) {
		return sqlSessionTemplate.selectOne("errorReport.showErrorReportVO", errorNo);
	}

	@Override
	public int reportWrite(ErrorReportVO vo, String type,String title) {
		
	      String content = "";
	      content = vo.getContent().replaceAll("<", "&lt;");
	      content = content.replaceAll(">", "&gt");
	      vo.setContent(content);
		
		
		if(type.equals("exception") || type.equals("ExceptionMessage")){
			sqlSessionTemplate.insert("errorReport.writeReportExceptionTitle", title);
			sqlSessionTemplate.insert("errorReport.writeReportException", vo);
		}else{
			sqlSessionTemplate.insert("errorReport.writeReportErrorcodeTitle", title);
			sqlSessionTemplate.insert("errorReport.writeReportErrorcode", vo);
		}
		
		return sqlSessionTemplate.selectOne("errorReport.currentValue");
	}

	@Override
	public List<ErrorReportVO> getReference(String refer, String type,int pageNum) {
		Map map =new HashMap();
		map.put("refer", refer);
		map.put("pageNo", pageNum);
		if(type.equals("ExceptionMessage")){
			return sqlSessionTemplate.selectList("errorReport.getReferException", map);
		}else{
			return sqlSessionTemplate.selectList("errorReport.getReferError", map);
		}
	}

	@Override
	public int getAllException(String refer) {
		return sqlSessionTemplate.selectOne("errorReport.getAllException",refer);
	}

	@Override
	public int getAllError(String refer) {
		return sqlSessionTemplate.selectOne("errorReport.getAllError",refer);
	}



	@Override
	public List<ErrorReportVO> findWord(String startWord, String endWord ,String containsWord,String type) {	
		if(type.equals("ExceptionMessage")){
			if ( startWord.length() != 0 ){
				return sqlSessionTemplate.selectList("errorReport.startWithException",startWord);
			}else if(  endWord.length() != 0){
				return sqlSessionTemplate.selectList("errorReport.endWithException",endWord);
			}else{
				return sqlSessionTemplate.selectList("errorReport.containsException",containsWord);
			}
		}else{
			if ( !startWord.equals("") ){
				return sqlSessionTemplate.selectList("errorReport.startWithError",startWord);
			}else if(  !endWord.equals("")){
				return sqlSessionTemplate.selectList("errorReport.endWithError",endWord);
			}else{
				return sqlSessionTemplate.selectList("errorReport.containsError",containsWord);
			}
		}
	}

	@Override
	public int reportUpdate(ErrorReportVO vo) {
		
	      String content = "";
	      content = vo.getContent().replaceAll("<", "&lt;");
	      content = content.replaceAll(">", "&gt");
	      vo.setContent(content);
	      
		sqlSessionTemplate.update("errorReport.update", vo);
		return vo.getErrorNo();
	}

	@Override
	public boolean duplicateTitle(ErrorReportVO vo, String type, String title) {
		Map map =new HashMap();
		map.put("id", vo.getId());
		map.put("title", title);
		if(type.equals("exception") || type.equals("ExceptionMessage")){
			System.out.println("vo dupli" + vo +" title : " +title);
			if(sqlSessionTemplate.selectOne("errorReport.duplicateTitleException", map) == null){
				return false;
			}else{
				return true;
			}
		}else{
			if(sqlSessionTemplate.selectOne("errorReport.duplicateTitleError", map) == null){
				return false;
			}else{
				return true;
			}
		}
	}

	@Override
	public void updateDiscussionStatus(int errorNo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("errorReport.updateDiscussionStatus",errorNo);
	}






	
	
}
