package edu.kh.bubby.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.board.model.vo.NOTIAttachment;
import edu.kh.bubby.board.model.vo.NOTIBoard;
import edu.kh.bubby.board.model.vo.Category;
import edu.kh.bubby.board.model.vo.Pagination;
import edu.kh.bubby.board.model.vo.Search;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 특정 게시판 전체 게시글 수 조회
	 * @param boardType
	 * @return pagination
	 */
	public Pagination getListCount(int boardType) {
		return sqlSession.selectOne("boardMapper.getListCount", boardType);
	}

	/** 특정 게시판 검색 게시글 수 조회(검색 시)
	 * @param search
	 * @return pagination
	 */
	public Pagination getSearchListCount(Search search) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", search);
	}
	
	/** 게시글 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	public List<NOTIBoard> selectBoradList(Pagination pagination) {
		
		/* 마이바티스의 RowBounds 객체
		 * -> 조회 결과 ResultSet에서 어디서부터 어디까지만 딱 잘라서 얻어올 수 있게 하는 객체
		 * 
		 * offset: 조회결과를 몇 행을 건너 뛸 것인지 지정
		 * 
		 * */
		
		int offser = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		// ex> (1 - 1) * 10 = 0 즉, 건너뛰지 않겠다
		
		RowBounds rowBounds = new RowBounds(offser, pagination.getLimit());
		// offset 만큼 건너 뛰고, lmit만큼의 행을 얻어옴
		
		return sqlSession.selectList("boardMapper.selectBoardList", pagination.getBoardType(), rowBounds);
	}

	/** 게시글 목록 조회(검색 시)
	 * @param search
	 * @param pagination
	 * @return boardList
	 */
	public List<NOTIBoard> selectSearchList(Search search, Pagination pagination) {
		// RowBounds: 지정된 offset 만큼 건너 뛴 후 몇 행을 조회할 지 지정하는 객체
		
		int offser = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offser, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectSearchList", search, rowBounds);
	} 
	
	/** 게시글 상세 조회
	 * @param boardNo
	 * @return board
	 */
	public NOTIBoard selelectBoard(int notiNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", notiNo);
	}

	/** 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	public int increaseReadCount(int notiNo) {
		return sqlSession.update("boardMapper.increaseReadCount", notiNo);
	}

//	public List<Category> selectCategory() {
//		return sqlSession.selectList("boardMapper.selectCategory");
//	}

	/** 게시글 삽입
	 * @param board
	 * @return boardNo
	 */
	public int insertBoard(NOTIBoard board) {
		
		int result = sqlSession.insert("boardMapper.insertBoard", board);
		// insert 성공 시 1, 실패 시 0
		
		// mapper에서 <selectKey> 수행 결과인 게시글 번호를 얕은 복사로 전달한 board에 추가함.
		
		if(result > 0) {
			return board.getNotiNo();
		}else {
			return 0;
		}
		
	}

	/** 파일 정보 삽입(List)
	 * @param atList
	 * @return result
	 */
	public int insertAttachmentList(List<NOTIAttachment> atList) {
		return sqlSession.insert("boardMapper.insertAttachmentList", atList);
	}

	/** 게시글 수정
	 * @param board
	 * @return result
	 */
	public int updateBoard(NOTIBoard board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	/** 첨부파일 정보 삭제
	 * @param map
	 */
	public void deleteAttachment(Map<String, Object> map) {
		sqlSession.delete("boardMapper.deleteAttachment", map);
	}

	/** 첨부파일 정보 수정(한 행)
	 * @param at
	 * @return result
	 */
	public int updateAttachment(NOTIAttachment at) {
		return sqlSession.update("boardMapper.updateAttachment", at);
	}

	/** 첨부파일 정보 삽입(한 행)
	 * @param at
	 * @return result
	 */
	public int insertAttachment(NOTIAttachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}

	/** 72시간 전 보다 과거에 추가된 파일명 조회
	 * @param standard
	 * @return dbList
	 */
	public List<String> selectDbList(String standard) {
		return sqlSession.selectList("boardMapper.selectDbList", standard);
	}

	public int deleteBoard(int notiNo) {
		return sqlSession.update("boardMapper.deleteBoard", notiNo);
	}


}
