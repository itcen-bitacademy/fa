package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu24Service;


/**
 * 
 * @author 김승곤
 * 카드현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu24Controller.MAINMENU)
public class Menu24Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "24";

	@Autowired
	private Menu24Service menu24Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu24Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}