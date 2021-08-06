package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
