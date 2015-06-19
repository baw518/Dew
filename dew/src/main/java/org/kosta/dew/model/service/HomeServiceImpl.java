package org.kosta.dew.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.HomeDAO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Resource
	private HomeDAO homeDAO;

	@Override
	public List<HashMap<String, Object>> mainRankingLoad() {
		
		return homeDAO.mainRankingLoad();
	}

	@Override
	public List<VideoVO> videoListLoad() {
		
		return homeDAO.videoListLoad();
	}

	@Override
	public List<DiscussVO> discussListLoad() {
		
		return homeDAO.discussListLoad();
	}

	@Override
	public List<QnAVO> qnaListLoad() {
		
		return homeDAO.qnaListLoad();
	}

	@Override
	public List<ProjectVO> projectListLoad() {
		
		return homeDAO.projectListLoad();
	}

	@Override
	public List<ErrorReportVO> errorReportExceptionList() {
		// TODO 자동 생성된 메소드 스텁
		return homeDAO.errorReportExceptionList();
	}

	@Override
	public List<ErrorReportVO> errorReportErrorCodeList() {
		// TODO 자동 생성된 메소드 스텁
		return homeDAO.errorReportErrorCodeList();
	}
}
