package edu.kh.bubby.offline.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.offline.model.dao.OfflineDAO;
import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OffSearch;
import edu.kh.bubby.offline.model.vo.OfflineClass;

@Service
public class OfflineServiceImpl implements OfflineService{

	@Autowired
	private OfflineDAO dao;
	//전체 게시글 수 조회
	@Override
	public OffPagination getPagination(OffPagination pg) {
		// TODO Auto-generated method stub
		OffPagination selectPg = dao.getPagination(pg.getClassType());
		return  new OffPagination(pg.getCurrentPage(), selectPg.getListCount(), 
				pg.getClassType(), null);
	}
	//전체 게시글 수 조회(검색)
	@Override
	public OffPagination getPagination(OffSearch search, OffPagination pg) {
		// TODO Auto-generated method stub
		OffPagination selectPg = dao.getPagination(search);
		return new OffPagination(pg.getCurrentPage(), selectPg.getListCount(), 
				pg.getClassType(), null);
	}
	//전체 게시글 목록 조회
	@Override
	public List<OfflineClass> selectOfflinList(OffPagination pagination) {
		// TODO Auto-generated method stub
		return dao.selectOfflinList(pagination);
	}
	//검색 게시글 목록 조회
	@Override
	public List<OfflineClass> selectOfflinList(OffSearch search, OffPagination pagination) {
		// TODO Auto-generated method stub
		return dao.selectOfflinList(search,pagination);
	}


	
}
