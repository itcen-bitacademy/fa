package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu45Service;

/**
 * 
 * @author 이지수
 * 은행코드현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu45Controller.MAINMENU)
public class Menu45Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "45";
	
	@Autowired
	private Menu45Service menu45Service;
	
	                                   //   /11/45, /11/45/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu45Service.test();
		/*
		 *    JSP
		 *    11/45/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
