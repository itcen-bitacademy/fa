package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu60Service;

/**
 * 
 * @author 이성훈
 * 재무제표계정현황조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu60Controller.MAINMENU)
public class Menu60Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "60";
	
	@Autowired
	private Menu60Service menu60Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu60Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
