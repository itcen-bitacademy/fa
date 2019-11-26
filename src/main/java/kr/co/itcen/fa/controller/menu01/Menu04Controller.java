package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu04Service;


/**
 * 
 * @author 임성주
 * 전표현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu04Controller.MAINMENU)
public class Menu04Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "04";

	@Autowired
	private Menu04Service menu04Service;

	// ""는 첫 메뉴에만 사용 - 성주 완성 후 삭제요망
	//  /18 /18/65 /18/65/list
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu04Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}