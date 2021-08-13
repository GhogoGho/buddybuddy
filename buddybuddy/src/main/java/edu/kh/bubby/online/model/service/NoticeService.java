package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.Notice;

public interface NoticeService {

	/** 공지사항 목록 조회
	 * @param classNo
	 * @return nList
	 */
	List<Notice> selectNoticeList(int classNo);
	
	/** 내 공지사항 목록 조회
	 * @param notice
	 * @return
	 */
	List<Notice> selectMyNotice(Notice notice);

	/** 공지사항 작성
	 * @param notice
	 * @return result
	 */
	int insertNotice(Notice notice);


	/** 공지사항 삭제
	 * @param notice
	 * @return result
	 */
	int deleteNotice(Notice notice);


	/** 공지사항 수정(Ajax)
	 * @param noticeNo
	 * @return
	 */
	int updateNotice(Notice notice);

	/** 공지사항 삭제(Ajax)
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(int noticeNo);

}
