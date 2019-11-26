package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu44Service;


/**
 * 
 * @author 김유진
 * 
 * 무형자산조회 
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu44Controller.MAINMENU)
public class Menu44Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "44";
	
	
	@Autowired
	private Menu44Service menu44Service;
	
	
	//               /08   /   44     , /08/44/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu44Service.test();
		/*
		 *   JSP
		 *   08/44/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
