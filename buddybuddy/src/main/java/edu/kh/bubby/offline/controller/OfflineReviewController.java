package edu.kh.bubby.offline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.bubby.offline.model.service.OfflineReviewService;
import edu.kh.bubby.offline.model.vo.OffReview;

@RestController
@RequestMapping("/offReview/*")
public class OfflineReviewController {
	@Autowired
	private OfflineReviewService service;
	
	//리뷰 삽입
	@RequestMapping(value="insertReply",method = RequestMethod.POST)
	public int insertReview(OffReview review) {
		System.out.println(review);
		int result = service.insertReview(review);
		return result;
	}
	//리뷰 조회
	@RequestMapping(value="list",method=RequestMethod.POST)
	public String selectReviewList(@RequestParam("classNo") int classNo) {
		List<OffReview> rList = service.selectReviewList(classNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		
		return gson.toJson(rList);
	}
}
