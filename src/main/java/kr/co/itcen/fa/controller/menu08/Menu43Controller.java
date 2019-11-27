package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu43Service;


/**
 * 
 * @author 김유진
 * 
 * 무형자산관리 
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu43Controller.MAINMENU)
public class Menu43Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "43";
	
	
	@Autowired
	private Menu43Service menu43Service;
	
	
	//               /08   /   43     , /08/43/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu43Service.test();
		/*
		 *   JSP
		 *   08/43/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
}
