package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu40Service;


/**
 * 
 * @author 김민준
 * 
 * 건물현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu40Controller.MAINMENU)
public class Menu40Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "40";
	
	
	@Autowired
	private Menu40Service menu40Service;
	
	
	//               /08   /   40     , /08/40/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu40Service.test();
		/*
		 *   JSP
		 *   08/40/list.jsp
		 * 
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
