package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu38Service;

/**
 * 
 * @author 윤종진
 * 매입세금계산서현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu38Controller.MAINMENU)
public class Menu38Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "38";
	
	@Autowired
	private Menu38Service menu38Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test() {
		menu38Service.test();
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
