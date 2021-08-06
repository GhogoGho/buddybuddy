package edu.kh.bubby.offline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.offline.model.service.OfflineService;
import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OffSearch;
import edu.kh.bubby.offline.model.vo.OfflineClass;



@Controller
@RequestMapping("offclass/*")
public class OfflineController {

	@Autowired
	private OfflineService service;
	//메인 조회
	@RequestMapping("{classType}/list")
	public String offlineClassList(@PathVariable("classType") int classType,
			@RequestParam(value="cp", required=false, defaultValue = "1" ) int cp,
			Model model, OffPagination pg, OffSearch search
			) {
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		OffPagination pagination =null;
		List<OfflineClass> offList =null;
		if(search.getSk()==null) {
			pagination = service.getPagination(pg);
			offList = service.selectOfflinList(pagination);			
		}else {
			pagination = service.getPagination(search,pg);
			offList = service.selectOfflinList(search,pagination);			
			
		}
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("offList",offList);
		
		return "offclass/OffClassMain";
	}
	//상세조회 페이지 이동
	@RequestMapping("{classType}/{classNo}")
	public String offlineClassView(@PathVariable("classType")int classType,@PathVariable("classNo") int classNo,Model model,
			@RequestParam(value="cp",required = false,defaultValue = "1") int cp,
			RedirectAttributes ra){
		OfflineClass offList = service.selectOfflinView(classNo);
		System.out.println(offList);
		model.addAttribute("offList",offList);
		return "offclass/OffClassView";
	}
	//클래스 작성 페이지
	@RequestMapping("{classType}/insert")
	public String insertOfflineClass() {
		return "offclass/OffClassInsert";
	}
}
