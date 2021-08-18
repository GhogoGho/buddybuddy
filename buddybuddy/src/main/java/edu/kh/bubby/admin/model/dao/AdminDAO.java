package edu.kh.bubby.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.admin.model.vo.Question;
import edu.kh.bubby.admin.model.vo.Report;
import edu.kh.bubby.board.model.vo.NOTIBoard;
import edu.kh.bubby.member.model.vo.Member;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> selectMemberList(Member inputMember) {
		return sqlSession.selectList("adminMapper.selectMemberList", inputMember);
	}

	public List<Member> memberSecession(Member inputMember) {
		return sqlSession.selectList("adminMapper.memberSecession", inputMember);
	}

	public List<Member> memberCreator(Member inputMember) {
		return sqlSession.selectList("adminMapper.memberCreator", inputMember);
	}
	
	public int memberStatusUpdate(int memberNo) {
		return sqlSession.update("adminMapper.memberStatusUpdate", memberNo);
	}

	public int memberStatusUpdate2(int memberNo) {
		return sqlSession.update("adminMapper.memberStatusUpdate2", memberNo);
	}

	public int memberGradeUpdate(int memberNo) {
		return sqlSession.update("adminMapper.memberGradeUpdate", memberNo);
	}

	public List<NOTIBoard> notiBoard(NOTIBoard board) {
		return sqlSession.selectList("adminMapper.notiBoard", board);
	}

	public int notiStatusUpdate(int notiNo) {
		return sqlSession.update("adminMapper.notiStatusUpdate", notiNo);
	}

	public int notiStatusUpdate2(int notiNo) {
		return sqlSession.update("adminMapper.notiStatusUpdate2", notiNo);
	}

	public List<NOTIBoard> faqBoard(NOTIBoard board) {
		return sqlSession.selectList("adminMapper.faqBoard", board);
	}

	public int faqStatusUpdate(int notiNo) {
		return sqlSession.update("adminMapper.faqStatusUpdate", notiNo);
	}

	public int faqStatusUpdate2(int notiNo) {
		return sqlSession.update("adminMapper.faqStatusUpdate2", notiNo);
	}

	public int qnaSubmit(Question inputQuestion) {
		return sqlSession.insert("adminMapper.qnaSubmit", inputQuestion);
	}

	public List<Question> qnaList(Question inputQuestion) {
		return sqlSession.selectList("adminMapper.qnaList", inputQuestion);
	}
	
	public List<Question> qnaListCheck(Question inputQuestion) {
		return sqlSession.selectList("adminMapper.qnaListCheck", inputQuestion);
	}

	public int qnaAnswerUpdate(Question inputQuestion) {
		return sqlSession.update("adminMapper.qnaAnswerUpdate", inputQuestion);
	}

	public List<Report> boardReport(Report report) {
		return sqlSession.selectList("adminMapper.boardReport", report);
	}

	public int classStatusUpdate(int classNo) {
		return sqlSession.update("adminMapper.classStatusUpdate", classNo);
	}

	public int classStatusUpdate2(int classNo) {
		return sqlSession.update("adminMapper.classStatusUpdate2", classNo);
	}


}
