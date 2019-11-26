package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu10Service;


/**
 * 
 * @author 정의돈
 * 
 * 토지현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu10Controller.MAINMENU)
public class Menu10Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "10";
	
	
	@Autowired
	private Menu10Service menu10Service;
	
	
	//               /08   /   10     , /08/10/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu10Service.test();
		/*
		 *   JSP
		 *   08/10/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
