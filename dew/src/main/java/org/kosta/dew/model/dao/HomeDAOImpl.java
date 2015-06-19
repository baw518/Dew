package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAOImpl implements HomeDAO {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MemberVO> mainRankingLoad() {
		
		return sqlSessionTemplate.selectList("home.mainRankingLoad");
	}

	@Override
	public List<VideoVO> videoListLoad() {
		
		return sqlSessionTemplate.selectList("home.videoListLoad");
	}

	@Override
	public List<DiscussVO> discussListLoad() {
		
		return sqlSessionTemplate.selectList("home.discussListLoad");
	}

	@Override
	public List<QnAVO> qnaListLoad() {
		
		return sqlSessionTemplate.selectList("home.qnaListLoad");
	}

	@Override
	public List<ProjectVO> projectListLoad() {
	
		return sqlSessionTemplate.selectList("home.projectListLoad");
	}

	@Override
	public List<ErrorReportVO> errorReportExceptionList() {
		
		return sqlSessionTemplate.selectList("home.errorReportExceptionList");
	}

	@Override
	public List<ErrorReportVO> errorReportErrorCodeList() {
		
		return sqlSessionTemplate.selectList("home.errorReportErrorCodeList");
	}

}
