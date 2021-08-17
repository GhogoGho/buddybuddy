package edu.kh.bubby.admin.model.service;

import java.util.List;

import edu.kh.bubby.admin.model.vo.Question;
import edu.kh.bubby.board.model.vo.NOTIBoard;
import edu.kh.bubby.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMemberList(Member inputMember);

	List<Member> memberSecession(Member inputMember);

	List<Member> memberCreator(Member inputMember);
	
	int memberStatusUpdate(int memberNo);

	int memberStatusUpdate2(int memberNo);

	int memberGradeUpdate(int memberNo);

	List<NOTIBoard> notiBoard(NOTIBoard board);

	int notiStatusUpdate(int notiNo);

	int notiStatusUpdate2(int notiNo);

	List<NOTIBoard> faqBoard(NOTIBoard board);

	int faqStatusUpdate(int notiNo);

	int faqStatusUpdate2(int notiNo);

	int qnaSubmit(Question inputQuestion);

	List<Question> qnaList(Question inputQuestion);

	int qnaAnswerUpdate(Question inputQuestion);

}
