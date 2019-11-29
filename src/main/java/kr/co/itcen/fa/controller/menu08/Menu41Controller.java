package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu41Service;


/**
 * 
 * @author 권영미
 * 
 * 차량관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu41Controller.MAINMENU)
public class Menu41Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "41";
	
	
	@Autowired
	private Menu41Service menu41Service;
	
	
	//               /08   /   41     , /08/41/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model) {
		menu41Service.test();
		/*
		 *   JSP
		 *   08/41/list.jsp
		 * 
		 */
		//직급 select box
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu41Service.getName());
		model.addAllAttributes(map);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
}
