package org.kosta.dew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.service.SearchService;
import org.kosta.dew.model.vo.DiscussListVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportListVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAListVO;
import org.kosta.dew.model.vo.QnAVO;
import org.kosta.dew.model.vo.VideoListVO;
import org.kosta.dew.model.vo.VideoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 헤더에있는 검색창에 검색어를 입력하는경우 검색기능을 수행하는 컨트롤러.
 * @author KOSTA
 *
 */
@Controller
public class SearchController {
	/**
	 * 서치서비스 인터페이스를 DI
	 */
	@Resource
	private SearchService searchService;
	
	/**
	 * 검색하기. 
	 * 통합검색, 게시판별 검색인지를 판별하여 검색결과를 보여준다.
	 * 통합검색을 맨앞에 /가 없으면 해당단어로 통합검색결과를 보여주며, 
	 * /가 있는경우,  /[게시판이름] [검색단어] 에서 게시판이름이 존재하지 않을경우 검색단어로 통합검색결과를 보여준다.
	 * /[게시판이름]이 존재하는경우 해당게시판의 검색결과만을 보여준다.
	 * @param word 전체단어
	 * @return
	 */
	
	@RequestMapping("keyword.do")
	@ResponseBody
	public ArrayList<String> keyword(String term){
		ArrayList<String> list=new ArrayList<String>();
		if(term.equals("/")){
		list.add("/error ");
		list.add("/exception ");
		list.add("/qna ");
		list.add("/discuss ");
		list.add("/project ");
		list.add("/video ");
		}
		return list;
	}
	@RequestMapping("search_resultListView.do")
	public String resultListView(String word,Model model){
		String path = "search/allListView";
		
		//검색어의 맨앞에 /가있다면,  /게시판의 내용만 검색하여 결과를 보여준다.
		if(word.startsWith("/")){
			//스페이스의 위치값 반환.
			int indexOf = word.indexOf(" ");
			
			//스페이스가 있는경우만
			if(indexOf != -1){
				//게시판이름 구하기
				String boardName = word.substring(1, indexOf);
				//검색할 내용 구하기
				String wordName = word.substring(indexOf+1,word.length());
				
				//map에 페이지번호와 검색어 넣기
				HashMap<String,String> map = new HashMap<String,String>();
				//페이지는 1로 셋팅
				String pageNo="1";
				int pageNum = Integer.parseInt(pageNo);	
				map.put("pageNo", pageNo);
				map.put("wordName", wordName);
				
				/* 애러코드 */
				if(boardName.equals("error") || boardName.equals("errorcode") || boardName.equals("애러") || boardName.equals("애러코드")){
					//리스트에 검색어에 대한 결과 넣기
					List<ErrorReportVO> list = searchService.searchErrorCode(map);
	
					//페이징
					PagingBean pagingBean = new PagingBean(searchService.getSearchErrorCodeCount(wordName),pageNum);
					
					//리스트와 페이징을 저장하여 보냄
					ErrorReportListVO vo = new ErrorReportListVO(list,pagingBean);
					model.addAttribute("vo", vo);
					model.addAttribute("errorCode", list);
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
					
					path = "search_errorCodeListView";
				}
				/* exception */
				else if(boardName.equals("exception") || boardName.equals("예외") || boardName.equals("예외처리") ){
					//리스트에 검색어에 대한 결과넣기
					List<ErrorReportVO> list = searchService.searchException(map);
					
					//페이징
					PagingBean pagingBean = new PagingBean(searchService.getSearchExceptionCount(wordName),pageNum);
					
					//리스트와 페이징을 저장하여 보냄
					ErrorReportListVO vo = new ErrorReportListVO(list,pagingBean);
					model.addAttribute("vo", vo);
					model.addAttribute("exception", list);
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
					
					path = "search_exceptionListView";
					
				}
				/* qna */
				else if( boardName.equals("qna") || boardName.equals("질의응답") || boardName.equals("질문")){
					//리스트에 검색어에 대한 결과넣기
					List<QnAVO> list = searchService.searchQnA(map);
					
					//페이징
					PagingBean pagingBean = new PagingBean(searchService.getSearchQnACount(wordName),pageNum);
					
					//리스트와 페이징을 저장하여 보냄
					QnAListVO vo = new QnAListVO(list,pagingBean);
					model.addAttribute("vo", vo);
					model.addAttribute("qna", list);
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
					
					path = "search_qnaListView";
				}
				/* 토론방 */
				else if(boardName.equals("토론방") || boardName.equals("토론") || boardName.equals("discuss")){
					//리스트에 검색어에 대한 결과넣기
					List<DiscussVO> list = searchService.searchDiscuss(map);
					
					//페이징
					PagingBean pagingBean = new PagingBean(searchService.getSearchDiscussCount(wordName),pageNum);
					
					//리스트와 페이징을 저장하여 보냄
					DiscussListVO vo = new DiscussListVO(list,pagingBean);
					model.addAttribute("vo", vo);
					model.addAttribute("discuss", list);
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
					
					path = "search_discussListView";
				}
				/* 프로젝트 */
				else if(boardName.equals("프로젝트") || boardName.equals("project")){
					//리스트에 검색어에 대한 결과넣기
					List<ProjectVO> list = searchService.searchProject(map);

					//페이징
					PagingBean pagingBean = new PagingBean(searchService.getSearchProjectCount(wordName),pageNum);

					//리스트와 페이징을 저장하여 보냄
					ProjectListVO vo = new ProjectListVO(list,pagingBean);
					model.addAttribute("vo", vo);
					model.addAttribute("project", list);
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
					
					path = "search_projectListView";
				}
				else if(boardName.equals("강좌") || boardName.equals("강의") || boardName.equals("video")){
					//리스트에 검색어에 대한 결과넣기
					List<VideoVO> list = searchService.searchVideo(map);
					
					//페이징
					PagingBean pagingBean = new PagingBean(searchService.getSearchVideoCount(wordName),pageNum);
					
					//리스트와 페이징을 저장하여 보냄
					VideoListVO vo = new VideoListVO(list,pagingBean);	
					model.addAttribute("vo", vo);
					model.addAttribute("video", list);
					
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
					
					path = "search_videoListView";
				}
				//    /는 있지만 게시판을 찾을수 없는경우, /를 제외하고 뒤의 단어만을 검색한다. 모든게시판을 검색.
				else{
					//리스트에 검색어에 대한 결과 3개씩 넣기.
					List<ErrorReportVO> errorCodeList = searchService.searchThreeErrorCode(wordName);
					List<ErrorReportVO> exceptionList = searchService.searchThreeException(wordName);
					List<QnAVO> qnaList = searchService.searchThreeQnA(wordName);
					List<DiscussVO> discussList = searchService.searchThreeDiscuss(wordName);
					List<ProjectVO> projectList = searchService.searchThreeProject(wordName);
					List<VideoVO> videoList = searchService.searchThreeVideo(wordName);
					
					//리스트 보냄
					if(errorCodeList.size()!=0)
						model.addAttribute("errorCode", errorCodeList);
					if(exceptionList.size()!=0)
						model.addAttribute("exception", exceptionList);
					if(qnaList.size()!=0)
						model.addAttribute("qna",qnaList );
					if(discussList.size()!=0)
						model.addAttribute("discuss",discussList );
					if(projectList.size()!=0)
						model.addAttribute("project",projectList );
					if(videoList.size()!=0)
						model.addAttribute("video",videoList );
		
					//검색어도 보냄
					model.addAttribute("wordName", wordName);
				}
			}
		}
		//검색어의 맨앞에 /가 없는경우, 모든게시판을 검색.
		else{
			String wordName = word;
			
			//리스트에 검색어에 대한 결과 3개씩 넣기.
			List<ErrorReportVO> errorCodeList = searchService.searchThreeErrorCode(wordName);
			List<ErrorReportVO> exceptionList = searchService.searchThreeException(wordName);
			List<QnAVO> qnaList = searchService.searchThreeQnA(wordName);
			List<DiscussVO> discussList = searchService.searchThreeDiscuss(wordName);
			List<ProjectVO> projectList = searchService.searchThreeProject(wordName);
			List<VideoVO> videoList = searchService.searchThreeVideo(wordName);
			//System.out.println(errorCodeList);
			//리스트 보냄
			if(errorCodeList.size()!=0)
				model.addAttribute("errorCode", errorCodeList);
			if(exceptionList.size()!=0)
				model.addAttribute("exception", exceptionList);					
			if(qnaList.size()!=0)
				model.addAttribute("qna",qnaList );			
			if(discussList.size()!=0)
				model.addAttribute("discuss",discussList );	
			if(projectList.size()!=0)
				model.addAttribute("project",projectList );
			if(videoList.size()!=0){
				model.addAttribute("video",videoList );
			}
				

			//검색어도 보냄
			model.addAttribute("wordName", wordName);
		}
		
		return path;
	}
	
	/**
	 * 애러코드 페이징적용 검색결과
	 * @param pageNo
	 * @param wordName
	 * @param model
	 * @return
	 */
	@RequestMapping("search_errorCodeListView.do")
	public String errorCodeWordListView(String pageNo, String wordName,Model model){
		//map에 페이지번호와 검색어 넣기
		HashMap<String,String> map = new HashMap<String,String>();
		int pageNum = Integer.parseInt(pageNo);	
		map.put("pageNo", pageNo);
		map.put("wordName", wordName);
		
		//리스트에 검색어에 대한 결과 넣기
		List<ErrorReportVO> list = searchService.searchErrorCode(map);
		
		//페이징
		PagingBean pagingBean = new PagingBean(searchService.getSearchErrorCodeCount(wordName),pageNum);
		
		//리스트와 페이징을 저장하여 보냄
		ErrorReportListVO vo = new ErrorReportListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("errorCode", list);
		//검색어도 보냄
		model.addAttribute("wordName", wordName);
		
		return "search_errorCodeListView";
	}

	/**
	 * exception 페이징적용 검색결과
	 * @param pageNo 페이지번호
	 * @param wordName 검색단어
	 * @param model
	 * @return
	 */
	@RequestMapping("search_exceptionListView.do")
	public String exceptionListView(String pageNo, String wordName,Model model){
		//map에 페이지번호와 검색어 넣기
		HashMap<String,String> map = new HashMap<String,String>();
		int pageNum = Integer.parseInt(pageNo);	
		map.put("pageNo", pageNo);
		map.put("wordName", wordName);
		
		//리스트에 검색어에 대한 결과 넣기
		List<ErrorReportVO> list = searchService.searchException(map);
		
		//페이징
		PagingBean pagingBean = new PagingBean(searchService.getSearchExceptionCount(wordName),pageNum);
		
		//리스트와 페이징을 저장하여 보냄
		ErrorReportListVO vo = new ErrorReportListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("exception", list);
		//검색어도 보냄
		model.addAttribute("wordName", wordName);
		
		return "search_exceptionListView";
	}
	
	/**
	 * 질의응답 페이징적용 검색결과
	 * @param pageNo 페이지번호
	 * @param wordName 검색단어
	 * @param model
	 * @return
	 */
	@RequestMapping("search_qnaListView.do")
	public String qnaListView(String pageNo, String wordName,Model model){
		//map에 페이지번호와 검색어 넣기
		HashMap<String,String> map = new HashMap<String,String>();
		int pageNum = Integer.parseInt(pageNo);	
		map.put("pageNo", pageNo);
		map.put("wordName", wordName);
		
		//리스트에 검색어에 대한 결과 넣기
		List<QnAVO> list = searchService.searchQnA(map);
		
		//페이징
		PagingBean pagingBean = new PagingBean(searchService.getSearchQnACount(wordName),pageNum);
		
		//리스트와 페이징을 저장하여 보냄
		QnAListVO vo = new QnAListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("qna", list);
		//검색어도 보냄
		model.addAttribute("wordName", wordName);
		
		return "search_qnaListView";
	}
	
	/**
	 * 토론방 페이징적용 검색결과
	 * @param pageNo 페이지번호
	 * @param wordName 검색단어
	 * @param model
	 * @return
	 */
	@RequestMapping("search_discussListView.do")
	public String discussListView(String pageNo, String wordName,Model model){
		//map에 페이지번호와 검색어 넣기
		HashMap<String,String> map = new HashMap<String,String>();
		int pageNum = Integer.parseInt(pageNo);	
		map.put("pageNo", pageNo);
		map.put("wordName", wordName);
		
		//리스트에 검색어에 대한 결과 넣기
		List<DiscussVO> list = searchService.searchDiscuss(map);
		
		//페이징
		PagingBean pagingBean = new PagingBean(searchService.getSearchDiscussCount(wordName),pageNum);
		
		//리스트와 페이징을 저장하여 보냄
		DiscussListVO vo = new DiscussListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("discuss", list);
		//검색어도 보냄
		model.addAttribute("wordName", wordName);
		
		return "search_discussListView";
	}
	
	/**
	 * 프로젝트 페이징적용 검색결과
	 * @param pageNo
	 * @param wordName
	 * @param model
	 * @return
	 */
	@RequestMapping("search_projectListView.do")
	public String projectListView(String pageNo, String wordName,Model model){
		//map에 페이지번호와 검색어 넣기
		HashMap<String,String> map = new HashMap<String,String>();
		int pageNum = Integer.parseInt(pageNo);	
		map.put("pageNo", pageNo);
		map.put("wordName", wordName);
		
		//리스트에 검색어에 대한 결과 넣기
		List<ProjectVO> list = searchService.searchProject(map);
		
		//페이징
		PagingBean pagingBean = new PagingBean(searchService.getSearchProjectCount(wordName),pageNum);
		
		//리스트와 페이징을 저장하여 보냄
		ProjectListVO vo = new ProjectListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("project", list);
		//검색어도 보냄
		model.addAttribute("wordName", wordName);
		
		return "search_projectListView";
	}
	
	/**
	 * 동영상강의 페이징적용 검색결과
	 * @param pageNo 페이지번호
	 * @param wordName 검색단어
	 * @param model
	 * @return
	 */
	@RequestMapping("search_videoListView.do")
	public String videoListView(String pageNo, String wordName,Model model){
		//map에 페이지번호와 검색어 넣기
		HashMap<String,String> map = new HashMap<String,String>();
		int pageNum = Integer.parseInt(pageNo);	
		map.put("pageNo", pageNo);
		map.put("wordName", wordName);
		
		//리스트에 검색어에 대한 결과 넣기
		List<VideoVO> list = searchService.searchVideo(map);
		
		//페이징
		PagingBean pagingBean = new PagingBean(searchService.getSearchVideoCount(wordName),pageNum);
		
		//리스트와 페이징을 저장하여 보냄
		VideoListVO vo = new VideoListVO(list,pagingBean);
		model.addAttribute("vo", vo);
		model.addAttribute("video", list);
		//검색어도 보냄
		model.addAttribute("wordName", wordName);
		
		return "search_videoListView";
	}
}
