package edu.kh.bubby.online.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bubby.online.model.service.OnlineService;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

@Controller
@RequestMapping("/class/*")
@SessionAttributes({"loginMember"})
public class OnlineController {

	
	 @Autowired private OnlineService service;
	 
	
	// 클래스 목록 조회
	@RequestMapping("{classType}/list")
	public String onlineClassList(@PathVariable("classType") int classType,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			Model model, Pagination pg) {
		
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		
		Pagination pagination = service.getPagination(pg);
		List<Online> onlineList = service.selectOnlineList(pagination);
		
		for(Online a : onlineList) {
			System.out.println("a : "+a);
		}
		
		model.addAttribute("onlineList", onlineList);
		model.addAttribute("pagination", pagination);
		
		return "onlineClass/onlineMain";
	}
}
