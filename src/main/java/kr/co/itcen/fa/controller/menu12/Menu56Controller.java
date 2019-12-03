package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu56Service;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별매입매출현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu56Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "56";

//	@Autowired
//	private MenuService menuService;

	@Autowired
	private Menu56Service menu56Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu56Service.test();
		/*
		 * JSP
		 * 12/56/list.jsp
		 */
		List<CurrentSituationVo> list = menu56Service.getList();
		model.addAttribute("list",list);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
}

