package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu61Service;

/**
 * 
 * @author 최웅
 * 결산작업
 */

@Auth
@Controller
@RequestMapping("/" + Menu61Controller.MAINMENU)
public class Menu61Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "61";
	
	@Autowired
	private Menu61Service menu61Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu61Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
