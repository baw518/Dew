package org.kosta.dew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("home.do")
	public String homeView(){
		System.out.println("HomeController Start()..");
		return "home";
	}
	
}
