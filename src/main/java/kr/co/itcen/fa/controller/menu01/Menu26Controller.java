package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu26Service;


/**
 * 
 * @author 황슬기
 * 계좌조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu26Controller.MAINMENU)
public class Menu26Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "26";

	@Autowired
	private Menu26Service menu26Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu26Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}