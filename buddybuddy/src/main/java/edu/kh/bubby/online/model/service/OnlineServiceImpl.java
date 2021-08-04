package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.online.model.dao.OnlineDAO;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

@Service
public class OnlineServiceImpl implements OnlineService{
	
	@Autowired
	private OnlineDAO dao;
	
	
	// 전체 클래스 수 + 클래스 이름 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		Pagination selectPg = dao.getListCount(pg.getClassType()); 
//		System.out.println(selectPg);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), 
				pg.getClassType(), selectPg.getClassName());
	}
	
	// 전체 클래스 수 + 클래스 이름 조회(검색)
	@Override
	public Pagination getPagination(Search search, Pagination pg) {
		Pagination selectPg = dao.getSearchListCount(search);
//		System.out.println("selectPg : "+selectPg);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), 
				pg.getClassType(), selectPg.getClassName());
	}
	
	// 클래스 목록 조회
	@Override
	public List<Online> selectOnlineList(Pagination pagination) {
		return dao.selectOnlineList(pagination);
	}

	// 클래스 목록 조회(검색)
	@Override
	public List<Online> selectOnlineList(Search search, Pagination pagination) {
		return dao.selectSearchList(search, pagination);
	}

}
