package kr.co.itcen.fa.controller.menu18;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu18.Menu65Service;


/**
 * 
 * @author 안대혁
 * 공통코드관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu65Controller.MAINMENU)
public class Menu65Controller {
	public static final String MAINMENU = "18";
	public static final String SUBMENU = "65";
	
	@Autowired
	private Menu65Service menu65Service;
	
	               // /18, /18/65, /18/65/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu65Service.test();
		/*
		 *  JSP
		 *  18/65/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}	
}
