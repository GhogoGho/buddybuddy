package edu.kh.bubby.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.bubby.online.model.service.OnReviewService;
import edu.kh.bubby.online.model.vo.OnReview;

@RestController
@Controller("/onReview/*")
@SessionAttributes({"loginMember"})
public class OnReviewController {

	@Autowired
	private OnReviewService service;
	
	@RequestMapping(value="list", method=RequestMethod.POST)
	public String selectList(int classNo) {
		List<OnReview> reviewList = service.selectList(classNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		return gson.toJson(reviewList);
	}
	
}
