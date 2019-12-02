package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;

import kr.co.itcen.fa.service.menu12.Menu53Service;

/**
 * 
 * @author 안태영
 * 매출세금계산서관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu53Controller.MAINMENU)
public class Menu53Controller {
	
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "53";

	// 작업순서
	// 1. 매출조회 누르면 리스트 출력
	// 2. insert
	// 3. 테이블 리스트 출력
	
	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu53Service menu53Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu53Service.test();
		/*
		 * JSP
		 * 12/15/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	

}
