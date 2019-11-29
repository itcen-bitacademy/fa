package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu46Service;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu46Controller.MAINMENU)
public class Menu46Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "46";
	
	@Autowired
	private Menu46Service menu46Service;
	
	                                   //   /11/46, /11/46/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String add(Model model) {
		List<STermDebtVo> list = menu46Service.getList();
		model.addAttribute("list", list);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
}
