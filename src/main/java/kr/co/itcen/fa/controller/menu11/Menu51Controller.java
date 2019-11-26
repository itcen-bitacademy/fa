package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu51Service;

/**
 * 
 * @author 박준호
 * 사채현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu51Controller.MAINMENU)
public class Menu51Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "51";
	
	@Autowired
	private Menu51Service menu51Service;
	
	                                   //   /11/51, /11/51/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu51Service.test();
		/*
		 *    JSP
		 *    11/51/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
