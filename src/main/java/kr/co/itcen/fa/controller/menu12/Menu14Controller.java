package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu14Service;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu14Controller.MAINMENU)
public class Menu14Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "14";

	@Autowired
	private Menu14Service menu14Service;
	
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}" }, method=RequestMethod.GET)
	public String list(Model model,
						@PathVariable(name="page", required=false) String page) {
		int ipage = 1;
		if(page!=null) {
			ipage = Integer.parseInt(page);
		} 
		System.out.println(ipage);
		List<CustomerVo> customerlist = menu14Service.getCustomerList();
		List<PurchaseitemVo> itemlist = menu14Service.getItemList();
		
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("itemlist", itemlist);
		
		model.addAttribute("dataResult", menu14Service.getList(ipage));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU }, method=RequestMethod.POST)
	public String list(SalesVo vo, String dates, Model model) {
		String[] date = dates.split(" - ");
		
		vo.setStartDate(date[0]);
		vo.setEndDate(date[1]);
		
		List<SalesVo> list = menu14Service.getSerchList(vo);
		List<CustomerVo> customerlist = menu14Service.getCustomerList();
		List<PurchaseitemVo> itemlist = menu14Service.getItemList();
		
		model.addAttribute("list", list);
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("itemlist", itemlist);
		
		return MAINMENU + "/" + SUBMENU + "/list"; 
	}
}
