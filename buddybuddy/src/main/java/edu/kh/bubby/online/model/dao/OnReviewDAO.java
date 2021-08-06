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
}
