package edu.kh.bubby.online.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.member.controller.MemberController;
import edu.kh.bubby.online.model.service.NoticeService;
import edu.kh.bubby.online.model.service.OnlineService;
import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

@Controller
@RequestMapping("/class/*")
@SessionAttributes({"loginMember"})
public class OnlineControllerBackup {

	
	 @Autowired 
	 private OnlineService service;
	 
	 @Autowired
	 private NoticeService noticeService;
	
	// 클래스 목록 조회
	@RequestMapping("{classType}/list")
	public String onlineClassList(@PathVariable("classType") int classType,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			Model model, Pagination pg, Search search) {
		
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		
//		System.out.println("search : "+search);
		
		Pagination pagination = null;
		List<Online> onlineList = null;
		
		
		if(search.getSk() == null) {
			pagination = service.getPagination(pg);
			onlineList = service.selectOnlineList(pagination);
		}else {
			pagination = service.getPagination(search, pg);
			onlineList = service.selectOnlineList(search, pagination);
		}
		/*
		for(Online a : onlineList) {
			System.out.println("a : "+a);
		}*/
		model.addAttribute("onlineList", onlineList);
		model.addAttribute("pagination", pagination);
		
		return "onlineClass/onlineMain";
	}
	
	// 클래스 상세 조회
	@RequestMapping("{classType}/{classNo}")
	public String onlineView(@PathVariable("classType") int classType,
							@PathVariable("classNo") int classNo,
							@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							Model model, RedirectAttributes ra) {
		
		Online online = service.selectOnline(classNo);
		
		if(online != null) { // 인기순 정렬용 조회수 증가
			model.addAttribute("online", online);
			return "onlineClass/onlineView";
		}else {
			MemberController.swalSetMessage(ra, "error", "클래스 조회 실패", "해당 클래스가 존재하지 않습니다.");
			return "redirect:list";
		}
	}
	
	
	
	
	// =================================================================================================================
	
	// 클래스 영상 수강 페이지
	@RequestMapping("{classType}/{classNo}/video")
	public String onlineVideo(@PathVariable("classType") int classType,
			@PathVariable("classNo") int classNo,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
			Model model) {
		
		// 공지사항 목록 조회
		List<Notice> nList = noticeService.selectNoticeList(classNo);
		model.addAttribute("nList", nList);
		
		
		return "onlineClass/onlineVideo";
	}
	
	
}
