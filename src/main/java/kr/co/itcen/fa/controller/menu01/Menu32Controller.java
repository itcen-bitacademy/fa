package kr.co.itcen.fa.controller.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu32Service;
import kr.co.itcen.fa.service.menu17.Menu59Service;

/**
 * 
 * @author 이종윤 
 * 계정거래처원장조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu32Controller.MAINMENU)
public class Menu32Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "32";

	@Autowired
	private Menu32Service menu32Service;

	@Autowired // 계정조회를 사용할 것임...
	private Menu59Service menu59Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		menu32Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
