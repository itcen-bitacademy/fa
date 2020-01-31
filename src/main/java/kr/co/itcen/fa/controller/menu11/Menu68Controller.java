package kr.co.itcen.fa.controller.menu11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;

@Auth
@Controller
@RequestMapping("/" + Menu68Controller.MAINMENU + "/" + Menu68Controller.SUBMENU)
public class Menu68Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "68";
	
	@RequestMapping({"","/statistics"})
	public String statistics() {
		return MAINMENU + "/" + SUBMENU + "/statistics";
	} 
}
