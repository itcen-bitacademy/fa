package kr.co.itcen.fa.controller.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu27Service;

/**
 * 
 * @author 이종윤 
 * 거래처 관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu27Controller.MAINMENU)
public class Menu27Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "27";

	@Autowired
	private Menu27Service menu27Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu27Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
