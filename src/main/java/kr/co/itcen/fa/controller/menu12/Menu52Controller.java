package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu52Service;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu52Controller.MAINMENU)
public class Menu52Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "52";

	@Autowired
	private Menu52Service menu52Service;
	
	@RequestMapping("/" + SUBMENU)
	public String list(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		int totalCnt = menu52Service.getTotalCnt();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		CustomerVo customerVo = new CustomerVo();
		customerVo.setDeleteFlag("N");
		
		model.addAttribute("customerList", menu52Service.getAllCustomer(customerVo, pagination));
		model.addAttribute("pagination", pagination);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/list", method=RequestMethod.POST)
	public String list(Model model, CustomerVo customerVo, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		System.out.println(customerVo);
		int totalCnt = menu52Service.getTotalCnt();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		model.addAttribute("customerList", menu52Service.getAllCustomer(customerVo, pagination));
		model.addAttribute("pagination", pagination);
		model.addAttribute("customerVo", customerVo);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
