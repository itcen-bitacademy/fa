package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu15Service;

/**
 * 
 * @author 양홍석
 * 매출거래처관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu15Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "15";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu15Service menu15Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu15Service.test();
		/*
		 * JSP
		 * 12/15/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
