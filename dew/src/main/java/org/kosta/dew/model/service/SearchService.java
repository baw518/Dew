package org.kosta.dew.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;

public interface SearchService {
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
}
