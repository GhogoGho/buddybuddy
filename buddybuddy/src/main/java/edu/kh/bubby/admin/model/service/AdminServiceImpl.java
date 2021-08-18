package edu.kh.bubby.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.bubby.admin.model.dao.AdminDAO;
import edu.kh.bubby.admin.model.vo.Question;
import edu.kh.bubby.board.model.vo.NOTIBoard;
import edu.kh.bubby.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO dao;

	@Override
	public List<Member> selectMemberList(Member inputMember) {
		return dao.selectMemberList(inputMember);
	}

	@Override
	public List<Member> memberSecession(Member inputMember) {
		return dao.memberSecession(inputMember);
	}

	@Override
	public List<Member> memberCreator(Member inputMember) {
		return dao.memberCreator(inputMember);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberStatusUpdate(int memberNo) {
		return dao.memberStatusUpdate(memberNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberStatusUpdate2(int memberNo) {
		return dao.memberStatusUpdate2(memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberGradeUpdate(int memberNo) {
		return dao.memberGradeUpdate(memberNo);
	}

	@Override
	public List<NOTIBoard> notiBoard(NOTIBoard board) {
		return dao.notiBoard(board);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int notiStatusUpdate(int notiNo) {
		return dao.notiStatusUpdate(notiNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int notiStatusUpdate2(int notiNo) {
		return dao.notiStatusUpdate2(notiNo);
	}

	@Override
	public List<NOTIBoard> faqBoard(NOTIBoard board) {
		return dao.faqBoard(board);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int faqStatusUpdate(int notiNo) {
		return dao.faqStatusUpdate(notiNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int faqStatusUpdate2(int notiNo) {
		return dao.faqStatusUpdate2(notiNo);
	}

	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int qnaSubmit(Question inputQuestion) {
		
		inputQuestion.setQueTitle( replaceParameter( inputQuestion.getQueTitle() ) );
		inputQuestion.setQueContent( replaceParameter( inputQuestion.getQueContent() ) );
		inputQuestion.setQueContent(  inputQuestion.getQueContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		return dao.qnaSubmit(inputQuestion);
	}
	
	@Override
	public List<Question> qnaList(Question inputQuestion) {
		
		return dao.qnaList(inputQuestion);
	}
	
	@Override
	public List<Question> qnaListCheck(Question inputQuestion) {
		
		return dao.qnaListCheck(inputQuestion);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int qnaAnswerUpdate(Question inputQuestion) {
		
		inputQuestion.setAnswerContent( replaceParameter( inputQuestion.getAnswerContent() ) );
		inputQuestion.setAnswerContent(  inputQuestion.getAnswerContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		return dao.qnaAnswerUpdate(inputQuestion);
	}

	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}
	
}
