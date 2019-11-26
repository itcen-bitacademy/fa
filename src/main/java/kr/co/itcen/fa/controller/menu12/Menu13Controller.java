package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu13Service;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu13Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "13";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu13Service menu13Service;
	
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU})
	public String index() {
		return MAINMENU + "/" + SUBMENU + "/index";
	}
}
