package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu49Service;

/**
 * 
 * @author 김준호
 * 장기차입금현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu49Controller.MAINMENU)
public class Menu49Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "49";
	
	@Autowired
	private Menu49Service menu49Service;
	
	                                   //   /11/49, /11/49/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") String year) {
		menu49Service.test();
		
		
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
