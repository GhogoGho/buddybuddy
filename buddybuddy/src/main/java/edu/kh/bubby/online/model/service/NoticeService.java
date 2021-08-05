package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.Notice;

public interface NoticeService {

	/** 공지사항 목록 호죄
	 * @param classNo
	 * @return nList
	 */
	List<Notice> selectNoticeList(int classNo);

}
