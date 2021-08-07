package edu.kh.bubby.online.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
