package edu.kh.bubby.offline.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.offline.model.dao.OfflineDAO;
import edu.kh.bubby.online.model.vo.Pagination;

@Service
public class OfflineServiceImpl implements OfflineService{

	@Autowired
	private OfflineDAO dao;
	//전체 게시글 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		// TODO Auto-generated method stub
		Pagination selectPg = dao.getPagination(pg.getClassType());
		return null;
	}
}
