package kr.co.itcen.fa.controller.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu06Service;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 윤종진 매입관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu06Controller.MAINMENU)
public class Menu06Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "06";

	@Autowired
	private Menu06Service menu06Service;

	@RequestMapping(value = { "", "/" + SUBMENU, "/" + SUBMENU + "/list" }, method = RequestMethod.GET)
	public String index(Model model) {
		List<PurchaseitemVo> itemList = menu06Service.getItemList();
		List<CustomerVo> customerList = menu06Service.getCustomerList();
		model.addAttribute("itemList", itemList);
		model.addAttribute("customerList", customerList);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@ResponseBody
	@RequestMapping(value = {"/" + SUBMENU + "/search" }, method = RequestMethod.POST)
	public PurchasemanagementVo search(@RequestBody PurchasemanagementVo vo) {
		PurchasemanagementVo result = menu06Service.getList(vo);
		result.setPurchaseDate(result.getPurchaseDate().substring(0,10));
		result.setReceiptDate(result.getReceiptDate().substring(0,10));
		result.setReleaseDate(result.getReleaseDate().substring(0,10));
		System.out.println(result);
		return result;
	}
	
	
	@RequestMapping(value = {"/" + SUBMENU + "/update" }, method = RequestMethod.POST)
	public String update(PurchasemanagementVo vo) {
		if("".equals(vo.getTaxbillNo())) {
			vo.setTaxbillNo("0");
		}
		menu06Service.update(vo);
		return "redirect:/02";
	}

	@RequestMapping(value = { "", "/" + SUBMENU, "/" + SUBMENU + "/input" }, method = RequestMethod.POST)
	public String input(PurchasemanagementVo purchasemanagementVo, Long number[], int quantity[], String itemCode[],
			String itemName[], Long supplyValue[], Long taxValue[]) {

		System.out.println(purchasemanagementVo);
		Long[] totalPrice = new Long[itemCode.length];
		String[] date = { purchasemanagementVo.getPurchaseDate(), purchasemanagementVo.getReceiptDate(), purchasemanagementVo.getReleaseDate()};
		for(int j = 0; j < date.length; j++) {
			if("".equals(date[j]))
			{
				date[j] = "1900-01-01";
			}
		}
		purchasemanagementVo.setPurchaseDate(date[0]);
		purchasemanagementVo.setReceiptDate(date[1]);
		purchasemanagementVo.setReleaseDate(date[2]);
		
		// 배열로 넘어온 테이블 데이터 리스트에 담기
		if (itemCode.length > 1) {
			for (int i = 0; i < itemCode.length; i++) {
				PurchasemanagementVo vo = new PurchasemanagementVo(purchasemanagementVo);
				vo.setNumber(number[i]);
				vo.setQuantity(quantity[i]);
				vo.setItemCode(itemCode[i]);
				vo.setItemName(itemName[i]);
				vo.setSupplyValue(supplyValue[i]);
				vo.setTaxValue(taxValue[i]);
				totalPrice[i] = (supplyValue[i] + taxValue[i])*quantity[i];
				vo.setTotalPrice(totalPrice[i]);
				menu06Service.insert(vo);
			}
		} else {
			menu06Service.insert(purchasemanagementVo);
		}

		return "redirect:/02";
	}
}
