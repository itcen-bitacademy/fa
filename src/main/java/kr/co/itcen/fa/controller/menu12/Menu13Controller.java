package kr.co.itcen.fa.controller.menu12;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu13Service;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu13Controller.MAINMENU)
public class Menu13Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "13";

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu13Service menu13Service;
	
	@RequestMapping(value = {"", "/" + SUBMENU, "/" + SUBMENU}, method=RequestMethod.GET )
	public String index() {
		return MAINMENU + "/" + SUBMENU + "/index";
	}
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU}, method=RequestMethod.POST)
	public String index(SalesVo vo, 
			int quantity[], Long itemCode[], String itemName[], Long supplyValue[], Long taxValue[]) {
		
		ArrayList<SalesVo> list = new ArrayList<SalesVo>();
		
		for(int i=0; i<itemCode.length; i++) {
			vo.setQuantity(quantity[i]);
			vo.setItemCode(itemCode[i]);
			vo.setItemName(itemName[i]);
			vo.setSupplyValue(supplyValue[i]);
			vo.setTaxValue(taxValue[i]);
			
			System.out.println(vo.getItemCode()+vo.getItemName());
			list.add(vo);
		}
		
		for(SalesVo item : list) {
			System.out.println(item.getItemCode()+" : "+item.getItemName());
		}
		
		menu13Service.insert(list);
		
		return MAINMENU + "/" + SUBMENU + "/index";
	}
}
