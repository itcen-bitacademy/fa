package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu29Service;


/**
 * 
 * @author 황슬기
 * 계정명세서조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu29Controller.MAINMENU)
public class Menu29Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "29";

	@Autowired
	private Menu29Service menu29Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu29Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}