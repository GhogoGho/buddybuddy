package edu.kh.bubby.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.member.model.service.MemberService;

@RestController
@RequestMapping("/member/myPage/1/*")
public class MemberReserveController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="noReserve", method=RequestMethod.GET)
	public int noReserve(@RequestParam("reserveNo") int reserveNo, RedirectAttributes ra) {
				
		int result = service.noReserve(reserveNo);	
		
		return result;
	}

}
