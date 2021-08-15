package edu.kh.bubby;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.kh.bubby.main.model.service.MainService;
import edu.kh.bubby.main.model.vo.MainClass;

@Controller
public class HomeController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "main"; 
	}
	
	@RequestMapping(value = "/main")
	public String home(Model model) {
		
		List<MainClass> classList = null;
		
		classList = service.classList();
		
		model.addAttribute("classList", classList);
		
		System.out.println("classList : " + classList);		
		
		return "main"; 
	}
	
}

