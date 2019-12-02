package kr.co.itcen.fa.controller.menu01;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu05Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CardVo;


/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu05Controller.MAINMENU)
public class Menu05Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "05";

	@Autowired
	private Menu05Service menu05Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<CardVo> list = menu05Service.list();
		System.out.println(list);
		model.addAttribute("list", list);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
	@RequestMapping(value="/" + SUBMENU + "/create", method=RequestMethod.POST)
	public String create(@ModelAttribute @Valid CardVo vo, @AuthUser UserVo uvo
			, @RequestParam("validityMM") String validityMM, @RequestParam("validityYY") String validityYY) {
		String validity = validityMM + "/"+ validityYY ;
		vo.setValidity(validity);
		vo.setInsertUserId(uvo.getName());
		menu05Service.create(vo);
		
		return "redirect:/"+MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/remove", method=RequestMethod.POST)
	public String remove(@ModelAttribute CardVo vo) {
		menu05Service.remove(vo);
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
}