package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu05Service;


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
	public String test(Model model) {
		menu05Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}