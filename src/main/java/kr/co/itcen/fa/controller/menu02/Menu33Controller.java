package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu33Service;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 * @author 강민호 
 * 매입품목관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu33Controller.MAINMENU)
public class Menu33Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "33";
	
	@Autowired
	private Menu33Service menu33Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list"})
	public String main(@ModelAttribute PurchaseitemVo purchaseitemVo) {
		System.out.println(purchaseitemVo.getNo());
		System.out.println(purchaseitemVo.getName());
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String input(@RequestParam(value = "item-id", required = false) String section_name) {
		System.out.println(section_name);
		
		System.out.println("gdgd");
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
}







