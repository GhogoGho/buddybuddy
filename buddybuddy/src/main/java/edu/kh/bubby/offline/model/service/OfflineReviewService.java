package edu.kh.bubby.offline.model.service;

import java.util.List;

import edu.kh.bubby.offline.model.vo.OffReview;

public interface OfflineReviewService {

	/**리뷰 삽입
	 * @param review
	 * @return
	 */
	int insertReview(OffReview review);

	/**리뷰 조회
	 * @param classNo
	 * @return
	 */
	List<OffReview> selectReviewList(int classNo);

	/**리뷰 삭제
	 * @param classNo
	 * @return
	 */
	int deleteReview(int reviewNo);

}
