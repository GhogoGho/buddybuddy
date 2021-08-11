package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.online.model.vo.OnReview;

public interface OnReviewService {

	/** 수강 후기 목록 조회
	 * @param classNo
	 * @return reviewList
	 */
	List<OnReview> selectList(int classNo);

	/** 수강후기 작성
	 * @param review
	 * @return
	 */
	int insertReview(OnReview review, List<MultipartFile> reviewImgs, String webPath, String savePath);
//	int insertReview(OnReview review);

	/** 수강후기 수정
	 * @param review
	 * @return
	 */
	int updateReview(OnReview review, List<MultipartFile> reviewImgs, String webPath, String savePath);

	/** 수강후기 삭제
	 * @param reviewNo
	 * @return
	 */
	int deleteReview(int reviewNo);

}
