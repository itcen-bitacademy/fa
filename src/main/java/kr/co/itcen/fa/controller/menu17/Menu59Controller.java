package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu59Service;

/**
 * 
 * @author 이성훈
 * 재무제표계정관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu59Controller.MAINMENU)
public class Menu59Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "59";
	
	@Autowired
	private Menu59Service menu59Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String test() {
		menu59Service.test();

		return MAINMENU + "/" + SUBMENU + "/add";
	}
	

	
}
