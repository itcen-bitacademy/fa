package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu14Service;
import kr.co.itcen.fa.vo.menu12.SalesSearchVo;

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
		
		System.out.println("check!!!!!!!!!!!!!!!!!!");
		
		model.addAttribute("customerlist", menu14Service.getCustomerList());
		model.addAttribute("itemlist", menu14Service.getItemList());
		model.addAttribute("dataResult", menu14Service.getList(ipage));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
		
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}"}, method=RequestMethod.POST)
	public String list(SalesSearchVo vo, String dates, Model model, String page) {	
		int ipage = 1;
		if(page!=null) {
			ipage = Integer.parseInt(page);
		}
		
		String[] date = dates.split(" - ");		
		System.out.println(date[0]);
		vo.setStartDate(date[0]);
		vo.setEndDate(date[1]);
		vo.setSearchFlag(true);
		
		model.addAttribute("dataResult", menu14Service.getSerchList(vo, ipage));
		model.addAttribute("customerlist", menu14Service.getCustomerList());
		model.addAttribute("itemlist", menu14Service.getItemList());
		
		model.addAttribute("search", vo);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
