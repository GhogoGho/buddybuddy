package edu.kh.bubby.online.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bubby.online.model.service.OnlineService;

@Controller
@RequestMapping("/class/*")
@SessionAttributes({"loginMember"})
public class OnlineController {

	
	/*
	 * @Autowired private OnlineService service;
	 */
	
	// 클래스 목록 조회
	@RequestMapping("{classType}/list")
	public String onlineClassList(@PathVariable("classType") int classType) {
		
		return "onlineClass/onlineMain";
	}
}
