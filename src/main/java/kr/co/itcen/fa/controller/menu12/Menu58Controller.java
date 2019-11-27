package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu15Service;

/**
 * 
 * @author 양홍석
 * 월별거래처매입현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu58Controller.MAINMENU)
public class Menu58Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "58";

	@Autowired
	private Menu15Service menu15Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
