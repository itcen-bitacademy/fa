package kr.co.itcen.fa.controller.menu18;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.UserService;
import kr.co.itcen.fa.service.menu18.Menu21Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu18.TeamVo;

/**
 * 
 * @author kickscar
 * 사용자관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu22Controller.MAINMENU)
public class Menu22Controller {
	
	public static final String MAINMENU = "18";
	public static final String SUBMENU = "22";
	
	@Autowired
	private UserService userService;

	@Autowired
	private Menu21Service menu21Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<UserVo> users = userService.getAllUser();
		model.addAttribute("users", users);
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.GET)
	public String add(Model model) {
		List<TeamVo> teams = menu21Service.getAllTeam();
		model.addAttribute("teams", teams);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String insert(UserVo userVo) {
		userService.addUser(userVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
}