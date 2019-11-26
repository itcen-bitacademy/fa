package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu07Service;

/**
 * 
 * @author 윤종진
 * 매입현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu07Controller.MAINMENU)
public class Menu07Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "07";
	
	@Autowired
	private Menu07Service menu07Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu07Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
