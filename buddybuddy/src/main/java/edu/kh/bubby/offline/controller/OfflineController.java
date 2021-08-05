package edu.kh.bubby.offline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.bubby.offline.model.service.OfflineService;
import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OfflineClass;



@Controller
@RequestMapping("offclass/*")
public class OfflineController {

	@Autowired
	private OfflineService service;
	
	@RequestMapping("{classType}/list")
	public String offlineClassList(@PathVariable("classType") int classType,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			Model model, OffPagination pg
			) {
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		
		OffPagination pagination = service.getPagination(pg);
		System.out.println(pagination);
		List<OfflineClass> offList = service.selectOfflinList(pagination);
		System.out.println(offList);
		model.addAttribute("pagination",pagination);
		model.addAttribute("offList",offList);
		
		return "offclass/OffClassMain";
	}
	
	@RequestMapping("{classType}/{classNo}")
	public String offlineClassView(){
		return "offclass/OffClassView";
	}
	
}
