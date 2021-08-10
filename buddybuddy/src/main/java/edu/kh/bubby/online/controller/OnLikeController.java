package edu.kh.bubby.online.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.service.OnLikeService;
import edu.kh.bubby.online.model.vo.OnLike;

@RestController
@RequestMapping("/onLike/*")
@SessionAttributes({"loginMember"})
public class OnLikeController {
	@Autowired
	private OnLikeService service;
	
	
	// 찜하기 누른 Member 목록
	@RequestMapping(value = "onlineLikeCheck", method = RequestMethod.POST)
	public String onlineLikeCheck(int classNo) {
		List<Member> mList = service.selectMemberList(classNo);
		Gson gson = new Gson();
		System.out.println("mList:"+mList);
		return gson.toJson(mList);
	}
	// 찜하기 삽입, 삭제
	@RequestMapping(value = "onlineLike", method = RequestMethod.POST)
	public OnLike onlineLike(OnLike onLike,
							@ModelAttribute("loginMember") Member loginMember) {
		onLike.setMemberNo( loginMember.getMemberNo() );
		System.out.println("onLike: "+onLike);
		return service.onlineLike(onLike);
	}
	// 찜하기 수 카운트
	@RequestMapping(value = "onlineLikeCount", method = RequestMethod.POST)
	public OnLike onlineLikeCount(int classNo) {
		return service.onlineLikeCount(classNo);
	}
	
	
	
}
