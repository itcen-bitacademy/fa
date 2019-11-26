package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu30Service;


/**
 * 
 * @author 김승곤
 * 계정 거래처 명세서 조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu30Controller.MAINMENU)
public class Menu30Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "30";

	@Autowired
	private Menu30Service menu30Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu30Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}