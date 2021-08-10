package edu.kh.bubby.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.bubby.online.model.service.NoticeService;
import edu.kh.bubby.online.model.vo.Notice;

@Controller
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
		
	
	
	
}
