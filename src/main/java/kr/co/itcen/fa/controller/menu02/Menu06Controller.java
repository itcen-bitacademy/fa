package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu06Service;

/**
 * 
 * @author 윤종진
 * 매입관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu06Controller.MAINMENU)
public class Menu06Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "06";
	
	@Autowired
	private Menu06Service menu06Service;
	
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu06Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
