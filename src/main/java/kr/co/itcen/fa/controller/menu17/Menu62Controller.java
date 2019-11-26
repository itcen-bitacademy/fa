package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu62Service;

/**
 * 
 * @author 최웅
 * 합계잔액시산표조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu62Controller.MAINMENU)
public class Menu62Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "62";
	
	@Autowired
	private Menu62Service menu62Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu62Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
