package edu.kh.bubby.member.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

@Service
public interface MemberService {

	/** 회원가입 Service
	 * @param inputMember
	 * @return inputMember
	 */
	public abstract int signUp(Member inputMember);

	/** id 중복검사용 Service
	 * @param id
	 * @return result
	 */
	public abstract int idDupCheck(String id);

	/** 로그인 Service
	 * @param inputMember
	 * @return
	 */
	public abstract Member login(Member inputMember);

	/** 회원정보 수정 Service
	 * @param savePath 
	 * @param inputMember 
	 * @param currentPwd 
	 * @param formFile
	 * @param fileNameString 
	 * @return result1
	 */
	public abstract int updateInfo(String currentPwd, Member inputMember, String savePath, MultipartFile formFile, String fileName);


	/** 파일 저장용 Service
	 * @param fileName
	 * @return
	 */
	public abstract String rename(String fileName);

	/** 회원탈퇴 
	 * @param loginMember
	 * @param currentPwd
	 * @return result
	 */
	public abstract int secession(Member loginMember, String currentPwd);

	/** 크리에이터 회원가입 Service
	 * @param inputMember
	 * @return inputMember
	 */
	public abstract int creatorSignUp(Member inputMember);

	/** 아이디 찾기 Service
	 * @param findMember
	 * @return findMember
	 */
	public abstract String findId(Member findMember);

	/** 비번찾기 Service
	 * @param response
	 * @param findMember
	 * @throws Exception 
	 */
	public abstract void findPw(HttpServletResponse response, Member findMember) throws Exception;
	
	
	/** 이메일 발송 Service
	 * @param response
	 * @param div
	 */
	public abstract void sendEmail(Member findMember, String div);

	/** 카카오 로그인 Service
	 * @param kakaoMember
	 * @return kakaoMember
	 */
	public abstract Member kakaoLogin(Member kakaoMember);

	/** 온라인 클래스 조회 Service
	 * @param memberNo
	 * @return 
	 */
	public abstract List<Online> onlineList(int memberNo);

	/** 전체 내역 조회
	 * @param pg
	 * @return pagination
	 */
	public abstract Pagination getPagination(Pagination pg);
	

	
}

