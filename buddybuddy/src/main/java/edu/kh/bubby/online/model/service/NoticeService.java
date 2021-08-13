package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.Notice;

public interface NoticeService {

	/** 공지사항 목록 조회
	 * @param classNo
	 * @return nList
	 */
	List<Notice> selectNoticeList(int classNo);

	/** 공지사항 작성
	 * @param notice
	 * @return result
	 */
	int insertNotice(Notice notice);

	/** 공지사항 수정
	 * @param notice
	 * @return result
	 */
	int updateNotice(Notice notice);

	/** 공지사항 삭제
	 * @param notice
	 * @return result
	 */
	int deleteNotice(Notice notice);

}
