package edu.kh.bubby.offline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.bubby.offline.model.service.OfflineService;
import edu.kh.bubby.online.model.vo.Pagination;


@Controller
@RequestMapping("offclass/*")
public class OfflineController {

	@Autowired
	private OfflineService service;
	
	@RequestMapping("{classType}/list")
	public String offlineClassList(@PathVariable("classType") int classType,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			Model model, Pagination pg
			) {
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		
		Pagination pagination = service.getPagination(pg);
		return "offclass/OffClassMain";
	}
	
}
