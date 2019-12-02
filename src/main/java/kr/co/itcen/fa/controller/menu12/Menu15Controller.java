package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu15Service;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu15Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "15";

	@Autowired
	private Menu15Service menu15Service;
	
	@RequestMapping("/" + SUBMENU)
	public String list(Model model) {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping("/" + SUBMENU + "/list")
	public String list(Model model, String no) {
		model.addAttribute("customerList", menu15Service.getAllCustomer(no));
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(CustomerVo customerVo) {
		menu15Service.addCustomer(customerVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
}
