package edu.kh.bubby.member.model.service;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.member.exception.SaveFileException;
import edu.kh.bubby.member.model.dao.MemberDAO;
import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.member.model.vo.Payment;
import edu.kh.bubby.member.model.vo.Reply;
import edu.kh.bubby.member.model.vo.Reserve;
import edu.kh.bubby.member.model.vo.Review;
import edu.kh.bubby.offline.model.vo.OfflineClass;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private MemberDAO dao;

	@Autowired
	private JavaMailSender mailSender;

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

		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());

		Member loginMember = dao.login(inputMember.getMemberEmail());

		System.out.println("loginMember : " + loginMember);

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
		// DB저장용 회원의 비밀번호 조회
		String savePwd = dao.selectPassword(inputMember.getMemberNo());

		int result = 0;

		if (bCryptPasswordEncoder.matches(inputMember.getMemberPw(), savePwd)) {

			// 1) 외훤 정보 부터 수정
			result = dao.updateInfo(inputMember);

			if (result > 0) {

				if (formFile.getOriginalFilename() != null) { // 업로드된 이미지가 있을때
					try {
						formFile.transferTo(new File(savePath + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						throw new SaveFileException();
					}
				}

				if (newPwd != null) {
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

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}

//	회원 탈퇴 Service
	@Override
	public int secession(Member loginMember, String currentPwd) {

		String savePwd = dao.selectMember(loginMember.getMemberNo());

		int result = 0;

		if (bCryptPasswordEncoder.matches(currentPwd, savePwd)) {

			result = dao.secession(loginMember);

		}

		return result;
	}

//	크리에이터 회원가입 Service
	@Override
	public int creatorSignUp(Member inputMember) {
		String encPwd = bCryptPasswordEncoder.encode(inputMember.getMemberPw());

		inputMember.setMemberPw(encPwd);

		return dao.creatorSignUp(inputMember);
	}

//	아이디 찾기 Service
	@Override
	public String findId(Member findMember) {

		return dao.findId(findMember);
	}

//	Email 발송
	@Override
	public void sendEmail(Member findMember, String div) {

		String setfrom = "alcasskh@gmail.com"; // 보내는 사람 이메일
		String tomail = findMember.getMemberEmail(); // 받는 사람 이메일
		String title = "버디버디"; // 메일 제목
		String key = findMember.getMemberPw();

		String content = findMember.getMemberEmail() + "님에게 임시 비밀번호가 발급 되었습니다. <br>"
				+ "발급된 임시번호로 로그인 후 반드시 변경하여 사용해 주세요. <br>" + "임시 비밀번호 : " + key;

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

//	비번 찾기 Service
	@Override
	public void findPw(HttpServletResponse response, Member findMember) throws Exception {
		response.setContentType("text/html;charset=utf-8");

		List<Object> ck = dao.findMember(findMember.getMemberEmail());

		System.out.println(ck);

		PrintWriter out = response.getWriter();

//		가입된 아이디가 없는 경우
		if (dao.idDupCheck(findMember.getMemberEmail()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();

//		가입된 아이디가 아닐 경우
		} else if (!findMember.getMemberEmail().equals(findMember.getMemberEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();

			System.out.println(findMember.getMemberEmail());

//		임시 비번 발송	
		} else {
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);

			}

			findMember.setMemberPw(bCryptPasswordEncoder.encode(pw));
			// 비밀번호 변경
			dao.updatePw(findMember);

			findMember.setMemberPw(pw);
			// 비밀번호 변경 메일 발송
			sendEmail(findMember, "findPw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

//	카카오 소셜 로그인 Service
	@Override
	public Member kakaoLogin(Member kakaoMember) {

		return dao.kakaoLogin(kakaoMember);
	}

//	클래스 전체 목록 조회 
	@Override
	public List<Payment> onlineList(Pagination pagination) {

		return dao.selectOnlineList(pagination);
	}

	// 이용내역 조회
	@Override
	public Pagination getPagination(Pagination pg) {

		Pagination selectPg = dao.getListCount(pg.getMemberNo());

		return selectPg;

	}

	// 전체 에약 내역 조회
	@Override
	public Pagination getPagination1(Pagination pg) {

		Pagination selectPg = dao.getListCount1(pg.getMemberNo());

		return selectPg;

	}

	// 전체 리뷰 내역 조회
	@Override
	public Pagination getPagination2(Pagination pg) {

		Pagination selectPg = dao.getListCount2(pg.getMemberNo());

		return selectPg;

	}
	
	// 전체 후기 내역 조회
		@Override
		public Pagination getPagination3(Pagination pg) {

			Pagination selectPg = dao.getListCount3(pg.getMemberNo());

			return selectPg;

		}

//	예약 내역 조회 Service
	@Override
	public List<Reserve> reserveList(Pagination pagination) {

		return dao.selectReserveList(pagination);
	}

//	작성한 리뷰 조회 Service
	@Override
	public List<Review> reviewList(Pagination pagination) {

		return dao.selectReviewList(pagination);
	}

//	작성한 후기 조회 Service
	@Override
	public List<Reply> replyList(Pagination pagination) {

		return dao.selectReplyList(pagination);
	}

}