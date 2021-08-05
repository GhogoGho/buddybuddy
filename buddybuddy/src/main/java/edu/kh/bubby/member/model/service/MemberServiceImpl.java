package edu.kh.bubby.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.member.exception.SaveFileException;
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

//	로그인 Service
	@Override
	public Member login(Member inputMember) {

		System.out.println(inputMember);

		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());

		Member loginMember = dao.login(inputMember.getMemberEmail());

		System.out.println(loginMember);

		if (loginMember != null) {

			if (!bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {

				loginMember = null;

			} else {

				loginMember.setMemberPw(null);

			}
		}

		return loginMember;
	}


//	회원정보 수정 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInfo(String newPwd, Member inputMember, String savePath, MultipartFile formFile, String fileName) {
		//		DB저장용 회원의 비밀번호 조회
		String savePwd = dao.selectPassword(inputMember.getMemberNo());
		
		System.out.println(savePwd);

		int result = 0;

		if (bCryptPasswordEncoder.matches(inputMember.getMemberPw(), savePwd)) {

			
			
			// 1) 외훤 정보 부터 수정
			result = dao.updateInfo(inputMember);
			
			if(result > 0 ) {
				
				if(formFile.getOriginalFilename() != null) { // 업로드된 이미지가 있을때
					try {
						formFile.transferTo( new File(savePath + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						throw new SaveFileException();
					}
				}
				
				if(newPwd != null) {
					// 2) 회원 정보 변경이 성공했고, 새 비밀번호가 입력 되었을 때만 비밀번호 변경
					String encPwd = bCryptPasswordEncoder.encode(newPwd);
					inputMember.setMemberNo(inputMember.getMemberNo());
					inputMember.setMemberPw(encPwd);
					result = dao.changePwd(inputMember);
				}
			}
		}

		return result;
	}
	
	
	
	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}

}