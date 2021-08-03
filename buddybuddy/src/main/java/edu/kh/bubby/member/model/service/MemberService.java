package edu.kh.bubby.member.model.service;

import org.springframework.stereotype.Service;

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
	 * @return
	 */
	public abstract int idDupCheck(String id);

}
