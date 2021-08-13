package edu.kh.bubby.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.service.NoticeService;
import edu.kh.bubby.online.model.vo.Notice;

@RestController
@RequestMapping("/onNotice/*")
@SessionAttributes({"loginMember"})
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	// 공지사항 목록 조회
	@RequestMapping(value="list", method=RequestMethod.POST)
	@ResponseBody
	public String selectList(int classNo) {
		List<Notice> nList = service.selectNoticeList(classNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		
		return gson.toJson(nList);
	}
	
	// 내 공지사항 목록 조회(크리에이터용)
	@RequestMapping(value="myList", method=RequestMethod.POST)
	@ResponseBody
	public String selectMyList(@ModelAttribute Notice notice,
			@ModelAttribute("loginMember") Member loginMember) {
		
		notice.setMemberNo(loginMember.getMemberNo() );
		System.out.println("notice:"+notice);
		List<Notice> nList = service.selectMyNotice(notice);
		System.out.println("nList:"+nList);
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		
		return gson.toJson(nList);
	}
	
	// 공지사항 수정
	@RequestMapping(value="updateNotice", method=RequestMethod.POST)
	public int updateNotice(Notice notice) {
		return service.updateNotice(notice);
	}
	
	// 공지사항 삭제
	@RequestMapping(value="deleteNotice", method=RequestMethod.POST)
	public int deleteNotice(int noticeNo) {
		return service.deleteNotice(noticeNo);
	}
	
}
