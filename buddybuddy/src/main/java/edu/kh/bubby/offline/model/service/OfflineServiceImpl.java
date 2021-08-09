package edu.kh.bubby.offline.model.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	//상세페이지 조회
	@Override
	public OfflineClass selectOfflinView(int classNo) {
		// TODO Auto-generated method stub
		return dao.selectOfflinView(classNo);
	}
	//상세페이지 컨탠트 조회
	@Override
	public OfflineClass selectContent(int classNo) {
		// TODO Auto-generated method stub
		return dao.selectContent(classNo);
	}
	//오프라인 클래스 삽입
	@Override
	public int insertOfflineClass(OfflineClass offlineClass, List<MultipartFile> images, String webPath,
			String savePath) {
		// TODO Auto-generated method stub
		offlineClass.setClassTitle(replaceParameter(offlineClass.getClassTitle()));
		
		return 0;
	}
	


	// 크로스 사이트 스크립트 방지 처리 메소드
			public static String replaceParameter(String param) {
				String result = param;
				if(param != null) {
					result = result.replaceAll("&", "&amp;");
					result = result.replaceAll("<", "&lt;");
					result = result.replaceAll(">", "&gt;");
					result = result.replaceAll("\"", "&quot;");
				}
				
				return result;
			}
			// 파일명 변경 메소드
			private String rename(String originFileName) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
				
				int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
				
				String str = "_" + String.format("%05d", ranNum);
				
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				
				return date + str + ext;
			}
}
