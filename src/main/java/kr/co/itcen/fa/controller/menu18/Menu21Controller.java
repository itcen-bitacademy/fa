package kr.co.itcen.fa.controller.menu18;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu18.Menu21Service;
import kr.co.itcen.fa.vo.MenuVo;
import kr.co.itcen.fa.vo.menu18.TeamVo;


/**
 * 
 * @author kickscar
 * 팀관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu21Controller.MAINMENU)
public class Menu21Controller {
	
	public static final String MAINMENU = "18";
	public static final String SUBMENU = "21";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu21Service menu21Service;

	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<TeamVo> teams = menu21Service.getAllTeam();
		model.addAttribute("teams", teams);
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.GET)
	public String add(Model model) {
		List<MenuVo> listMainMenu = menuService.getAllMainMenu();
		model.addAttribute("listMainMenu", listMainMenu);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(TeamVo teamVo) {
		menu21Service.addTeam(teamVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
}