package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu54Service;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;
import kr.co.itcen.fa.vo.menu12.TaxbillSearchVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu54Controller.MAINMENU)
public class Menu54Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "54";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu54Service menu54Service;
	
	
	// 필터기능없이 조회되는 리스트 
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu54Service.test();
		
		List<SellTaxbillVo> customerlist = menu54Service.salesCustomer();
		model.addAttribute("customerlist", customerlist);
		
		List<SellTaxbillVo> itemlist = menu54Service.salesItems();
		model.addAttribute("itemlist", itemlist);
		
		List<SellTaxbillVo> taxlist = menu54Service.taxbillList();
		model.addAttribute("taxlist", taxlist);
		
		List<SellTaxbillVo> resultlist = menu54Service.taxbillAllList();
		model.addAttribute("resultlist", resultlist);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 조회기능을 구현한 Controller
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}"}, method=RequestMethod.POST)
	public String list(TaxbillSearchVo tvo, Model model) {
		
		System.out.println("검색기능");
		
		List<SellTaxbillVo> customerlist = menu54Service.salesCustomer();
		model.addAttribute("customerlist", customerlist);
		
		List<SellTaxbillVo> itemlist = menu54Service.salesItems();
		model.addAttribute("itemlist", itemlist);
		
		List<SellTaxbillVo> taxlist = menu54Service.taxbillList();
		model.addAttribute("taxlist", taxlist);
		
		List<SellTaxbillVo> alllist = menu54Service.taxbillAllList();
		model.addAttribute("alllist", alllist);
		
		List<SellTaxbillVo> resultlist = menu54Service.taxbillsearch(tvo);
		model.addAttribute("resultlist", resultlist);
		System.out.println(resultlist.toString());
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}


}
