package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.OnReply;

public interface OnReplyService {

	/** 수강문의 목록 조회
	 * @param classNo
	 * @return rList
	 */
	List<OnReply> selectList(int classNo);

	/** 수강문의 작성
	 * @param reply
	 * @return result
	 */
	int insertReply(OnReply reply);

	/** 수강문의 수정
	 * @param reply
	 * @return result
	 */
	int updateReply(OnReply reply);

	/** 수강문의 삭제
	 * @param replyNo
	 * @return result
	 */
	int deleteReply(int replyNo);

	/** 수강문의 대댓글 작성
	 * @param reply
	 * @return result
	 */
	int insertComment(OnReply reply);
	
	/** 수강문의 대댓글 수정
	 * @param reply
	 * @return result
	 */
	int updateComment(OnReply reply);
	
	/** 수강문의 대댓글 삭제
	 * @param reply
	 * @return result
	 */
	int deleteComment(OnReply reply);

}
