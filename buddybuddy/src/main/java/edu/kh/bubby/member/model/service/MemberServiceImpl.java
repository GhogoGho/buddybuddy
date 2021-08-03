package edu.kh.bubby.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.bubby.member.model.dao.MemberDAO;
import edu.kh.bubby.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberDAO dao;

//	회원가입 Service
	@Transactional
	@Override
	public int signUp(Member inputMember) {
		
		String encPwd = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		inputMember.setMemberPw(encPwd);
		
		return dao.signUp(inputMember);
	}

//	id 중복검사 Service
	@Override
	public int idDupCheck(String id) {
		
		return dao.idDupCheck(id);
	}
	
	

}
