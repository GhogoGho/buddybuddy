package edu.kh.bubby.online.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.service.PaymentService;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Payment;


@RestController
@RequestMapping("/summer/*")
@SessionAttributes({"loginMember"})
public class SummerController {

	@Autowired
	private PaymentService service;
	
	//썸머노트 이미지 삽입
	@RequestMapping(value="summer", method = RequestMethod.POST)
	public String summerAjaxInsert(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request) {
		System.out.println(multipartFile);
	
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = "resources/images/onlineClassSum/";
		String fileRoot =request.getSession().getServletContext().getRealPath(contextRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/buddybuddy/resources/images/onlineClassSum/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		System.out.println(jsonObject.get("url"));
		String a = jsonObject.toString();
		
		return a;

	}
	
	// 온라인 결제
	@RequestMapping(value="payment",method=RequestMethod.POST )
	public int payment(Online online) {
		int result = service.payment(online);
		System.out.println("결제 후: "+online);
		return result;
	}
	
	// 온라인 클래스 결제한 Member 목록
//	@RequestMapping(value="selectPaymentList", method=RequestMethod.POST)
//	public String selectPaymentList(Online online) {
//		List<Payment> payList = service.selectPaymentList(online);
//		Gson gson = new Gson();
//		System.out.println("payList:"+payList);
//		return gson.toJson(payList);
//	}
	
}
