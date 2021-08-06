package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.bubby.online.model.dao.OnReviewDAO;
import edu.kh.bubby.online.model.vo.OnReview;

@Service
public class OnReviewServiceImpl implements OnReviewService{
	@Autowired
	private OnReviewDAO dao;

	// 수강 후기 목록 조회
	@Override
	public List<OnReview> selectList(int classNo) {
		return dao.selectList(classNo);
	}
	
	// 수강후기 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(OnReview review) {
		review.setReviewContent(OnlineServiceImpl.replaceParameter(review.getReviewContent()));
		review.setReviewContent(review.getReviewContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.insertReview(review);
	}
	
	// 수강후기 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReview(OnReview review) {
		review.setReviewContent(OnlineServiceImpl.replaceParameter(review.getReviewContent()));
		review.setReviewContent(review.getReviewContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.updateReview(review);
	}

	// 수강후기 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}
	
}
