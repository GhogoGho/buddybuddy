package edu.kh.bubby.offline.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.offline.model.vo.OffReview;

@Repository
public class OfflineReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**리뷰 삽입
	 * @param review
	 * @return
	 */
	public int insertReview(OffReview review) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("offReviewMapper.insertReview",review);
	}

	
	/**리뷰 조회
	 * @param classNo
	 * @return
	 */
	public List<OffReview> selectReviewList(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("offReviewMapper.selectReviewList",classNo);
	}
}
