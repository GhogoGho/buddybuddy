package edu.kh.bubby.online.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.OnReview;

@Repository
public class OnReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 수강 후기 목록 조회
	 * @param classNo
	 * @return reviewList
	 */
	public List<OnReview> selectList(int classNo) {
		return sqlSession.selectList("onReviewMapper.selectList", classNo);
	}

	/** 수강후기 작성
	 * @param review
	 * @return result
	 */
	public int insertReview(OnReview review) {
		return sqlSession.insert("onReviewMapper.insertReview", review);
	}

	/** 수강후기 수정
	 * @param review
	 * @return result
	 */
	public int updateReview(OnReview review) {
		return sqlSession.update("onReviewMapper.updateReview", review);
	}

	/** 수강후기 삭제
	 * @param reviewNo
	 * @return result
	 */
	public int deleteReview(int reviewNo) {
		return sqlSession.update("onReviewMapper.deleteReview", reviewNo);
	}
	
}
