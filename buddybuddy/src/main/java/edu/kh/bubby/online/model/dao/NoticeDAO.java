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

	/** 공지사항 작성
	 * @param notice
	 * @return result
	 */
	public int insertNotice(Notice notice) {
		return sqlSession.insert("onNoticeMapper.insertNotice", notice);
	}

	/** 공지사항 수정
	 * @param notice
	 * @return result
	 */
	public int updateNotice(Notice notice) {
		return sqlSession.update("onNoticeMapper.updateNotice", notice);
	}

	/** 공지사항 삭제
	 * @param notice
	 * @return result
	 */
	public int deleteNotice(Notice notice) {
		return sqlSession.update("onNoticeMapper.deleteNotice", notice);
	}
}
