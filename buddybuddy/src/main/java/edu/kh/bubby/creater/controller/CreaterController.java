package edu.kh.bubby.creater.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bubby.creater.model.service.CreaterService;
import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.service.NoticeService;
import edu.kh.bubby.online.model.service.OnlineService;
import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

@Controller
@RequestMapping("/creater/*")
@SessionAttributes({"loginMember"})
public class CreaterController {
	
	
	@Autowired
	private CreaterService service;
	
	
	// 크리에이터 목록 조회
	@RequestMapping("{classType}/main")// classType 넘겨받자
	public String createrMain(@PathVariable("classType") int classType,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			@ModelAttribute("loginMember") Member loginMember,
			Model model, Pagination pg, Search search) {
		
		
		int memberNo = loginMember.getMemberNo(); // 내 목록 조회용
		
		// 클래스 목록 조회
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		pg.setMemberNo(memberNo); // 내 공지사항 목록 조회용
		// 혹여나 추후 검색을 위해
		Pagination pagination = null;
		List<Online> classList = null;
		
		pagination = service.getPagination(pg);
		pagination.setMemberNo(memberNo); // 내 클래스 목록 조회용
		classList = service.getClassList(pagination);
		model.addAttribute("classList", classList);
		model.addAttribute("pagination", pagination);
		
		// 공지사항 목록 조회
		List<Notice> nList = service.selectMyNotice(memberNo);
		model.addAttribute("nList", nList);
		
		return "creater/createrMain";
	}
	
	
	
	
	// 공지사항 작성 화면 전환
	@RequestMapping(value = "")
	public String insertNotice() {
		return null;
	}

}
