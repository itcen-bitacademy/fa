package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu48Service;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu48Controller.MAINMENU)
public class Menu48Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "48";
	
	@Autowired
	private Menu48Service menu48Service;
	
	                                   //   /11/48, /11/48/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String test(Model model) {
		List<LTermdebtVo> list = menu48Service.list();
		
		model.addAttribute("list",list);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	@RequestMapping(value = "/"+SUBMENU+"/add", method = RequestMethod.POST)
	public String add(LTermdebtVo vo) {

		String[] dates=vo.getDebtExpDate().split("-");
		vo.setDebtDate(dates[0]);
		vo.setExpDate(dates[1]);
		System.out.println(vo);
		menu48Service.insert(vo);
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
}
