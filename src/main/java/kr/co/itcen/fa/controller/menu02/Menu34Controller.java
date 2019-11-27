package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu34Service;

/**
 * 
 * @author 강민호
 * 매입품목현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu34Controller.MAINMENU)
public class Menu34Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "34";
	
	@Autowired
	private Menu34Service menu34Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		//menu34Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
