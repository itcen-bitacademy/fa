package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu36Service;

/**
 * 
 * @author 이지은
 * 매입거래처현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu36Controller.MAINMENU)
public class Menu36Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "36";
	
	@Autowired
	private Menu36Service menu36Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu36Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
