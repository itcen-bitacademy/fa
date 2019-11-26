package kr.co.itcen.fa.controller.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu20Service;

/**
 * 
 * @author 김재원
 * 마감현황관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu20Controller.MAINMENU)
public class Menu20Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "20";
	
	@Autowired
	private Menu20Service menu20Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu20Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
