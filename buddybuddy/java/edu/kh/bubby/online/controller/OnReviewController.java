package edu.kh.bubby.online.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.bubby.online.model.service.OnReviewService;
import edu.kh.bubby.online.model.vo.OnReview;

@RestController
@RequestMapping("/onReview/*")
@SessionAttributes({"loginMember"})
public class OnReviewController {

	@Autowired
	private OnReviewService service;

	// 수강후기 목록 조회
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String selectList(int classNo) {
		List<OnReview> reviewList = service.selectList(classNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		return gson.toJson(reviewList);
	}

	// 수강 문의 작성
	@RequestMapping(value = "insertReview", method = RequestMethod.POST)
	public int insertReview(@ModelAttribute OnReview review
							/*@RequestParam("reviewImgs") List<MultipartFile> reviewImgs,
							HttpServletRequest request*/) {
//		String webPath = "resources/images/review/";
//		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		
//		return service.insertReview(review, reviewImgs, webPath, savePath);
		
		System.out.println("review: "+review);
		return service.insertReview(review);
	}

	// 수강 문의 수정
	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
	public int updateReview(OnReview review) {
		return service.updateReview(review);
	}

	// 수강 문의 삭제
	@RequestMapping(value = "deleteReview", method = RequestMethod.POST)
	public int deleteReview(int reviewNo) {
		return service.deleteReview(reviewNo);
	}

}
