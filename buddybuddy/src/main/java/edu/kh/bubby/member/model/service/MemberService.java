package edu.kh.bubby.member.model.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.member.model.vo.Member;

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
}
