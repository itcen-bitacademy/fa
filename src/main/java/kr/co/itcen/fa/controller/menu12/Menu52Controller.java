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
 * 매출거래처현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu52Controller.MAINMENU)
public class Menu52Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "52";

	@Autowired
	private Menu15Service menu15Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
