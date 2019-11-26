package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu19Service;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu19Controller.MAINMENU)
public class Menu19Controller {

	public static final String MAINMENU = "17";
	public static final String SUBMENU = "19";
	
	@Autowired
	private Menu19Service menu19Service;
	
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu19Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
