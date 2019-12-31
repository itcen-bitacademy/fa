package kr.co.itcen.fa.controller.menu02;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

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

	// 처음 매입세금계산서관리 화면 접속할 때
	@RequestMapping(value = { "/" + SUBMENU, "/" + SUBMENU + "/add" }, method = RequestMethod.GET)
	public String add(Model model) {

		// 거래처리스트를 뿌리기위해 가져온다.
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();

		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 입력 post
	@RequestMapping(value = "/" + SUBMENU + "/add", method = RequestMethod.POST)
	public String write(Model model, @SessionAttribute("authUser") UserVo authUser, HttpServletRequest request,
			BuyTaxbillVo vo, Long amount[], String supplyValue[], String taxValue[], String purchaseDate[],
			String itemName[]) {
		
		// 거래처리스트를 뿌리기위해 가져온다.
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);

		// 입력하는 ID를 vo에 setting
		vo.setInsertUserid(authUser.getId());

		ArrayList<BuyTaxbillItemsVo> list = new ArrayList<BuyTaxbillItemsVo>();
		for (int i = 0; i < purchaseDate.length; i++) {
			BuyTaxbillItemsVo buyTaxbillItemsVo = new BuyTaxbillItemsVo();
			buyTaxbillItemsVo.setTaxbillNo(vo.getNo());
			buyTaxbillItemsVo.setPurchaseDate(purchaseDate[i]);
			buyTaxbillItemsVo.setItemName(itemName[i]);
			buyTaxbillItemsVo.setAmount(amount[i]);
			buyTaxbillItemsVo.setSupplyValue(supplyValue[i]);
			buyTaxbillItemsVo.setTaxValue(taxValue[i]);
			buyTaxbillItemsVo.setInsertUserid(authUser.getId());
			list.add(buyTaxbillItemsVo);
		}

		menu37Service.insertTax(vo);
		for (int i = 0; i < purchaseDate.length; i++) {
			menu37Service.insertItem(list.get(i));
		}

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 조회 post
	@RequestMapping(value = "/" + SUBMENU + "/lookUp", method = RequestMethod.POST)
	public String lookUp(Model model, BuyTaxbillVo vo) {
		BuyTaxbillVo getAboutNoData = menu37Service.getAboutNoData(vo.getNo());
		CustomerVo getAboutNoCustomerData = menu37Service.getAboutNoCustomerData(getAboutNoData.getCompanyName());
		BankAccountVo getAboutNoBankData = menu37Service.getAboutNoBankData(getAboutNoCustomerData.getDepositNo());
		List<BuyTaxbillItemsVo> getAboutItmes = menu37Service.getAboutItmes(vo.getNo());
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();

		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);
		model.addAttribute("flag", "true");
		model.addAttribute("getAboutNoData", getAboutNoData);
		model.addAttribute("getAboutItmesList", getAboutItmes);
		model.addAttribute("getAboutNoCustomerData", getAboutNoCustomerData);
		model.addAttribute("getAboutNoBankData", getAboutNoBankData);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 삭제 post
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(Model model, BuyTaxbillVo vo) {
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();

		menu37Service.taxbillDelete(vo.getNo());
		menu37Service.taxbillItemDelete(vo.getNo());

		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 수정 post
	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(Model model, BuyTaxbillVo vo, @SessionAttribute("authUser") UserVo authUser,
			String purchaseDate[], String itemName[], Long amount[], String supplyValue[], String taxValue[]) {

		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();

		vo.setUpdateUserid(authUser.getId());

		// 삭제하기전 처음 입력한 아이디와 입력일 저장
		vo.setInsertDay(vo.getInsertDay());
		vo.setInsertUserid(vo.getInsertUserid());

		// 세금계산서 테이블과 관련 항목들 삭제
		menu37Service.taxbillUpdateDelete(vo.getNo());
		menu37Service.taxbillItemsUpdateDelete(vo.getNo());

		ArrayList<BuyTaxbillItemsVo> list = new ArrayList<BuyTaxbillItemsVo>();

		for (int i = 0; i < purchaseDate.length; i++) {
			BuyTaxbillItemsVo buyTaxbillItemsVo = new BuyTaxbillItemsVo();
			buyTaxbillItemsVo.setTaxbillNo(vo.getNo());
			buyTaxbillItemsVo.setPurchaseDate(purchaseDate[i]);
			buyTaxbillItemsVo.setItemName(itemName[i]);
			buyTaxbillItemsVo.setAmount(amount[i]);
			buyTaxbillItemsVo.setSupplyValue(supplyValue[i]);
			buyTaxbillItemsVo.setTaxValue(taxValue[i]);
			buyTaxbillItemsVo.setInsertUserid(vo.getInsertUserid());
			buyTaxbillItemsVo.setInsertDay(vo.getInsertDay());
			buyTaxbillItemsVo.setUpdateUserid(authUser.getId());
			list.add(buyTaxbillItemsVo);
		}

		menu37Service.insertUpdatedTax(vo);
		for (int i = 0; i < purchaseDate.length; i++) {
			menu37Service.insertUpdatedItem(list.get(i));
		}
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

}
