package org.kosta.dew.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;

public interface SearchDAO {
	List<ErrorReportVO> searchErrorCode(Map<String, String> map);

	int getSearchErrorCodeCount(String wordName);

	List<ErrorReportVO> searchException(HashMap<String, String> map);

	int getSearchExceptionCount(String wordName);

	List<QnAVO> searchQnA(HashMap<String, String> map);

	int getSearchQnACount(String wordName);

	List<DiscussVO> searchDiscuss(HashMap<String, String> map);

	int getSearchDiscussCount(String wordName);

	List<ProjectVO> searchProject(HashMap<String, String> map);

	int getSearchProjectCount(String wordName);

	List<VideoVO> searchVideo(HashMap<String, String> map);

	int getSearchVideoCount(String wordName);

	List<ErrorReportVO> searchThreeErrorCode(String wordName);

	List<ErrorReportVO> searchThreeException(String wordName);

	List<QnAVO> searchThreeQnA(String wordName);

	List<DiscussVO> searchThreeDiscuss(String wordName);

	List<ProjectVO> searchThreeProject(String wordName);

	List<VideoVO> searchThreeVideo(String wordName);

}
