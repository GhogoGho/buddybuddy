package edu.kh.bubby.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.member.model.service.MemberService;
import edu.kh.bubby.member.model.vo.Member;

@Controller
@RequestMapping("member/*")
@SessionAttributes({ "loginMember" })
public class MemberController {
	
	@Autowired
	private MemberService service;
	
//	로그인 화면 전환용 Controller
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
//	회원가입 화면 전환용 Controller
	@RequestMapping(value="signUp", method=RequestMethod.GET)
	public String signUp() {
		return "member/signUp";
	}
	
	
//	회원가입 Controller
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	public String signUp(@ModelAttribute Member inputMember, RedirectAttributes ra) {
		
		int result = service.signUp(inputMember);
		
		System.out.println(inputMember);
		
		System.out.println(result);
		
		if(result > 0) {
			swalSetMessage(ra, "success", "회원가입 성공하셨습니다!", inputMember.getMemberNickname() + "님 환영합니다!");
		} else {
			swalSetMessage(ra, "error", "회원가입 실패하였습니다.", "내용을 다시 확인해주세요.");
		}
		
		return "redirect:/";
	}	
	
//	아이디 중복 검사 Controller(ajax)
	@ResponseBody
	@RequestMapping(value = "idDupCheck", method = RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {
		
		int result = service.idDupCheck(id);
		
		return result;
	}
	
	// 로그인 Controller
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Member inputMember, Model model, HttpServletRequest request,
						HttpServletResponse response, RedirectAttributes ra, 
						@RequestParam(value="save", required = false) String save ) {
		
		System.out.println("memberEmail : " + inputMember.getMemberEmail());
		System.out.println("memberPw : " + inputMember.getMemberPw());
		System.out.println("save : " + save);
		
		Member loginMember = service.login(inputMember);
		
		System.out.println("로그인 결과 : " + loginMember);
		
		if(loginMember != null) {
			model.addAttribute("loginMember", loginMember);
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
			
			if(save != null) {
				
				cookie.setMaxAge(60 * 60* 24 * 30);
			
			} else {
				
				cookie.setMaxAge(0);
				
			}
			
			cookie.setPath(request.getContextPath());
			
			response.addCookie(cookie);
			
		} else {
			
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "로그인에 실패하였습니다<br> 다시 시도해주세요.");
		}
		
		
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	SweetAlert를 이용한 메세지 전달용 메소드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
//		RedirectAttributes : 리다이렉트 시 값을 전달하는 용도의 객체

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);

	}

}
