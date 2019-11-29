package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu37Service;

/**
 * 
 * @author 이제구
 * 매입세금계산서관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu37Controller.MAINMENU)
public class Menu37Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "37";
	
	@Autowired
	private Menu37Service menu37Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String add() {
		//menu37Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
}
