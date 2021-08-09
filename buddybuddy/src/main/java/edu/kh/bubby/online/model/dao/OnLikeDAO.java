package edu.kh.bubby.online.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.vo.OnLike;

@Repository
public class OnLikeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 찜하기 누른 Member 목록
	 * @param classNo
	 * @return
	 */
	public List<Member> selectMemberList(int classNo) {
		return sqlSession.selectList("onLikeMapper.selectMemberList", classNo);
	}
	
	/** 찜하기 확인용
	 * @param onLike
	 * @return
	 */
	public OnLike onlineLikeCheck(OnLike onLike) {
		return sqlSession.selectOne("onLikeMapper.onlineLikeCheck", onLike);
	}

	/** 찜하기 삽입
	 * @param onLike
	 * @return
	 */
	public int onlineLike(OnLike onLike) {
		return sqlSession.insert("onLikeMapper.onlineLike", onLike);
	}
	
	/** 찜하기 취소(삭제)
	 * @param onLike
	 * @return
	 */
	public int onlineLikeCancel(OnLike onLike) {
		return sqlSession.delete("onLikeMapper.onlineLikeCancel", onLike);
	}
	

	/** 찜하기 수 카운트
	 * @param classNo
	 * @return
	 */
	public int onlineLikeCount(int classNo) {
		return sqlSession.selectOne("onLikeMapper.onlineLikeCount", classNo);
	}
}
