package org.kosta.dew.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.SearchDAO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceImpl implements SearchService{
	@Resource
	private SearchDAO searchDAO;

	@Override
	public List<ErrorReportVO> searchErrorCode(Map<String, String> map) {
		
		return searchDAO.searchErrorCode(map);
	}

	@Override
	public int getSearchErrorCodeCount(String wordName) {
		
		return searchDAO.getSearchErrorCodeCount(wordName);
	}

	@Override
	public List<ErrorReportVO> searchException(HashMap<String, String> map) {
		
		return searchDAO.searchException(map);
	}

	@Override
	public int getSearchExceptionCount(String wordName) {
		
		return searchDAO.getSearchExceptionCount(wordName);
	}

	@Override
	public List<QnAVO> searchQnA(HashMap<String, String> map) {
		
		return searchDAO.searchQnA(map);
	}

	@Override
	public int getSearchQnACount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.getSearchQnACount(wordName);
	}

	@Override
	public List<DiscussVO> searchDiscuss(HashMap<String, String> map) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchDiscuss(map);
	}

	@Override
	public int getSearchDiscussCount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.getSearchDiscussCount(wordName);
	}

	@Override
	public List<ProjectVO> searchProject(HashMap<String, String> map) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchProject(map);
	}

	@Override
	public int getSearchProjectCount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.getSearchProjectCount(wordName);
	}

	@Override
	public List<VideoVO> searchVideo(HashMap<String, String> map) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchVideo(map);
	}

	@Override
	public int getSearchVideoCount(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.getSearchVideoCount(wordName);
	}

	@Override
	public List<ErrorReportVO> searchThreeErrorCode(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchThreeErrorCode(wordName);
	}

	@Override
	public List<ErrorReportVO> searchThreeException(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchThreeException(wordName);
	}

	@Override
	public List<QnAVO> searchThreeQnA(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchThreeQnA(wordName);
	}

	@Override
	public List<DiscussVO> searchThreeDiscuss(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchThreeDiscuss(wordName);
	}

	@Override
	public List<ProjectVO> searchThreeProject(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchThreeProject(wordName);
	}

	@Override
	public List<VideoVO> searchThreeVideo(String wordName) {
		// TODO 자동 생성된 메소드 스텁
		return searchDAO.searchThreeVideo(wordName);
	}
}
