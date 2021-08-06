package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.OnReview;

public interface OnReviewService {

	/** 수강 후기 목록 조회
	 * @param classNo
	 * @return reviewList
	 */
	List<OnReview> selectList(int classNo);

}
