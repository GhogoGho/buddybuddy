package edu.kh.bubby.offline.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.offline.model.service.OfflineService;
import edu.kh.bubby.offline.model.vo.OffAttachment;
import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OffSearch;
import edu.kh.bubby.offline.model.vo.OfflineClass;

@Controller
@RequestMapping("offclass/*")
@SessionAttributes({ "loginMember" })
public class OfflineController {

	@Autowired
	private OfflineService service;

	// 메인 조회
	@RequestMapping("{classType}/list")
	public String offlineClassList(@PathVariable("classType") int classType,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, OffPagination pg,
			OffSearch search) {
		pg.setClassType(classType);
		pg.setCurrentPage(cp);
		OffPagination pagination = null;
		List<OfflineClass> offList = null;
		if (search.getSk() == null) {
			pagination = service.getPagination(pg);
			offList = service.selectOfflinList(pagination);
		} else {
			pagination = service.getPagination(search, pg);
			offList = service.selectOfflinList(search, pagination);

		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("offList", offList);

		return "offclass/OffClassMain";
	}

	// 상세조회 페이지 이동
	@RequestMapping("{classType}/{classNo}")
	public String offlineClassView(@PathVariable("classType") int classType, @PathVariable("classNo") int classNo,
			Model model, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			RedirectAttributes ra) {
		OfflineClass offList = service.selectOfflinView(classNo);
		OfflineClass offContent = service.selectContent(classNo);
		// System.out.println(offList);
		offList.setClassContent(offContent.getClassContent());
		model.addAttribute("offList", offList);

		return "offclass/OffClassView";
	}

	// 클래스 작성 페이지
	@RequestMapping(value = "{classType}/insert", method = RequestMethod.GET)
	public String insertFormOfflineClass() {
		return "offclass/OffClassInsert";
	}

	// 클래스 작성 페이지
	@RequestMapping(value = "{classType}/insert", method = RequestMethod.POST)
	public String insertOfflineClass(@PathVariable("classType") int classType, OfflineClass offlineClass,
			@ModelAttribute("loginMember") Member loginMember, @RequestParam("images") List<MultipartFile> images,
			 @RequestParam("address") List address,
			 @RequestParam("editordata") String editordata,
			HttpServletRequest request, RedirectAttributes ra) {
		String classAddr = address.get(0)+","+address.get(1)+","+address.get(2);
		offlineClass.setClassArea(classAddr);
		offlineClass.setClassContent(editordata);		
		offlineClass.setMemberNo(loginMember.getMemberNo());
		offlineClass.setClassType(classType);
		String webPath = "resources/images/offlineClass";
		String savePath= request.getSession().getServletContext().getRealPath(webPath);
		int classNo = service.insertOfflineClass(offlineClass,images,webPath,savePath);
	
		return "offclass/OffClassInsert";
	}
}
