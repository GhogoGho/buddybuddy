package edu.kh.bubby.offline.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import edu.kh.bubby.offline.model.service.ReserveService;
import edu.kh.bubby.offline.model.vo.OfflineClass;

@RestController
@RequestMapping("/reserve/*")
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	//예약 목록 조회
	@RequestMapping(value="relist",method = RequestMethod.POST)
	public String reserveSelectList(OfflineClass offClass) {
		List<OfflineClass> reList = service.reserveSelectList(offClass);
		Gson gson = new Gson();
		return gson.toJson(reList);
	}
	//예약 삽입
	@RequestMapping(value="reserveInsert",method = RequestMethod.POST)
	public int reserveInsert(OfflineClass offClass,@RequestParam("insertNum") int insertNum) {
		System.out.println(offClass);
		System.out.println(insertNum);
		int result =  service.reserveInsert(offClass,insertNum);
		if(result>0) {
			result=insertNum;
		}
		else {
			result=0;
		}
		return result;
	}
	
	
	
}
