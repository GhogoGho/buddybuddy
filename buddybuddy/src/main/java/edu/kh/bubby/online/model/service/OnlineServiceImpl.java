package edu.kh.bubby.online.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.member.exception.SaveFileException;
import edu.kh.bubby.online.exception.InsertAttachmentException;
import edu.kh.bubby.online.model.dao.OnlineDAO;
import edu.kh.bubby.online.model.vo.Attachment;
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
	
	// Indi 클래스 수 + 클래스 이름 조회
	@Override
	public Pagination getIndiPagination(Pagination pg) {
		Pagination selectPg = dao.getIndiListCount(pg.getClassType()); 
//		System.out.println(selectPg);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), 
				pg.getClassType(), selectPg.getClassName());
	}
	
	// Indi 클래스 수 + 클래스 이름 조회(검색)
	@Override
	public Pagination getIndiPagination(Search search, Pagination pg) {
		Pagination selectPg = dao.getIndiSearchListCount(search);
//		System.out.println("selectPg : "+selectPg);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), 
				pg.getClassType(), selectPg.getClassName());
	}
	
	// Individual 목록 조회
	@Override
	public List<Online> selectIndividualList(Pagination pagination) {
		return dao.selectIndividualList(pagination);
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

	
	// 클래스 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertOnlineClass(Online online, List<MultipartFile> images, String webPath, String savePath) {
		
		online.setClassTitle( replaceParameter( online.getClassTitle() ) );
		online.setClassContent( replaceParameter( online.getClassContent() ) );
		
		online.setClassContent( online.getClassContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		int classNo = dao.insertOnlineClass(online);
		
		if(classNo > 0) {
			
			List<Attachment> atList = new ArrayList<Attachment>();
			
			for(int i=0; i<images.size(); i++) {
				
				if( !images.get(i).getOriginalFilename().equals("") ) {
					
					String fileName = rename(images.get(i).getOriginalFilename() );
					
					Attachment at = new Attachment();
					at.setFileName(fileName); 
					at.setFilePath(webPath); 
					at.setClassNo(classNo); 
					at.setFileLevel(i); 
					
					atList.add(at);
				}
			}
			
			if(!atList.isEmpty()) {
				
				int result = dao.insertAttachmentList(atList);
				
				if(atList.size() == result) {
					
					for(int i=0; i<atList.size(); i++) {
						try {
							images.get( atList.get(i).getFileLevel() )
							.transferTo(new File(savePath + "/" + atList.get(i).getFileName() ));
							
							
						}catch(Exception e) {
							e.printStackTrace();
							throw new SaveFileException();
						}
					}
				}else {
					throw new SaveFileException();
				}
			}
		}
		return classNo;
	}
	
	// 클래스 수정 상세 조회
	@Override
	public Online selectUpdateOnline(int classNo) {
		Online online = dao.selectOnline(classNo);
		online.setClassContent(online.getClassContent().replaceAll("<br>", "\r\n"));
		return online;
	}
	
	// 클래스 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateOnline(Online online, List<MultipartFile> videos, String webPath, String savePath,
			String deleteVideos) {
		online.setClassTitle( replaceParameter( online.getClassTitle() ) );
		online.setClassContent( replaceParameter( online.getClassContent() ) );
		online.setClassContent( online.getClassContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		// 2) 글 부분만 수정
		int result = dao.updateOnline(online);
		
		// 3) 이미지 관련 코드 작성
		if(result > 0 ) {
			// 3-1) deleteImages와 일치하는 파일레벨의 ATTACHMENT 행 삭제
			// deleteImage : 삭제해야할 이미지 파일 레벨을 ","를 구분자로 하여 만들어진 String
			
			if( !deleteVideos.equals("") ) { // 삭제할 파일 레벨이 존재하는 경우
				// DB 삭제 구문에 필요한 값 : deleteImages, boardNo 
				// 두 데이터를 한번에 담을 VO가 없음 -> Map 사용
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("classNo", online.getClassNo() );
				map.put("deleteImages", deleteVideos);
				
				// 반환 값이 아무런 의미를 갖지 못하므로 반환 받을 필요가 없다.
				dao.deleteAttachment(map);
			}
			
			
			List<Attachment> atList = new ArrayList<Attachment>();
			
			for(int i=0; i<videos.size(); i++) {
				
				if( !videos.get(i).getOriginalFilename().equals("") ) {
					
					String fileName = rename(videos.get(i).getOriginalFilename() );
					
					Attachment at = new Attachment();
					at.setFileName(fileName);
					at.setFilePath(webPath);
					at.setClassNo(online.getClassNo());
					at.setFileLevel(i);
					
					atList.add(at);
				}
			}
			
			for(Attachment at : atList) {
				result = dao.updateAttachment(at);
				
				if(result == 0) {
					result = dao.insertAttachment(at);
					
					if(result == 0) { // 삽입 실패
						// 강제로 예외를 발생시켜 전체 롤백 수행
						throw new InsertAttachmentException();
					}
				}
			}
			
			// 4) 새로 업로드된 이미지 서버에 저장
			for(int i=0; i<atList.size(); i++) {
				try {
					videos.get( atList.get(i).getFileLevel() )
					.transferTo(new File(savePath + "/" + atList.get(i).getFileName() ));
				}catch(Exception e) {
					e.printStackTrace();
					throw new SaveFileException();
				}
			}
		}
		return result;
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
	

	// 파일명 변경 메소드
	private String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
	
	// 클래스 삽입 (썸머 테스트)
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertOnline(Online online, List<MultipartFile> videos, String webPath, String savePath) {
		
		online.setClassTitle(replaceParameter(online.getClassTitle()));
		online.setClassContent(replaceParameter(online.getClassContent()));
		
		online.setClassContent(online.getClassContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		int classNo = dao.insertOnline(online);
		
		if(classNo > 0) {
			List<Attachment> atList = new ArrayList<Attachment>();
			for(int i=0; i<videos.size(); i++) {
				
				if( !videos.get(i).getOriginalFilename().equals("") ) {
					
					String fileName = rename(videos.get(i).getOriginalFilename() );
					
					Attachment at = new Attachment();
					at.setFileName(fileName);
					at.setFilePath(webPath);
					at.setClassNo(classNo);
					at.setFileLevel(i);
					
					atList.add(at);
				}
			}
			if(!atList.isEmpty()) {
				
				int result = dao.insertAttachmentList(atList);
				
				if(atList.size() == result) {
					
					for(int i=0; i<atList.size(); i++) {
						try {
							videos.get( atList.get(i).getFileLevel() )
							.transferTo(new File(savePath + "/" + atList.get(i).getFileName() ));
							
						}catch(Exception e) {
							e.printStackTrace();
							throw new SaveFileException();
						}
					}
				}else {
					throw new SaveFileException();
				}
			}
		}
		return classNo;
	}

	// 클래스 수정 (썸머 테스트)
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int summerUpdateOnline(Online online) {
		
		online.setClassTitle(replaceParameter(online.getClassTitle()));
		online.setClassContent(replaceParameter(online.getClassContent()));
		online.setClassContent(online.getClassContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		int result = dao.summerUpdateOnline(online);
		
		return result;
	}
	
	// 클래스 삭제 (썸머 테스트)
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int summerDeleteOnline(int classNo) {
		return dao.summerDeleteOnline(classNo);
	}
	
	
	
	

}
