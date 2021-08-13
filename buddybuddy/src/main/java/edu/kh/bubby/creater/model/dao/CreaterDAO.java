package edu.kh.bubby.creater.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

@Repository
public class CreaterDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 특정 클래스 전체 클래스 수 조회
	 * @param classType
	 * @return pagination
	 */
	public Pagination getListCount(Pagination pg) {
		return sqlSession.selectOne("createrMapper.getListCount", pg);
	}
	
	/** 내 클래스 목록 조회
	 * @param pagination
	 * @param memberNo
	 * @return classList
	 */
	public List<Online> selectClassList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("createrMapper.selectClassList", pagination, rowBounds);
	}

	/** 내 공지사항 목록 조회
	 * @param memberNo
	 * @return
	 */
	public List<Notice> selectMyNotice(int memberNo) {
		return sqlSession.selectList("createrMapper.selectMyNotice", memberNo);
	}




}
