package edu.kh.bubby.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.admin.model.service.AdminService;
import edu.kh.bubby.admin.model.vo.Question;
import edu.kh.bubby.board.model.vo.NOTIBoard;
import edu.kh.bubby.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
@SessionAttributes({"loginMember"})
public class AdminController {
	
	@Autowired
	private AdminService service;

	
//	메인화면 전환용 Controller
@RequestMapping(value="main", method=RequestMethod.GET)
public String main() {
	
	return "admin/main";
}

// Q&A 문의화면 전환용 Controller
@RequestMapping(value = "qnaSubmit", method = RequestMethod.GET)
public String qnaSubmit() {
	
	return "admin/qnaSubmit";
}

// Q&A 내용입력 Controller
@RequestMapping(value = "qnaSubmit", method = RequestMethod.POST)
public String qnaSubmit(Model model, RedirectAttributes ra, Question inputQuestion, @ModelAttribute("loginMember") Member loginMember) {
	 
	inputQuestion.setMemberNo(loginMember.getMemberNo());
	
	int result = service.qnaSubmit(inputQuestion);
	
	if(result > 0) {
		
		swalSetMessage(ra, "success", "문의가 접수되었습니다.", null);
		
	}else {
		
		swalSetMessage(ra, "error", "접수 실패하였습니다.", null);
	}
	
	
	return "redirect:/";
}

// Q&A 답변상태 업데이트 Controller
@RequestMapping(value = "qnaAnswerUpdate", method = RequestMethod.POST)
public String qnaAnswerUpdate(Model model, RedirectAttributes ra, @RequestHeader("referer") String referer, int queNo, String answerContent, Question inputQuestion) {
	
	service.qnaAnswerUpdate(inputQuestion);
	
	return "redirect:" + referer;
}

// Q&A 목록 조회 Controller
@RequestMapping("qnaList")
public String qnaList(Model model, Question inputQuestion) {
	
	List<Question> qnaList = service.qnaList(inputQuestion);
	
	model.addAttribute("qnaList", qnaList);
	
	return "admin/qnaList";
}

// 회원목록조회 Controller
@RequestMapping("memberSearch")
public String selectMemberList(Model model, Member inputMember) {
	
	List<Member> memberList = service.selectMemberList(inputMember);
	
	model.addAttribute("memberList", memberList);
	
	return "admin/memberSearch";
}

// 회원탈퇴 목록조회 Controller
@RequestMapping("memberSecession")
public String memberSecession(Model model, Member inputMember) {
	
	List<Member> memberSecessionList = service.memberSecession(inputMember);
	
	model.addAttribute("memberSecessionList", memberSecessionList);
	
	return "admin/memberSecession";
}

// 크리에이터 목록조회 Controller
@RequestMapping("memberCreator")
public String memberCreator(Model model, Member inputMember) {
	
	List<Member> memberCreatorList = service.memberCreator(inputMember);
	
	model.addAttribute("memberCreatorList", memberCreatorList);
	
	return "admin/memberCreator";
}

// 회원상태 업데이트(탈퇴) Controller
@ResponseBody
@RequestMapping(value = "memberStatusUpdate", method = RequestMethod.POST)
public int memberStatusUpdate(Model model, int memberNo) {
	
	return service.memberStatusUpdate(memberNo);
}

// 회원상태 업데이트(탈퇴취소) Controller
@ResponseBody
@RequestMapping(value = "memberStatusUpdate2", method = RequestMethod.POST)
public int memberStatusUpdate2(Model model, int memberNo) {
	
	return service.memberStatusUpdate2(memberNo);
}

// 크리에이터 승인 Controller
@ResponseBody
@RequestMapping(value = "memberGradeUpdate", method = RequestMethod.POST)
public int memberGradeUpdate(Model model, int memberNo) {
	
	return service.memberGradeUpdate(memberNo);
}

// 공지사항목록조회 Controller
@RequestMapping("notiBoard")
public String notiBoard(Model model, NOTIBoard board) {
	
	List<NOTIBoard> notiList = service.notiBoard(board);
	
	model.addAttribute("notiList", notiList);
	
	return "admin/notiBoard";
}

// 공지사항 상태 업데이트(내리기) Controller
@ResponseBody
@RequestMapping(value = "notiStatusUpdate", method = RequestMethod.POST)
public int notiStatusUpdate(Model model, int notiNo) {
	
	return service.notiStatusUpdate(notiNo);
}

// 공지사항 상태 업데이트(복구) Controller
@ResponseBody
@RequestMapping(value = "notiStatusUpdate2", method = RequestMethod.POST)
public int notiStatusUpdate2(Model model, int notiNo) {
	
	return service.notiStatusUpdate2(notiNo);
}

// FAQ목록조회 Controller
@RequestMapping("faqBoard")
public String faqBoard(Model model, NOTIBoard board) {
	
	List<NOTIBoard> faqList = service.faqBoard(board);
	
	model.addAttribute("faqList", faqList);
	
	return "admin/faqBoard";
}

//공지사항 상태 업데이트(내리기) Controller
@ResponseBody
@RequestMapping(value = "faqStatusUpdate", method = RequestMethod.POST)
public int faqStatusUpdate(Model model, int notiNo) {
	
	return service.faqStatusUpdate(notiNo);
}

//공지사항 상태 업데이트(복구) Controller
@ResponseBody
@RequestMapping(value = "faqStatusUpdate2", method = RequestMethod.POST)
public int faqStatusUpdate2(Model model, int notiNo) {
	
	return service.faqStatusUpdate2(notiNo);
}






// SweetAlert를 이용한 메시지 전달용 메소드
public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
	// RedirectAttributes: 리다이렉트 시 값을 전달하는 용도의 객체
	
	ra.addFlashAttribute("icon", icon);
	ra.addFlashAttribute("title", title);
	ra.addFlashAttribute("text", text);
	
}

}
