package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.bubby.online.model.dao.OnlineDAO;
import edu.kh.bubby.online.model.vo.Category;
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
	
	// 클래스 상세 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Online selectOnline(int classNo) {
		
		Online online = dao.selectOnline(classNo);
		
		
		if(online != null) {
			// 인기순 정렬을 위한 조회수 증가
			dao.increaseReadCount(classNo);
			online.setClassReadCount( online.getClassReadCount()+1 );
		}
		
		
		
		return online;
	}
	
	// 카테고리 조회
	@Override
	public List<Category> selectCategory() {
		return dao.selectCategory();
	}

	// 클래스 수정 상세 조회
	@Override
	public Online selectUpdateOnline(int classNo) {
		Online online = dao.selectOnline(classNo);
		online.setClassContent(online.getClassContent().replaceAll("<br>", "\r\n"));
		return online;
	}

	
	
	
	
	
	
	
	
	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) { // 다른 class에서도 사용할 수 있도록 public static으로 변경
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}

}
