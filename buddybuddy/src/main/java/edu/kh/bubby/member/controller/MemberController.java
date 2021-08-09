package edu.kh.bubby.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {

		return "member/login";
	}

//	회원가입 화면 전환용 Controller
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUp() {
		return "member/signUp";
	}

//	회원가입 Controller
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(@ModelAttribute Member inputMember, RedirectAttributes ra) {

		int result = service.signUp(inputMember);

//		System.out.println(inputMember);	
//		System.out.println(result);

		if (result > 0) {
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

		System.out.println(result);

		return result;
	}

	// 로그인 Controller
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member inputMember, Model model, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes ra, @RequestParam(value = "save", required = false) String save) {

//		System.out.println("memberId : " + inputMember.getMemberEmail());
//		System.out.println("memberPw : " + inputMember.getMemberPw());
//		System.out.println("save : " + save);

		Member loginMember = service.login(inputMember);

		System.out.println(save);
		System.out.println(loginMember);

		HttpSession session = request.getSession();

		if (loginMember != null) {
			model.addAttribute("loginMember", loginMember);

			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());

			if (save != null) {

				cookie.setMaxAge(60 * 60 * 24 * 30);

			} else {

				cookie.setMaxAge(0);

			}

			cookie.setPath(request.getContextPath());

			response.addCookie(cookie);

		} else {

			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "로그인에 실패하였습니다. 다시 시도해주세요.");
		}

		return "redirect:/";
	}

//	로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:/";
	}

//	마이페이지 화면 전환용 Controller
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage() {

		return "member/myPage";
	}

//	info 화면 전환용 Controller
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String info() {
		return "member/info";
	}

//	info 수정용 Controller
	@RequestMapping(value = "info", method = RequestMethod.POST)
	public String updateInfo(@ModelAttribute("loginMember") Member loginMember, String inputEmail, String inputNickname,
			Member inputMember, RedirectAttributes ra, String newPwd1, HttpServletRequest request, String currentPwd,
			@RequestParam("formFile") MultipartFile formFile) {

		// @RequestParam(value="currentPwd", required=false) String currentPwd,
		// @RequestParam(value="newPwd1", required=false)
		// String currentPwd = request.getParameter("currentPwd");

		inputMember.setMemberNo(loginMember.getMemberNo());
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberNickname(inputNickname);
		inputMember.setMemberPw(currentPwd);

		String savePath = request.getSession().getServletContext().getRealPath("resources/images/member/");

		String fileName = null;

		if (formFile.getOriginalFilename() != null) { // 업로드된 이미지가 있을때

			inputMember.setMemberProfile("resources/images/member/" + fileName);

			fileName = service.rename(formFile.getOriginalFilename());

		}

		int result = service.updateInfo(newPwd1, inputMember, savePath, formFile, fileName);

		if (result > 0) { // 비밀번호 변경 성공

			swalSetMessage(ra, "success", "회원정보 수정 성공!", null);

			if (!formFile.getOriginalFilename().equals("")) { // 업로드된 이미지가 있을때

				loginMember.setMemberProfile("resources/images/member/" + fileName);
			} else {
				loginMember.setMemberProfile(fileName);
			}

			loginMember.setMemberNickname(inputNickname);
			loginMember.setMemberEmail(inputEmail);

		} else { // 실패

			swalSetMessage(ra, "error", "회원정보 수정 실패", "다시 확인해주세요.");
		}

		return "redirect:/";
	}

//	탈퇴 화면 전환용 Controller
	@RequestMapping(value = "secession", method = RequestMethod.GET)
	public String secession() {
		return "member/secession";
	}

//	회원탈퇴 Controller
	@RequestMapping(value = "secession", method = RequestMethod.POST)
	public String session(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam("currentPwd") String currentPwd, RedirectAttributes ra, SessionStatus status) {

		int result = service.secession(loginMember, currentPwd);

		if (result > 0) { // 탈퇴 성공

			swalSetMessage(ra, "success", "탈퇴 성공", null);

			status.setComplete();

			return "redirect:/main";

		} else {

			swalSetMessage(ra, "error", "탈퇴 실패", null);

			return "redirect:secession";

		}

	}

//	크리에이터 회원가입 화면 전환용 Controller
	@RequestMapping(value = "creatorSignUp", method = RequestMethod.GET)
	public String creatorSignUp() {
		return "member/creatorSignUp";
	}

//	크리에이터 회원가입 Controller
	@RequestMapping(value = "creatorSignUp", method = RequestMethod.POST)
	public String creatorSignUp(@ModelAttribute Member inputMember, RedirectAttributes ra) {

		int result = service.creatorSignUp(inputMember);

		if (result > 0) {
			swalSetMessage(ra, "success", "회원가입 성공하셨습니다!", inputMember.getMemberNickname() + "님 환영합니다!");
		} else {
			swalSetMessage(ra, "error", "회원가입 실패하였습니다.", "내용을 다시 확인해주세요.");
		}

		return "redirect:/";
	}

//	아이디 찾기 화면 전환용 Controller
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}

	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(@RequestParam("findEmail") String findEmail, @ModelAttribute Member findMember,
			RedirectAttributes ra, Model model, @RequestHeader("referer") String referer) {

		findMember.setMemberEmail(findEmail);

		String memberEmail = service.findId(findMember);
		findMember.setMemberEmail(memberEmail);

		if (memberEmail != null) {

			model.addAttribute("findMember", findMember);

			ra.addFlashAttribute("icon", "success");
			ra.addFlashAttribute("title", "회원님의 아이디는" + findMember.getMemberEmail());

		} else {
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "일치하는 회원이 없습니다. 다시 시도해주세요.");
		}

		return "redirect:" + referer;
	}

//	비번 찾기 화면 전환용 Controller
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw() {
		return "member/findPw";
	}

//	비번 찾기 Controller
	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public void findPw(@ModelAttribute Member findMember, Model model, @RequestParam("findEmail") String findEmail,
			@RequestParam("findNickname") String findNickname, HttpServletResponse response) throws Exception {

		findMember.setMemberEmail(findEmail);
		findMember.setMemberNickname(findNickname);

		System.out.println(findEmail);
		System.out.println(findNickname);

		service.findPw(response, findMember);
	}

//	SweetAlert를 이용한 메세지 전달용 메소드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
//		RedirectAttributes : 리다이렉트 시 값을 전달하는 용도의 객체

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);

	}

}
