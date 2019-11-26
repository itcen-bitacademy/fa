package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu09Service;


/**
 * 
 * @author 정의돈
 * 
 * 토지관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu09Controller.MAINMENU)
public class Menu09Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "09";
	
	
	@Autowired
	private Menu09Service menu09Service;
	
	
	//               /08   /   09     , /08/09/list
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu09Service.test();
		/*
		 *   JSP
		 *   08/09/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
