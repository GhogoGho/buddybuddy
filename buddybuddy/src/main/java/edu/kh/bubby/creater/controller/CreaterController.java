package edu.kh.bubby.creater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bubby.creater.model.service.CreaterService;

@Controller
@RequestMapping("/creater/*")
@SessionAttributes({"loginMember"})
public class CreaterController {
	
	@Autowired
	private CreaterService service;
	
	// 크리에이터 목록 조회
	@RequestMapping("main")
	public String createrMain() {
		
		
		return "creater/createrMain";
	}
	
	
	
	
	// 공지사항 작성 화면 전환
	@RequestMapping(value = "")
	public String insertNotice() {
		return null;
	}

}
