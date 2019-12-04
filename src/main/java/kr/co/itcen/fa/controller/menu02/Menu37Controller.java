package kr.co.itcen.fa.controller.menu02;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu37Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구 매입세금계산서관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu37Controller.MAINMENU)
public class Menu37Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "37";
	// menu37Service.customerRead();
	@Autowired
	private Menu37Service menu37Service;

	@RequestMapping(value = { "/" + SUBMENU, "/" + SUBMENU + "/add" }, method = RequestMethod.GET)
	public String add(@ModelAttribute UserVo authUser, Model model) {
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();

		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	@RequestMapping(value = "/" + SUBMENU + "/add", method = RequestMethod.POST)
	public String write(@ModelAttribute BuyTaxbillVo vo, HttpSession session, String purchaseDate[], String itemName[],
			Long amount[], Long supplyValue[], Long taxValue[]) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		String insertUserid = authUser.getId();
		vo.setInsertUserid(insertUserid);

		ArrayList<BuyTaxbillItemsVo> list = new ArrayList<BuyTaxbillItemsVo>();

		for (int i = 0; i < purchaseDate.length; i++) {
			BuyTaxbillItemsVo buyTaxbillItemsVo = new BuyTaxbillItemsVo();
			buyTaxbillItemsVo.setTaxbillNo(vo.getNo());
			buyTaxbillItemsVo.setPurchaseDate(purchaseDate[i]);
			buyTaxbillItemsVo.setItemName(itemName[i]);
			buyTaxbillItemsVo.setAmount(amount[i]);
			buyTaxbillItemsVo.setSupplyValue(supplyValue[i]);
			buyTaxbillItemsVo.setTaxValue(taxValue[i]);
			buyTaxbillItemsVo.setInsertUserid(insertUserid);
			list.add(buyTaxbillItemsVo);
		}

		menu37Service.insertTax(vo);
		for (int i = 0; i < purchaseDate.length; i++) {
			menu37Service.insertItem(list.get(i));
		}

		return MAINMENU + "/" + SUBMENU + "/add";
	}
	@RequestMapping(value = "/" + SUBMENU + "/lookUp", method = RequestMethod.POST)
	public String lookUp(Model model, @ModelAttribute BuyTaxbillVo vo, HttpSession session) {
		BuyTaxbillVo getAboutNoData = menu37Service.getAboutNoData(vo.getNo());
		CustomerVo getAboutNoCustomerData = menu37Service.getAboutNoCustomerData(getAboutNoData.getCompanyName());
		BankAccountVo getAboutNoBankData = menu37Service.getAboutNoBankData(getAboutNoCustomerData.getDepositNo());
		
		model.addAttribute("getAboutNoData", getAboutNoData);
		model.addAttribute("getAboutNoCustomerData", getAboutNoCustomerData);
		model.addAttribute("getAboutNoBankData", getAboutNoBankData);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(@ModelAttribute BuyTaxbillVo vo, HttpSession session) {
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute BuyTaxbillVo vo, HttpSession session) {
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	
}
