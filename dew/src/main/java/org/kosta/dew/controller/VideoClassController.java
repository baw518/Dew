package org.kosta.dew.controller;

import org.kosta.dew.model.vo.VideoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VideoClassController {
	@RequestMapping("getAllVideoList.do")
	public ModelAndView getAllVideoList(){
		return new ModelAndView();
	}
	@RequestMapping("getAllVideoList.do")
	public ModelAndView findVideo(VideoVO vvo){
		return new ModelAndView();
	}
	@RequestMapping("getAllVideoList.do")
	public ModelAndView uploadVideo(String path){
		return new ModelAndView();
	}
}
