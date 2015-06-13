package org.kosta.dew.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.service.VideoService;
import org.kosta.dew.model.vo.VideoListVO;
import org.kosta.dew.model.vo.VideoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VideoController {
	@Resource
	private VideoService videoService;
	private Logger log = LoggerFactory.getLogger(getClass());

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
		//System.out.println(vo);
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
		model.addAttribute("vvo", vvo);
		return "video_showContent";
	}
	@RequestMapping("video_delete.do")
	public String delete(HttpServletRequest request, Model model) {
		String no = request.getParameter("no");
		videoService.deleteVideo(no);
		VideoListVO vo = videoService.getVideoList("1");
		model.addAttribute("vo", vo);
		return "redirect:video_listView.do";
	}
	@RequestMapping("video_updateView.do")
	public String updateView(Model model,int no) {
		VideoVO vo = videoService.showContentNoHit(no);
		model.addAttribute("vvo", vo);
		return "video_updateView";
	}
	@RequestMapping("video_update.do")
	public String update(HttpServletRequest request,Model model,VideoVO vo) {
		System.out.println(request.getParameter("videoNo"));
		
		System.out.println("update.do");
		System.out.println(vo);
		videoService.updateVideo(vo);
		VideoVO vvo = videoService.showContentNoHit(vo.getVideoNo());
		model.addAttribute("vvo", vvo);
		return "video_showContent";
	}
	@RequestMapping("video_writeView.do")
	public String writeView(Model model) {
		return "video_writeView";
	}
	
	@RequestMapping("video_write.do")
	public String write(HttpServletRequest request,Model model,VideoVO vo) {
		System.out.println("write.do");
		System.out.println(vo);
		videoService.write(vo);
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
