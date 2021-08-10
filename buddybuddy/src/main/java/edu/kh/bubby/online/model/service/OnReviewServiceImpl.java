package edu.kh.bubby.online.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.member.exception.SaveFileException;
import edu.kh.bubby.online.model.dao.OnReviewDAO;
import edu.kh.bubby.online.model.vo.Attachment;
import edu.kh.bubby.online.model.vo.OnReview;
import edu.kh.bubby.online.model.vo.ReviewAttachment;

@Service
public class OnReviewServiceImpl implements OnReviewService{
	@Autowired
	private OnReviewDAO dao;

	// 수강 후기 목록 조회
	@Override
	public List<OnReview> selectList(int classNo) {
		return dao.selectList(classNo);
	}
	
	// 수강후기 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(OnReview review, List<MultipartFile> reviewImgs, String webPath, String savePath) {
//	public int insertReview(OnReview review) {
		review.setReviewContent(OnlineServiceImpl.replaceParameter(review.getReviewContent()));
		review.setReviewContent(review.getReviewContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		int reviewNo = dao.insertReview(review);
		System.out.println("reviewNo나오나 :"+review);
		if(reviewNo>0) {
			List<ReviewAttachment> atList = new ArrayList<ReviewAttachment>();
			for(int i=0; i<reviewImgs.size(); i++) {
				
				if( !reviewImgs.get(i).getOriginalFilename().equals("") ) {
					
					String fileName = rename(reviewImgs.get(i).getOriginalFilename() );
					
					ReviewAttachment at = new ReviewAttachment();
					at.setFileName(fileName);
					at.setFilePath(webPath);
					at.setReviewNo(reviewNo);
					at.setFileLevel(i);
					
					atList.add(at);
					System.out.println("at: "+at);
				}
			}
			System.out.println("atList: "+atList);
			if(!atList.isEmpty()) { // atList가 비어있지 않을 때(업로드된 이미지가 있을 때)
				
				int result = dao.insertAttachmentList(atList);
				
				if(atList.size() == result) {
					
					// 4) 파일을 서버에 저장(transfer() )
					for(int i=0; i<atList.size(); i++) {
						try {
							reviewImgs.get( atList.get(i).getFileLevel() )
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
		return reviewNo;
//		return dao.insertReview(review);
	}
	
	// 수강후기 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReview(OnReview review) {
		review.setReviewContent(OnlineServiceImpl.replaceParameter(review.getReviewContent()));
		review.setReviewContent(review.getReviewContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.updateReview(review);
	}

	// 수강후기 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
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
