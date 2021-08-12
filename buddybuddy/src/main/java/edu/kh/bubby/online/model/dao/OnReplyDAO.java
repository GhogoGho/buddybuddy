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

	/** 수강문의 대댓글 작성
	 * @param reply
	 * @return result
	 */
	public int insertComment(OnReply reply) {
		return sqlSession.update("onReplyMapper.insertComment", reply);
	}
	
	/** 수강문의 대댓글 수정
	 * @param reply
	 * @return result
	 */
	public int updateComment(OnReply reply) {
		return sqlSession.update("onReplyMapper.updateComment", reply);
	}
	
	/** 수강문의 대댓글 삭제
	 * @param reply
	 * @return result
	 */
	public int deleteComment(OnReply reply) {
		return sqlSession.update("onReplyMapper.deleteComment", reply);
	}
}
