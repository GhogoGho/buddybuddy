package edu.kh.bubby.online.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.Notice;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 공지사항 목록 조회
	 * @param classNo
	 * @return
	 */
	public List<Notice> selectNoticeList(int classNo) {
		return sqlSession.selectList("onNoticeMapper.selectNoticeList", classNo);
	}
}
