package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.OnReply;

public interface OnReplyService {

	/** 수강문의 목록 조회
	 * @param classNo
	 * @return rList
	 */
	List<OnReply> selectList(int classNo);

}
