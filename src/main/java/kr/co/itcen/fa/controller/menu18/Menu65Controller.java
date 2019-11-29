package kr.co.itcen.fa.controller.menu18;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.dto.Section;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu18.Menu65Service;
import kr.co.itcen.fa.vo.SectionVo;


/**
 * 
 * @author 안대혁
 * 공통코드관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu65Controller.MAINMENU)
public class Menu65Controller {
	public static final String MAINMENU = "18";
	public static final String SUBMENU = "65";
	
	@Autowired
	private Menu65Service menu65Service;
	
	               // /18, /18/65, /18/65/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		
		//menu65Service.test();
		/*
		 *  JSP
		 *  18/65/list.jsp
		 */
		//List<Section> sections = menu65Service.getAllSection();
		//model.addAttribute("sections", sections);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 대분류명이 View에 있는 Select Box에 표시될수 있도록 하는 메소드
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.GET)
	public String add(Model model) {
		List<SectionVo> listMainSection = menu65Service.getAllMainSection();
		model.addAttribute("listMainSection", listMainSection);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(SectionVo sectionVo) {
		menu65Service.addSection(sectionVo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	
}
