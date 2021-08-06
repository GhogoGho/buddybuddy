package edu.kh.bubby.online.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.OnReply;

@Repository
public class OnReplyDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 수강문의 목록 조회
	 * @param classNo
	 * @return rList
	 */
	public List<OnReply> selectList(int classNo) {
		return sqlSession.selectList("onReplyMapper.selectList", classNo);
	}

	/** 수강문의 작성
	 * @param reply
	 * @return result
	 */
	public int insertReply(OnReply reply) {
		return sqlSession.insert("onReplyMapper.insertReply", reply);
	}

	/** 수강문의 수정
	 * @param reply
	 * @return result
	 */
	public int updateReply(OnReply reply) {
		return sqlSession.update("onReplyMapper.updateReply", reply);
	}

	/** 수강문의 삭제
	 * @param replyNo
	 * @return result
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("onReplyMapper.deleteReply", replyNo);
	}
}
