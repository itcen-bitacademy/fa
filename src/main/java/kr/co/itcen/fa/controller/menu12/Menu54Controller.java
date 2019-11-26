package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu54Service;

/**
 * 
 * @author 안태영
 * 매출세금계산서현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu54Controller.MAINMENU)
public class Menu54Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "54";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu54Service menu54Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu54Service.test();
		/*
		 * JSP
		 * 12/15/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
