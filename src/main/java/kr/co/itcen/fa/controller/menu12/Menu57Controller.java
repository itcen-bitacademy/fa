package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu57Service;

/**
 * 
 * @author 곽세연
 * 월별거래처매출현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu57Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "57";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu57Service menu57Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu57Service.test();
		/*
		 * JSP
		 * 12/57/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}

