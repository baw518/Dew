package org.kosta.dew.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.service.VideoService;
import org.kosta.dew.model.vo.MultiFileVO;
import org.kosta.dew.model.vo.VideoListVO;
import org.kosta.dew.model.vo.VideoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class VideoController {
	
	@Resource(name="uploadPath")
	private String path;
	@Resource
	private VideoService videoService;
	private Logger log = LoggerFactory.getLogger(getClass());
	private String playPath = "http://192.168.7.233:8888\\dew\\upload\\";

	/*
	 * @RequestMapping("video_write_view") public ModelAndView write(VideoVO
	 * vvo) { videoService.write(vvo); return new
	 * ModelAndView("redirect:/WEB-INF/views/video/showContentNoHit.do?no="
	 * +vvo.getVideoNo()); }
	 */
	@RequestMapping("video_listView.do")
	public String listview(HttpServletRequest request,HttpServletResponse response, Model model) {
		// 페이지번호
		String pageNo = request.getParameter("pageNo");
		//System.out.println(pageNo);
		VideoListVO vo = videoService.getVideoList(pageNo);
		
		model.addAttribute("vo", vo);
		return "video_listView";
	}

	@RequestMapping("video_showContent.do")
	public String showContent(
			int no,
			@CookieValue(value = "videoContent", required = false) String cookieValue,
			HttpServletResponse response, Model model) {
		VideoVO vvo = null;
		if (cookieValue == null) {
			//log.info("videoContent cookie 존재하지 않으므로 cookie 생성하고 count 증가");
			response.addCookie(new Cookie("videoContent", "|" + no + "|"));
			vvo = videoService.showContent(no);
		} else if (cookieValue.indexOf("|" + no + "|") == -1) {
			//log.info("videoContent cookie 존재하지만 {}번글은 처음 조회하므로 count증가", no);
			cookieValue += "|" + no + "|";
			// 글번호를 쿠키에 추가
			response.addCookie(new Cookie("videoContent", cookieValue));
			vvo = videoService.showContent(no);
		} else {
			//log.info("videoContent cookie 존재하고 이전에 해당 게시물 읽었으므로 count 증가x");
			vvo = videoService.showContentNoHit(no);
		}
		// 비디오 파일 경로 가져오기
		List<HashMap<String, String>> list = videoService.getVideoName(""+no);
		//System.out.println(vo);
		for(int i = 0 ; i < list.size() ; i++) {
			//	System.out.println("db 1번쨰 for문 "+i);
			String dbFileName = list.get(i).get("VIDEO_FILE_NAME");
			list.get(i).put("VIDEO_FILE_NAME",playPath+dbFileName);
		}
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("vvo", vvo);
		return "video_showContent";
	}
	@RequestMapping("video_delete.do")
	public String delete(HttpServletRequest request, Model model) {
		String no = request.getParameter("no");
		String filePath = ""; // ""; // new HttpServletRequestWrapper(request).getRealPath("/");
		List<HashMap<String, String>> list = videoService.getVideoName(no);
	//	System.out.println(list);
		//System.out.println(list.get(1).get("VIDEO_FILE_NAME"));
		for(int i = 0 ; i < list.size() ; i++) {
			File file = new File(filePath+path+list.get(i).get("VIDEO_FILE_NAME"));
			 if(file.exists()) {
				 file.delete();
			 }
		}
		videoService.deleteVideoFile(no);
		videoService.deleteVideo(no);
		 /*
		  *   파일 진짜 삭제 
		  * File file = new File(path+"파일명");
		 if(file.exists()) {
			 file.delete();
		 }*/
		VideoListVO vo = videoService.getVideoList("1");
		model.addAttribute("vo", vo);
		return "redirect:video_listView.do";
	}
	@RequestMapping("video_updateView.do")
	public String updateView(Model model,int no,HttpServletRequest request) {
		VideoVO vo = videoService.showContentNoHit(no);
		System.out.println( "path : " + path);
		//System.out.println(new HttpServletRequestWrapper(request).getRealPath("/"));
		model.addAttribute("vvo", vo);
		return "video_updateView";
	}
	@RequestMapping("video_update.do")
	public String update(HttpServletRequest request,Model model,VideoVO vo,MultiFileVO mvo) {
		String no = request.getParameter("videoNo");
		String content = "";
	    content = vo.getContent().replaceAll("<", "&lt;");
	    content = content.replaceAll(">", "&gt");
	    vo.setContent(content);
	//	System.out.println(no);
		//System.out.println(vo);
		String filePath = ""; // new HttpServletRequestWrapper(request).getRealPath("/");
		/* 변수 초기화 부분 */
		List<HashMap<String, String>> list = videoService.getVideoName(no); // 디비에 해당 글 비디오이름 가져옴
		List<MultipartFile> list2=mvo.getFile();		// view에서 파일을 가져온다.
	//	System.out.println(list);
		//System.out.println(list2);
		
		/* 글 업데이트 */
		videoService.updateVideo(vo);
		
		/* 삭제부분 */
		boolean del = true;
		//System.out.println("디비에 있는 개수"+list.size());
		//System.out.println("뷰에서 올리려는 개수"+list2.size());
		for(int i = 0 ; i < list.size() ; i++) {
		//	System.out.println("db 1번쨰 for문 "+i);
			String dbFileName = list.get(i).get("VIDEO_FILE_NAME");
			for(int j = 0 ; j < list2.size() ; j++)  {
			//	System.out.println("뷰 2번쨰 for문 "+j);
				if(dbFileName.equals(list2.get(j).getOriginalFilename())) {
					del = false;
					break;
				} 
			}
			if(del) { // del이 true이면 디비에 있는 filename이 view에 없음 따라서 삭제해야함
				videoService.deleteVideoFileName(no,dbFileName); // 해당 게시글에 디비 삭제
			// System.out.println("디비 삭제"+dbFileName);
				File file = new File(filePath+path+dbFileName);	// 파일 삭제
				file.delete();
			//	System.out.println("filedelete ok"+dbFileName);
			}
			del = true;	// del 초기화
		}
		
		/* insert 부분 */
		
		boolean flag = true;
		for(int i=0;i<list2.size();i++){	// 올리고자 하는 파일 하나하나접근
			String fileName=list2.get(i).getOriginalFilename();		// 파일이름 가져옴
			for(int j = 0 ; j < list.size() ;j++) {
				if(fileName.equals(list.get(j).get("VIDEO_FILE_NAME"))) {	// 디비에 있는 것들과 비교
					flag = false;	// 있으면 false
					break;
				}
			}
			if(flag){	// 없으면 파일 새로 생성
				try {
					list2.get(i).transferTo(new File(filePath+path+fileName));	// 파일 올림
					videoService.file(vo,fileName);	// 디비에 넣어줌
					//nameList.add(fileName);	
				//	System.out.println("fileupload ok:"+fileName);
				} catch (Exception e) {					
					e.printStackTrace();
				}
			} else {
			//	System.out.println("이미 존재하는 file: "+fileName);
			}
			flag = true;
		}
		
		/* 리스트 가져오는 부분 */
		/*
		VideoVO vvo = videoService.showContentNoHit(vo.getVideoNo());
		model.addAttribute("vvo", vvo);
		return "video_showContent";*/
		VideoListVO vvo = videoService.getVideoList("1");
		model.addAttribute("vo", vvo);
		
		return "redirect:video_listView.do";
	}
	@RequestMapping("video_writeView.do")
	public String writeView(Model model) {
		return "video_writeView";
	}
	
	@RequestMapping("video_write.do")
	public String write(HttpServletRequest request,Model model,VideoVO vo,MultiFileVO mvo) {
	//	System.out.println("write.do");
		String content = "";
	    content = vo.getContent().replaceAll("<", "&lt;");
	    content = content.replaceAll(">", "&gt");
	    vo.setContent(content);
		videoService.write(vo);
		
	//	System.out.println(vo);
	//	System.out.println(mvo);
		String filePath = ""; // new HttpServletRequestWrapper(request).getRealPath("/");
		//System.out.println(filePath);
		List<MultipartFile> list=mvo.getFile();
		ArrayList<String> nameList=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			//System.out.println(list.get(i).getOriginalFilename().equals(""));
			String fileName=list.get(i).getOriginalFilename();			
			if(!fileName.equals("")){
				try {
					list.get(i).transferTo(new File(filePath+path+fileName));
					System.out.println(filePath+path+fileName+"경로로 파일올라감");
					videoService.file(vo,fileName);
					nameList.add(fileName);
				//	System.out.println("fileupload ok:"+fileName);
				} catch (Exception e) {					
					e.printStackTrace();
				}
			}
		}
		
		VideoListVO vvo = videoService.getVideoList("1");
		model.addAttribute("vo", vvo);
		
		return "redirect:video_listView.do";
	}
	/*
	 * @RequestMapping("showContentNoHit.do") public ModelAndView
	 * showContentNoHit(int no) { return new
	 * ModelAndView("video_content_view","vvo"
	 * ,videoService.showContentNoHit(no)); }
	 */
}
