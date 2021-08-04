package edu.kh.bubby.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/** 회원가입 DAO
	 * @param inputMember
	 * @return result
	 */
	public int signUp(Member inputMember) {
		
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}


	/** id 중복검사 DAO
	 * @param id
	 * @return result
	 */
	public int idDupCheck(String id) {
		
		return sqlSession.selectOne("memberMapper.idDupCheck", id);
	}


	/** 로그인 DAO
	 * @param memberEmail
	 * @return loginMember
	 */
	public Member login(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.login", memberEmail);
	}

}
