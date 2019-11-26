package kr.co.itcen.fa.controller.menu18;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.dto.Menu;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.vo.MenuVo;

/**
 * 
 * @author kickscar
 * 메뉴관리
 * 
 */
@Auth
@Controller
@RequestMapping("/" + Menu23Controller.MAINMENU)
public class Menu23Controller {
	
	public static final String MAINMENU = "18";
	public static final String SUBMENU = "23";

	@Autowired
	private MenuService menuService;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<Menu> menus = menuService.getAllMenu();
		model.addAttribute("menus", menus);
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.GET)
	public String add(Model model) {
		List<MenuVo> listMainMenu = menuService.getAllMainMenu();
		model.addAttribute("listMainMenu", listMainMenu);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(MenuVo menuVo) {
		menuService.addMenu(menuVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
}