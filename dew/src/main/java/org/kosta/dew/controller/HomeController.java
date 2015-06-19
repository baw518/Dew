package org.kosta.dew.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.service.HomeService;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Resource
	private HomeService homeService;
	
	
	/**
	 * 메인화면 불러오기
	 * @param model
	 * @return
	 */
	@RequestMapping("home.do")
	public String homeView(Model model){
		
		//랭킹받아오기
		List<HashMap<String, Object>> rankingList = homeService.mainRankingLoad();
		model.addAttribute("rankingList", rankingList);
		
		//동영상강좌 받아오기
		List<VideoVO> videoList = homeService.videoListLoad();
		model.addAttribute("videoList", videoList);
		
		//토론방 받아오기
		List<DiscussVO> discussList = homeService.discussListLoad();
		model.addAttribute("discussList", discussList);
		
		//QnA 받아오기
		List<QnAVO> qnaList = homeService.qnaListLoad();
		model.addAttribute("qnaList", qnaList);
		
		//프로젝트 받아오기
		List<ProjectVO> projectList = homeService.projectListLoad();
		model.addAttribute("projectList",projectList);
		
		//애러리포트 exception받아오기
		List<ErrorReportVO> errorReportExceptionList = homeService.errorReportExceptionList();
		model.addAttribute("errorReportExceptionList", errorReportExceptionList);
		
		//애러리포트 errorcode받아오기
		List<ErrorReportVO> errorReportErrorCodeList = homeService.errorReportErrorCodeList();
		model.addAttribute("errorReportErrorCodeList", errorReportErrorCodeList);
		return "home";
	}
	
	@RequestMapping("ranking_listView.do")
	public String rangkingListView(Model model){
		//랭킹받아오기
		List<HashMap<String,Object>> rankingList = homeService.mainRankingLoad();
		model.addAttribute("rankingList", rankingList);
		return "ranking_listView";
	}
	
	

	
}
