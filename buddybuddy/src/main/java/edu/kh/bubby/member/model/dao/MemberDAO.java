package edu.kh.bubby.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.member.model.vo.Choice;
import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.member.model.vo.Payment;
import edu.kh.bubby.member.model.vo.Reply;
import edu.kh.bubby.member.model.vo.Reserve;
import edu.kh.bubby.member.model.vo.Review;
import edu.kh.bubby.offline.model.vo.OfflineClass;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

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


	/** 아이디 찾기 DAO
	 * @param findMember
	 * @return result
	 */
	public String findId(Member findMember) {
		
		return sqlSession.selectOne("memberMapper.findId", findMember);
	}
	

	/** 비밀번호 변경 DAO
	 * @param findMember
	 */
	public int updatePw(Member findMember) {
		
		return sqlSession.update("memberMapper.updatePw", findMember);
	}


	/** 비번 찾기 DAO (가입회원 조회용)
	 * @param memberEmail
	 * @return result
	 */
	public List<Object> findMember(String memberEmail) {
		
		return sqlSession.selectList("memberMapper.findMember", memberEmail);
	}


	/** 카카오 로그인
	 * @param kakaoMember
	 * @return 
	 */
	public Member kakaoLogin(Member kakaoMember) {
		
		System.out.println(kakaoMember.getMemberEmail());
		
		return sqlSession.selectOne("memberMapper.kakaoLogin", kakaoMember);
	}


	/** 클래스 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Payment> selectOnlineList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("memberMapper.selectOnlineList", pagination, rowBounds);
		
	}
	


	/** 전체 이용내역 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getListCount(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.getListCount", memberNo);
	}
	
	/** 전체 이용내역 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getListCount1(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.getListCount1", memberNo);
	}
	
	/** 전체 리뷰 내역 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getListCount2(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.getListCount2", memberNo);
	}
	
	/** 전체 후기 내역 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getListCount3(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.getListCount3", memberNo);
	}


	/** 예약 내역 조회 
	 * @param pagination
	 * @return
	 */
	public List<Reserve> selectReserveList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.selectReserveList", pagination, rowBounds);
	}


	/** 작성한 리뷰 조회
	 * @param pagination
	 * @return
	 */
	public List<Review> selectReviewList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.selectReviewList", pagination, rowBounds);
	}


	/** 작성한 후기 조회
	 * @param pagination
	 * @return
	 */
	public List<Reply> selectReplyList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.selectReplyList", pagination, rowBounds);
	}


	/** 예약 취소 DAO
	 * @param reserveNo
	 * @return result
	 */
	public int noReserve(int reserveNo) {
		
		return sqlSession.update("memberMapper.updateReserve", reserveNo);
	}


	/** 전체 목록 조회 
	 * @param memberNo
	 * @return
	 */
	public Pagination getListCount4(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.getListCount4", memberNo);
	}


	/** 찜하기 목록만 조회
	 * @param pagination
	 * @return
	 */
	public List<Choice> choiceList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.selectChoiceList", pagination, rowBounds);
	}









		
	



}
