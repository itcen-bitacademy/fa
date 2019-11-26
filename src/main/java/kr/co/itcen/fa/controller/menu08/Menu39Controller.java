package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu39Service;


/**
 * 
 * @author 김민준
 * 
 * 건물관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu39Controller.MAINMENU)
public class Menu39Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "39";
	
	
	@Autowired
	private Menu39Service menu39Service;
	
	
	//               /08   /   39     , /08/39/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu39Service.test();
		/*
		 *   JSP
		 *   08/39/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
