package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu14Service;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu13Controller.MAINMENU)
public class Menu14Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "14";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu14Service menu14Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU })
	public String list() {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
