package edu.kh.bubby.creater.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.creater.model.dao.CreaterDAO;
import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

@Service
public class CreaterServiceImpl implements CreaterService{

	@Autowired
	private CreaterDAO dao;
	
	// 전체 클래스 수 + 클래스 이름 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		Pagination selectPg = dao.getListCount(pg);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(),
				pg.getClassType(), selectPg.getClassName());
	}
	
	// 내 클래스 목록 조회
	@Override
	public List<Online> getClassList(Pagination pagination) {
		return dao.selectClassList(pagination);
	}
	
	// 내 공지사항 목록 조회
	@Override
	public List<Notice> selectMyNotice(int memberNo) {
		return dao.selectMyNotice(memberNo);
	}
	

	
}
