package kr.co.itcen.fa.controller.menu12;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu13Service;
import kr.co.itcen.fa.vo.UserVo;
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
@RequestMapping("/" + Menu13Controller.MAINMENU)
public class Menu13Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "13";


	@Autowired
	private Menu13Service menu13Service;
	
	@RequestMapping(value = {"", "/" + SUBMENU, "/" + SUBMENU}, method=RequestMethod.GET )
	public String index(@ModelAttribute UserVo authUser, Model model) {
		List<CustomerVo> customerlist = menu13Service.getCustomerList();
		List<PurchaseitemVo> itemlist = menu13Service.getItemList();
		
		System.out.println(customerlist.toString());
		System.out.println(itemlist.toString());
		
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("itemlist", itemlist);
		
		return MAINMENU + "/" + SUBMENU + "/index";
	}
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU}, method=RequestMethod.POST)
	public String index(SalesVo salesVo, 
			int quantity[], Long itemCode[], String itemName[], Long supplyValue[], Long taxValue[]) {
		
		ArrayList<SalesVo> list = new ArrayList<SalesVo>();
		
		// 배열로 넘어온 테이블 데이터 리스트에 담기
		for(int i=0; i<itemCode.length; i++) {
			SalesVo vo = new SalesVo(salesVo);
			vo.setQuantity(quantity[i]);
			vo.setItemCode(itemCode[i]);
			vo.setItemName(itemName[i]);
			vo.setSupplyValue(supplyValue[i]);
			vo.setTaxValue(taxValue[i]);
			
			list.add(vo);
		}
		
		menu13Service.insert(list);
		
		return MAINMENU + "/" + SUBMENU + "/index";
	}
}
