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


	/** 비밀번호 수정용 DAO(일치 조건 확인용)
	 * @param memberNo
	 * @return result
	 */
	public String selectPassword(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.selectPassword", memberNo);
	}


	/** 비밀번호 수정 DAO 
	 * @param loginMember
	 * @return result
	 */
	public int changePwd(Member loginMember) {
		
		return sqlSession.update("memberMapper.changePwd", loginMember);
	}


	/** 회원정보 수정 DAO
	 * @param inputMember
	 * @return	result1
	 */
	public int updateInfo(Member inputMember) {
		
		return sqlSession.update("memberMapper.updateInfo", inputMember);
	}

	/** 회원탈퇴 DAO(조회)
	 * @param memberNo
	 * @return result
	 */
	public String selectMember(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember", memberNo);
	}
	

	/** 회원탈퇴 DAO
	 * @param loginMember
	 * @return result
	 */
	public int secession(Member loginMember) {
		
		return sqlSession.update("memberMapper.secession", loginMember);
	}


	/** 회원가입 DAO
	 * @param inputMember
	 * @return result
	 */
	public int creatorSignUp(Member inputMember) {
		
		return sqlSession.insert("memberMapper.creatorSignUp", inputMember);
	}


	public String findId(Member findMember) {
		
		return sqlSession.selectOne("memberMapper.findId", findMember);
	}



}
