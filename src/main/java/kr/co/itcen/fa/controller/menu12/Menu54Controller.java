package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	private Menu54Service menu54Service;
	
	
	// 필터기능없이 조회되는 리스트 
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list", "/" + SUBMENU + "/{page }" }, method=RequestMethod.GET)
	public String list(Model model, @PathVariable(name="page", required=false) String page) {
		
		int ipage = 1;
		if(page!=null) { // pathvariable 페이지 없는경우 1페이지 세팅
			ipage = Integer.parseInt(page);
		} 
		
		// 거래처에 대한 리스트를 출력해주는 기능
		//List<SellTaxbillVo> customerlist = menu54Service.salesCustomer();
		model.addAttribute("customerlist", menu54Service.salesCustomer());
		
		// 판매물품에 대한 리스트를 출력해주는 기능
		//List<SellTaxbillVo> itemlist = menu54Service.salesItems();
		model.addAttribute("itemlist", menu54Service.salesItems());
		
		// 세금계산서에 대한 리스트를 출력해주는 기능
		//List<SellTaxbillVo> taxlist = menu54Service.taxbillList();
		model.addAttribute("taxlist", menu54Service.taxbillList());
		
		// 필터기능을 거치지 않고 전체 리스트가 조회되는 기능
		model.addAttribute("resultlist", menu54Service.taxbillAllList(ipage));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 조회기능을 구현한 Controller
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}"}, method=RequestMethod.POST)
	public String list(TaxbillSearchVo tvo, Model model, 
			@PathVariable(name="page", required=false)String page, 
			@RequestParam(name="viewCount") int viewCount) {
		
		System.out.println("검색기능");
		
		int ipage = 1;
		if(page!=null) { // pathvariable 페이지 없는경우 1페이지 세팅
			ipage = Integer.parseInt(page);
		}
		
		List<SellTaxbillVo> customerlist = menu54Service.salesCustomer();
		model.addAttribute("customerlist", customerlist);
		
		List<SellTaxbillVo> itemlist = menu54Service.salesItems();
		model.addAttribute("itemlist", itemlist);
		
		List<SellTaxbillVo> taxlist = menu54Service.taxbillList();
		model.addAttribute("taxlist", taxlist);
		
		//List<SellTaxbillVo> alllist = menu54Service.taxbillAllList(ipage);
		model.addAttribute("alllist", menu54Service.taxbillAllList(ipage));
		
		List<SellTaxbillVo> resultlist = menu54Service.taxbillSearch(tvo, ipage, viewCount);
		model.addAttribute("resultlist", resultlist);
		
		System.out.println(tvo.toString());	// 객체에 값은 담겨있다.
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}


}
