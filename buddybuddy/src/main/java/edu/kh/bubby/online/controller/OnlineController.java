package edu.kh.bubby.online.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import edu.kh.bubby.member.controller.MemberController;
import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.service.NoticeService;
import edu.kh.bubby.online.model.service.OnReplyService;
import edu.kh.bubby.online.model.service.OnReviewService;
import edu.kh.bubby.online.model.service.OnlineService;
import edu.kh.bubby.online.model.vo.Category;
import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.OnReply;
import edu.kh.bubby.online.model.vo.OnReview;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

@Controller
@RequestMapping("/class/*")
@SessionAttributes({"loginMember"})
public class OnlineController {

	
	 @Autowired 
	 private OnlineService service;
	 
	 @Autowired
	 private NoticeService noticeService;
	 
	 @Autowired
	 private OnReplyService onReplyService;
	 
	 @Autowired
	 private OnReviewService onReviewService;
	
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
	
	
	// 클래스 individual 목록 조회
	@RequestMapping("{classType}/{memberNo}/individualList")
	public String individualList(@PathVariable("classType") int classType,
								@PathVariable("memberNo") int memberNo,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			Model model, Pagination pg, Search search) {
		
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		
		
		Pagination pagination = null;
		List<Online> individualList = null;
		
		
		if(search.getSk() == null) {
			pagination = service.getPagination(pg);
			/* individualList = service.selectOnlineList(pagination); */
			individualList = service.selectIndividualList(pagination);
		}else {
			pagination = service.getPagination(search, pg);
			individualList = service.selectOnlineList(search, pagination);
			/* individualList = service.selectIndividualList(search, pagination); */
		}
		
		for(Online a : individualList) {
			System.out.println("individualList : "+a);
		}
		model.addAttribute("individualList", individualList);
		model.addAttribute("pagination", pagination);
		
		return "onlineClass/onlineIndividualList";
	}
	
	
	
	// 클래스 상세 조회
	@RequestMapping("{classType}/{classNo}")
	public String onlineView(@PathVariable("classType") int classType,
							@PathVariable("classNo") int classNo,
							@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							Model model, RedirectAttributes ra) {
		
		Online online = service.selectOnline(classNo);
		
		if(online != null) { // 인기순 정렬용 조회수 증가
			// 수강문의 목록 조회
			List<OnReply> rList = onReplyService.selectList(classNo);
			model.addAttribute("rList", rList);
			
			// 수강후기 목록 조회
			List<OnReview> reviewList = onReviewService.selectList(classNo);
			model.addAttribute("reviewList", reviewList);
			
			model.addAttribute("online", online);
			return "onlineClass/onlineView";
		}else {
			MemberController.swalSetMessage(ra, "error", "클래스 조회 실패", "해당 클래스가 존재하지 않습니다.");
			return "redirect:list";
		}
	}
	
	
	// =================================================================================================================
	// DML
	
	// 클래스 삽입 화면 전환
	@RequestMapping(value="{classType}/insert", method=RequestMethod.GET)
	public String insertForm(Model model) {
		List<Category> category = service.selectCategory();
		model.addAttribute("category", category);
		return "onlineClass/onlineClassInsert1";
	}
	
	
	// 클래스 삽입
	@RequestMapping(value="{classType}/insert", method=RequestMethod.POST)
	public String insertOnlineClass(@PathVariable("classType") int classType,
								@ModelAttribute Online online,
								@ModelAttribute("loginMember") Member loginMember,
								@RequestParam("images") List<MultipartFile> images,
								HttpServletRequest request,
								RedirectAttributes ra
			) {
		
		
		online.setMemberNo( loginMember.getMemberNo() );
		online.setClassType(classType);
		String webPath = "resources/images/";
		switch(classType) {
		case 1 : webPath += "onlineClass/"; break;
		}
		
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		
		int classNo = service.insertOnlineClass(online, images, webPath, savePath);
		String path = null;
		if(classNo > 0) {
			path ="redirect:"+classNo;
			MemberController.swalSetMessage(ra, "success", "클래스 등록 성공", null);
		}else { 
			path= "redirect:"+request.getHeader("referer"); // 요청 이전 주소
			MemberController.swalSetMessage(ra, "error", "클래스 등록 실패", null);
		}
		return path;
	}
	
	// 클래스 수정 화면 전환
	@RequestMapping(value="{classType}/updateForm", method=RequestMethod.POST)
	public String updateForm(int classNo, Model model) {
		List<Category> category = service.selectCategory();
		Online online = service.selectUpdateOnline(classNo);
		
		model.addAttribute("category", category);
		model.addAttribute("online", online);
		
//		System.out.println("수정전환시:"+model);
//		System.out.println("수정전환시:"+online);
		
		return "onlineClass/onlineClassUpdate1";
	}
	
	// 클래스 수정
	@RequestMapping(value="{classType}/update", method=RequestMethod.POST)
	public String updateOnline(@PathVariable("classType") int classType,
						Online online,
						@RequestParam("videos") List<MultipartFile> videos,
						@RequestParam("deleteVideos") String deleteVideos,
						HttpServletRequest request, Model model, RedirectAttributes ra) {
		String webPath = "resources/videos/";
		switch(classType) {
		case 1 : webPath += "onlineClass/"; break;
		}
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		int result = service.updateOnline(online, videos, webPath, savePath, deleteVideos);
//		System.out.println("수정클릭"+online);
//		System.out.println("수정클륵 후 클번: "+online.getClassNo());
//		System.out.println("수정클륵 후 비디오: "+videos);
		String path = null;
		if(result > 0) {
			path="redirect:"+online.getClassNo();
			MemberController.swalSetMessage(ra, "success", "클래스 수정 성공", null);
		}else {
			path="redirect:"+request.getHeader("referer");
			MemberController.swalSetMessage(ra, "error", "클래스 수정 실패", null);
		}
		return path;
	}
	
	//=====================================================================================
	//=====================================================================================
	//썸머 테스트
	
	// 썸머 테스트 화면 전환용
	@RequestMapping(value="{classType}/write", method=RequestMethod.GET)
	public String summerWriteForm(Model model) {
		List<Category> category = service.selectCategory();
		model.addAttribute("category", category);
	  return "onlineClass/onlineClassInsertTest";
	}
	
	// 썸머 테스트 클래스 삽입
	@RequestMapping(value="{classType}/write", method=RequestMethod.POST)
	public String summerWrite(@PathVariable("classType") int classType, 
						@ModelAttribute Online online,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam("videos") List<MultipartFile> videos,
						HttpServletRequest request,
						RedirectAttributes ra) {
		online.setMemberNo(loginMember.getMemberNo());
		online.setClassType(classType);
		
		String webPath = "resources/videos/";
		
		switch(classType) {
		case 1 : webPath += "onlineClass/"; break;
		}
		
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		
		int classNo = service.insertOnline(online, videos, webPath, savePath);
//		System.out.println("클번:"+classNo);
		String path = null;
		if(classNo>0) {
			path = "redirect:"+classNo;
			MemberController.swalSetMessage(ra, "success", "클래스 삽입 성공", null);
		}else {
			path = "redirect:"+request.getHeader("referer");
			MemberController.swalSetMessage(ra, "error", "클래스 작성 실패", null);
		}
		return path;
	}
	
	// 썸머 테스트 클래스 수정 화면 전환용
	@RequestMapping(value="{classType}/updateSF", method=RequestMethod.POST)
	public String summerUpdateForm(int classNo, Model model) {
		List<Category> category = service.selectCategory();
		Online online = service.selectUpdateOnline(classNo);
		model.addAttribute("category", category);
		model.addAttribute("online", online);
		
//		System.out.println("수정전환시:"+model);
//		System.out.println("수정전환시:"+online);
		
	  return "onlineClass/onlineClassUpdateTest";
	}
	
	// 썸머 테스트 클래스 수정
	@RequestMapping(value="{classType}/updateSummer", method=RequestMethod.POST)
	public String summerUpdateOnline(@PathVariable("classType") int classType, 
						@ModelAttribute Online online,
						@RequestParam("videos") List<MultipartFile> videos,
						@RequestParam("deleteVideos") String deleteVideos,
						HttpServletRequest request, Model model, RedirectAttributes ra) {
		String webPath = "resources/videos/";
		switch(classType) {
		case 1 : webPath += "onlineClass/"; break;
		}
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		int result = service.summerUpdateOnline(online, videos, webPath, savePath, deleteVideos);
//		System.out.println("수정클릭"+online);
//		System.out.println("수정클륵 후 클번: "+online.getClassNo());
		
		String path = null;
		if(result>0) {
			path ="redirect:"+online.getClassNo();
			MemberController.swalSetMessage(ra, "success", "클래스 수정 성공", null);
		}else {
			path = "redirect:"+request.getHeader("referer");
			MemberController.swalSetMessage(ra, "error", "클래스 수정 실패", null);
		}
		return path;
	}
	
	
	// 썸머 테스트 삭제
	@RequestMapping(value="{classType}/delete", method=RequestMethod.POST)
	public String summerDeleteOnline(@PathVariable("classType") int classType,
									int classNo) {
		int result = service.summerDeleteOnline(classNo);
		
		return "redirect:/";
	}
	
	//=====================================================================================
	
	
	
	
	// =================================================================================================================
	
	// 클래스 영상 수강 페이지
	@RequestMapping(value="{classType}/video", method=RequestMethod.POST)
	public String onlineVideo(int classNo, Model model) {
		
		Online online = service.selectOnline(classNo);
		
		// 공지사항 목록 조회
		List<Notice> nList = noticeService.selectNoticeList(classNo);
		model.addAttribute("nList", nList);
		
		// 수강문의 목록 조회
		List<OnReply> rList = onReplyService.selectList(classNo);
		model.addAttribute("rList", rList);
		
		model.addAttribute("online", online);
		
		return "onlineClass/onlineVideo";
	}
	
	
}
