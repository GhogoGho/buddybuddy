package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.vo.OnLike;

public interface OnLikeService {

	/** 찜하기 누른 Member 목록
	 * @param classNo
	 * @return mList
	 */
	List<Member> selectMemberList(int classNo);

	/** 찜하기 삽입, 삭제
	 * @param onLike
	 * @return onLike
	 */
	OnLike onlineLike(OnLike onLike);

	/** 찜하기 수 카운트
	 * @param classNo
	 * @return 
	 */
	OnLike onlineLikeCount(int classNo);

}
