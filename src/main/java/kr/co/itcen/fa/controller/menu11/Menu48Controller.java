package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu48Service;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu48Controller.MAINMENU)
public class Menu48Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "48";
	
	@Autowired
	private Menu48Service menu48Service;
	
	                                   //   /11/48, /11/48/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu48Service.test();
		/*
		 *    JSP
		 *    11/50/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
