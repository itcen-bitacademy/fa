package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu50Service;

/**
 * 
 * @author 박준호
 * 사채관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu50Controller.MAINMENU)
public class Menu50Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";
	
	@Autowired
	private Menu50Service menu50Service;
	
	                                   //   /11/50, /18/65/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu50Service.test();
		/*
		 *    JSP
		 *    11/50/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
