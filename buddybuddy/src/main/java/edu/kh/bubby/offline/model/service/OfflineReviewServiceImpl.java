package edu.kh.bubby.offline.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.offline.model.dao.OfflineReviewDAO;
import edu.kh.bubby.offline.model.vo.OffReview;

@Service
public class OfflineReviewServiceImpl implements OfflineReviewService{

	@Autowired
	private OfflineReviewDAO dao;
	//리뷰 삽입
	@Override
	public int insertReview(OffReview review) {
		// TODO Auto-generated method stub
		int REVIEW_NO = dao.insertReview(review); 
		return REVIEW_NO;
	}
	//리뷰 조회
	@Override
	public List<OffReview> selectReviewList(int classNo) {
		// TODO Auto-generated method stub
		return dao.selectReviewList(classNo);
	}
}
