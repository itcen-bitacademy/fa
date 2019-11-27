package kr.co.itcen.fa.controller.menu17;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.menu17.ClosingDate;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu19Controller.MAINMENU)
public class Menu19Controller {

	public static final String MAINMENU = "17";
	public static final String SUBMENU = "19";
	
	@Autowired
	private Menu19Service menu19Service;
	
	private Logger log = LoggerFactory.getLogger(Menu19Controller.class);
	
	@RequestMapping({"", "/" + SUBMENU + "/list" })
	public String test() {
		menu19Service.test();

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@PostMapping("/" + SUBMENU + "/add")
	public String addClosingDate(@RequestBody ClosingDate closingDate) {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
