package edu.kh.bubby.creater.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.creater.model.service.CreaterService;
import edu.kh.bubby.member.controller.MemberController;
import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.service.NoticeService;
import edu.kh.bubby.online.model.service.OnReplyService;
import edu.kh.bubby.online.model.service.OnReviewService;
import edu.kh.bubby.online.model.service.OnlineService;
import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.OnReply;
import edu.kh.bubby.online.model.vo.OnReview;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

@Controller
@RequestMapping("/creater/*")
@SessionAttributes({"loginMember"})
public class CreaterController {
	
	
	@Autowired
	private CreaterService service;
	
	@Autowired
	private OnlineService onlineService;
	
	@Autowired
	private OnReplyService onReplyService;
	
	@Autowired
	private OnReviewService onReviewService;
	
	@Autowired
	private NoticeService noticeService;
	
	
	
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
	
	// 클래스 상세 조회
	@RequestMapping("{classType}/{classNo}")
	public String classView(@PathVariable("classType") int classType,
							@PathVariable("classNo") int classNo,
							@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							Model model, RedirectAttributes ra) {
		
		Online online = onlineService.selectOnline(classNo);
		
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
		
		
	
	// 공지사항 작성
	@RequestMapping(value = "{classType}/insertNotice", method=RequestMethod.POST)
	public String insertNotice(@PathVariable("classType") int classType,
							@ModelAttribute Notice notice,
							@ModelAttribute("loginMember") Member loginMember,
							HttpServletRequest request,
							RedirectAttributes ra) {
		
		notice.setMemberNo(loginMember.getMemberNo() );
		notice.setClassType(classType);
		int result = noticeService.insertNotice(notice);
		if(result>0) {
			MemberController.swalSetMessage(ra, "success", "공지사항 등록 성공", null);
		}else {
			MemberController.swalSetMessage(ra, "error", "공지사항 등록 실패", null);
		}
		return "redirect:"+request.getHeader("referer");
	}
	
	// 공지사항 수정
	@RequestMapping(value = "{classType}/updateNotice", method=RequestMethod.POST)
	public String updateNotice(@PathVariable("classType") int classType,
							@ModelAttribute Notice notice,
							@ModelAttribute("loginMember") Member loginMember,
							HttpServletRequest request,
							RedirectAttributes ra) {
		notice.setMemberNo(loginMember.getMemberNo() );
		notice.setClassType(classType);
		int result = noticeService.updateNotice(notice);
		if(result>0) {
			MemberController.swalSetMessage(ra, "success", "공지사항 수정 성공", null);
		}else {
			MemberController.swalSetMessage(ra, "error", "공지사항 수정 실패", null);
		}
		return "redirect:"+request.getHeader("referer");
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "{classType}/deleteNotice")
	public int deleteNotice(@PathVariable("classType") int classType,
			@ModelAttribute Notice notice,
			@ModelAttribute("loginMember") Member loginMember) {
		
		notice.setMemberNo(loginMember.getMemberNo());
		notice.setClassType(classType);
		System.out.println("공지삭제 : "+notice);
		
		return noticeService.deleteNotice(notice);
		
	}
}
