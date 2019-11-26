package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu42Service;


/**
 * 
 * @author 권영미
 * 
 * 차량현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu42Controller.MAINMENU)
public class Menu42Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "42";
	
	
	@Autowired
	private Menu42Service menu42Service;
	
	
	//               /08   /   42     , /08/42/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu42Service.test();
		/*
		 *   JSP
		 *   08/42/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
