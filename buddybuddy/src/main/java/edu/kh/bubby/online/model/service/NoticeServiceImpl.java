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
	
	
	
}
