package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu63Service;

/**
 * 
 * @author 유지훈
 * 대차대조표조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu63Controller.MAINMENU)
public class Menu63Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "63";
	
	@Autowired
	private Menu63Service menu63Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu63Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
