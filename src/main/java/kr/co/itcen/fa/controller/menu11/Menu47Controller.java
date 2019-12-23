package kr.co.itcen.fa.controller.menu11;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu11.Menu47Service;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu47Controller.MAINMENU)
public class Menu47Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "47";
	
	@Autowired
	private Menu47Service menu47Service;
	
	@NoAuth                                  //   /11/47, /11/47/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		Map map = menu47Service.getListMap();
		
		model.addAllAttributes(map);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
