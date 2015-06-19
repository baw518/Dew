package org.kosta.dew.model.service;

import java.util.HashMap;
import java.util.List;

import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;

public interface HomeService {

	List<HashMap<String, Object>> mainRankingLoad();

	List<VideoVO> videoListLoad();

	List<DiscussVO> discussListLoad();

	List<QnAVO> qnaListLoad();

	List<ProjectVO> projectListLoad();

	List<ErrorReportVO> errorReportExceptionList();

	List<ErrorReportVO> errorReportErrorCodeList();

}
