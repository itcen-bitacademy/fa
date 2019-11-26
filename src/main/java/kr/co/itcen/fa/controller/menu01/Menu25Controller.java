package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu25Service;


/**
 * 
 * @author 황슬기
 * 계좌관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu25Controller.MAINMENU)
public class Menu25Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "25";

//	@Autowired
//	private MenuService menuService;

	@Autowired
	private Menu25Service menu25Service;

	// ""는 첫 메뉴에만 사용 - 성주 완성 후 삭제요망
	//  /18 /18/65 /18/65/list
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu25Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}