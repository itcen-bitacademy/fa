package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.controller.menu11.Menu46Controller;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu67Service;

/**
 * 
 * @author 반현길
 * 단기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu67Controller.MAINMENU + "/" + Menu67Controller.SUBMENU)
public class Menu67Controller {
	
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "67";
	
	@Autowired
	private Menu67Service menu67Service;
	
	//기본
/*	@RequestMapping({"",  "/add" })
	public String add(Model model) {
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping("/statistics")
	public String statistics() {
		return MAINMENU + "/" + SUBMENU + "/statistics";
	}*/
	
	@RequestMapping({"", "/statistics" })
	public String list() {
		System.out.println("매출통계");
		
		return MAINMENU + "/" + SUBMENU + "/statistics";
	}
	
	
	
}
