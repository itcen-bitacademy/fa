package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu07Service;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu35Controller.MAINMENU)
public class Menu35Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "35";
	
	@Autowired
	private Menu07Service menu07Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu07Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
