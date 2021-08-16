package edu.kh.bubby;

import java.util.ArrayList;
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

		List<MainClass> classList = service.classList();

//		model.addAttribute("classList", classList);

		System.out.println("classList : " + classList);

		return "main";
	}

//	@RequestMapping(value = "/main", method = RequestMethod.POST)
//	public String home(Model model, int classNo) {
//
//		List<MainClass> classList = null;
//
//		classList = service.classList(classNo);
//
//		model.addAttribute("classList", classList);
//
//		System.out.println("classList : " + classList);
//
//		return "main";
//	}

}
