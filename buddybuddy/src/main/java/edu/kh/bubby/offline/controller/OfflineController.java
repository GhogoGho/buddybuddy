package edu.kh.bubby.offline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("offclass/*")
public class OfflineController {

	@RequestMapping("{classType}/list")
	public String offlineClassList() {
		return "offclass/OffClassMain";
	}
	
}
