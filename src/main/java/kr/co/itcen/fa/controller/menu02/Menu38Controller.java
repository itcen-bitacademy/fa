package kr.co.itcen.fa.controller.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu38Service;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillListVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구 매입세금계산서현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu38Controller.MAINMENU)
public class Menu38Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "38";

	@Autowired
	private Menu38Service menu38Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<BuyTaxbillVo> getAllBuyTaxbillList = menu38Service.getAllBuyTaxbill();
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();

		model.addAttribute("taxbillList", getAllBuyTaxbillList);
		model.addAttribute("customerList", getMatchTaxbillCustomerList);
		model.addAttribute("itemsList", getMatchTaxbillItemsList);

		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@RequestMapping(value = "/" + SUBMENU + "/list", method = RequestMethod.POST )
	public String list(Model model, BuyTaxbillListVo buyTaxbillListVo) {
		
		
		System.out.println(buyTaxbillListVo.toString());
		List<BuyTaxbillVo> getSelectedBuyTaxbillList = menu38Service.getSelectedBuyTaxbillList(buyTaxbillListVo);
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();

		model.addAttribute("taxbillList", getSelectedBuyTaxbillList);
		model.addAttribute("customerList", getMatchTaxbillCustomerList);
		model.addAttribute("itemsList", getMatchTaxbillItemsList);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
