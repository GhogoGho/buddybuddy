package edu.kh.bubby.online.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.Attachment;
import edu.kh.bubby.online.model.vo.Category;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

@Repository
public class OnlineDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 특정 클래스 전체 클래스 수 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getListCount(int classType) {
		return sqlSession.selectOne("onlineMapper.getListCount", classType);
	}

	/** 특정 클래스 검색 클래스 수 조회
	 * @param search
	 * @return pagination
	 */
	public Pagination getSearchListCount(Search search) {
		return sqlSession.selectOne("onlineMapper.getSearchListCount", search);
	}
	
	/** 특정 클래스 Indi 클래스 수 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getIndiListCount(int classType) {
		return sqlSession.selectOne("onlineMapper.getIndiListCount", classType);
	}
	
	/** 특정 클래스 Indi 검색 클래스 수 조회
	 * @param search
	 * @return pagination
	 */
	public Pagination getIndiSearchListCount(Search search) {
		return sqlSession.selectOne("onlineMapper.getIndiSearchListCount", search);
	}
	
	/** Individual 목록 조회
	 * @param pagination
	 * @return individualList
	 */
	public List<Online> selectIndividualList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("onlineMapper.selectIndividualList", pagination.getClassType(), rowBounds);
	}
	
	/** Individual 목록 조회(검색)
	 * @param search
	 * @param pagination
	 * @return onlineList
	 */
	public List<Online> selectIndividualList(Search search, Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("onlineMapper.selectIndividualSearchList", search, rowBounds);
	}

	/** 클래스 목록 조회
	 * @param pagination
	 * @return onlineList
	 */
	public List<Online> selectOnlineList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("onlineMapper.selectOnlineList", pagination.getClassType(), rowBounds);
	}

	/** 클래스 목록 조회(검색)
	 * @param search
	 * @param pagination
	 * @return onlineList
	 */
	public List<Online> selectSearchList(Search search, Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("onlineMapper.selectSearchList", search, rowBounds);
	}

	/** 클래스 상세 조회
	 * @param classNo
	 * @return online
	 */
	public Online selectOnline(int classNo) {
		return sqlSession.selectOne("onlineMapper.selectOnline", classNo);
	}

	/** 조회수 증가(인기순 정렬용)
	 * @param classNo
	 * @return result
	 */
	public int increaseReadCount(int classNo) {
		return sqlSession.update("onlineMapper.increaseReadCount", classNo);
	}

	/** 카테고리 조회
	 * @return
	 */
	public List<Category> selectCategory() {
		return sqlSession.selectList("onlineMapper.selectCategory");
	}
	
	/** 클래스 삽입
	 * @param online
	 * @return result
	 */
	public int insertOnlineClass(Online online) {
		int result = sqlSession.insert("onlineMapper.insertOnlineClass", online);

		if (result > 0) {
			return online.getClassNo();
		} else {
			return 0;
		}
	}
	
	
	/** 클래스 수정
	 * @param online
	 * @return result
	 */
	public int updateOnline(Online online) {
		return sqlSession.update("onlineMapper.updateOnline", online);
	}
	
	/** 첨부 파일 정보 삭제
	 * @param map
	 */
	public void deleteAttachment(Map<String, Object> map) {
		sqlSession.delete("onlineMapper.deleteAttachment", map);
	}
	
	/** 첨부 파일 정보 수정(한 행)
	 * @param at
	 * @return result
	 */
	public int updateAttachment(Attachment at) {
		return sqlSession.update("onlineMapper.updateAttachment", at);
	}
	
	/** 첨부 파일 정보 삽입(한 행)
	 * @param at
	 * @return result
	 */
	public int insertAttachment(Attachment at) {
		return sqlSession.insert("onlineMapper.insertAttachment", at);
	}
	
	/**
	 * 파일 정보 삽입(List)
	 * 
	 * @param atList
	 * @return result
	 */
	public int insertAttachmentList(List<Attachment> atList) {
		return sqlSession.insert("onlineMapper.insertAttachmentList", atList);
	}
	
	//==============================================================================
	
	/** 클래스 삽입 (썸머 테스트)
	 * @param online
	 * @return result
	 */
	public int insertOnline(Online online) {
		int result = sqlSession.insert("onlineMapper.insertOnline", online);
		
		if(result > 0) {
			return online.getClassNo();
		}else {
			return 0;
		}
		
	}

	/** 클래스 수정 (썸머 테스트)
	 * @param online
	 * @return result
	 */
	public int summerUpdateOnline(Online online) {
		return sqlSession.update("onlineMapper.summerUpdateOnline", online);
	}

	/** 클래스 삭제 (썸머 테스트)
	 * @param classNo
	 * @return result
	 */
	public int summerDeleteOnline(int classNo) {
		return sqlSession.update("onlineMapper.summerDeleteOnline", classNo);
	}




	

}
