package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.online.model.dao.NoticeDAO;
import edu.kh.bubby.online.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO dao;

	// 공지사항 목록 조회
	@Override
	public List<Notice> selectNoticeList(int classNo) {
		return dao.selectNoticeList(classNo);
	}
	
	// 공지사항 작성
	@Override
	public int insertNotice(Notice notice) {
		return dao.insertNotice(notice);
	}
	
	// 공지사항 수정
	@Override
	public int updateNotice(Notice notice) {
		return dao.updateNotice(notice);
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(Notice notice) {
		return dao.deleteNotice(notice);
	}
	
	
	
}
