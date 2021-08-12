package edu.kh.bubby.offline.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.offline.exception.SaveFileException;
import edu.kh.bubby.offline.exception.reserveException;
import edu.kh.bubby.offline.model.dao.OfflineDAO;
import edu.kh.bubby.offline.model.vo.OffAttachment;
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertOfflineClass(OfflineClass offlineClass, List<MultipartFile> images, String webPath,
			String savePath,List reserveAll) {
		// TODO Auto-generated method stub
		offlineClass.setClassTitle(replaceParameter(offlineClass.getClassTitle()));
		int classNo = dao.insertOfflineClass(offlineClass);
		int result =0;
		int reserveCount=0;
		if(classNo > 0) {
			if(reserveAll !=null) {
				for(int i =0;i<reserveAll.size();i++) {
					OfflineClass reof = new OfflineClass();
					String[] re = reserveAll.get(i).toString().split(" ");
					System.out.println("re::::"+re[0]);					
					reof.setReserveDate(re[0].toString());
					reof.setReserveStart(re[1].toString());
					reof.setReserveEnd(re[2].toString());
					reof.setReserveLimit(offlineClass.getReserveLimit());
					reof.setClassLevel(offlineClass.getClassLevel());
					reof.setClassArea(offlineClass.getClassArea());
					reof.setMemberNo(offlineClass.getMemberNo());
					reof.setClassNo(classNo);
					System.out.println("reof::::"+reof);
					result = dao.insertReserveAll(reof);
					reserveCount++;
				}
				if(reserveCount != reserveAll.size()) {
					throw new reserveException();
				}
				else {
					List<OffAttachment> atList = new ArrayList<OffAttachment>();
					for(int i =0;i<images.size();i++) {
						if(!images.get(i).getOriginalFilename().equals("")) {//파일이 업로드 된 경우
							//images의 i번째 요소의 파일명이 ""이 아닐경우
							//->업로드된 파일이 없을 경우 파일명이 ""로 존재함
							
							//파일명 변경 작업 수행
							String fileName = rename(images.get(i).getOriginalFilename());
							
							//Attachment 객체 생성
							OffAttachment at = new OffAttachment();
							at.setFileName(fileName);//변경한 파일명
							at.setFilePath(webPath);// 웹 접근 경로
							at.setClassNo(classNo); //게시글 번호
							at.setFileLevel(i);//for문 반복자 ==파일레벨
							atList.add(at);
						}
					}
					//업로드된 이미지가 있을 경우에만 DAO 호출
					if(!atList.isEmpty()) {
						result = dao.insertAttachmentList(atList);
						//result == 성공한 행의 갯수
						if(result==atList.size()) {// 모두 삽입 성공한 경우
							//4) 파일을 서버에 저장(transfer() )
							for(int i =0; i<atList.size();i++) {
								//try-catch 또는 throws가 강제 되는 경우
								//== Checked Exception(예외처리를 반드시해라)
								try {
									images.get(atList.get(i).getFileLevel())
									.transferTo(new File(savePath+"/"+atList.get(i).getFileName()));
									//images에서 업로드된 파일이 있는 요소를 얻어와
									// 지정된 경로에 파일로 저장
								}catch(Exception e) {
									e.printStackTrace();
									throw new SaveFileException();
								}
								
							}
						}else{ 
							throw new SaveFileException();
						}
					}
				}
			}
			
		}else {
			throw new reserveException();
		}
		
		return classNo;
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
			
			//클래스 삭제
			@Transactional(rollbackFor = Exception.class)
			@Override
			public int deleteClass(int classNo) {
				// TODO Auto-generated method stub
				dao.deleteClass(classNo);
				dao.deleteReserve(classNo);
				dao.deleteConfirmReserve(classNo);
				return 0;
			}
}
