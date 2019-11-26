package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu64Service;

/**
 * 
 * @author 유지훈
 * 손익계산서조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu64Controller.MAINMENU)
public class Menu64Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "64";
	
	@Autowired
	private Menu64Service menu64Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu64Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
