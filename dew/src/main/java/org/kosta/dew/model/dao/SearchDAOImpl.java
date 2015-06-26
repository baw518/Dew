package org.kosta.dew.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ErrorReportVO> searchErrorCode(Map<String, String> map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlSessionTemplate.selectList("search.errorCode", map);
	}

	@Override
	public int getSearchErrorCodeCount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return sqlSessionTemplate.selectOne("search.getSearchErrorCodeCount",wordName);
	}

	@Override
	public List<ErrorReportVO> searchException(HashMap<String, String> map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlSessionTemplate.selectList("search.exception",map);
	}

	@Override
	public int getSearchExceptionCount(String wordName) {
		
		return sqlSessionTemplate.selectOne("search.getSearchExceptionCount", wordName);
	}

	@Override
	public List<QnAVO> searchQnA(HashMap<String, String> map) {
		
		return sqlSessionTemplate.selectList("search.QnA",map);
	}

	@Override
	public int getSearchQnACount(String wordName) {
		
		return sqlSessionTemplate.selectOne("search.getSearchQnACount",wordName);
	}

	@Override
	public List<DiscussVO> searchDiscuss(HashMap<String, String> map) {
		
		return sqlSessionTemplate.selectList("search.discuss",map);
	}

	@Override
	public int getSearchDiscussCount(String wordName) {
		
		return sqlSessionTemplate.selectOne("search.getSearchDiscussCount",wordName);
	}

	@Override
	public List<ProjectVO> searchProject(HashMap<String, String> map) {
		
		return sqlSessionTemplate.selectList("search.project",map);
	}

	@Override
	public int getSearchProjectCount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return sqlSessionTemplate.selectOne("search.getSearchProjectCount",wordName);
	}

	@Override
	public List<VideoVO> searchVideo(HashMap<String, String> map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlSessionTemplate.selectList("search.video", map);
	}

	@Override
	public int getSearchVideoCount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return sqlSessionTemplate.selectOne("search.getSearchVideoCount",wordName);
	}

}
