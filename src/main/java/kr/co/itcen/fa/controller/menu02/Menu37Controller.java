package kr.co.itcen.fa.controller.menu02;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@Autowired
	private Menu37Service menu37Service;

	/* 처음 매입세금계산서관리 화면 접속할 때 */
	@RequestMapping(value = { "/" + SUBMENU, "/" + SUBMENU + "/add" }, method = RequestMethod.GET)
	public String add(Model model) {

		// 거래처리스트를 뿌리기위해 가져온다.
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	/* 입력버튼을 누렀을 때 발생하는 post 메소드 */
	@RequestMapping(value = "/" + SUBMENU + "/add", method = RequestMethod.POST)
	public String write(Model model, @SessionAttribute("authUser") UserVo authUser, BuyTaxbillVo vo, Long amount[],
			String supplyValue[], String taxValue[], String purchaseDate[], String itemName[]) {

		// 거래처리스트를 뿌리기위해 가져온다.
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);

		// 입력된 세금계산서번호가 중복인지 알아본다.
		if(menu37Service.checkDuplicateNo(vo.getNo()) != null) {
			model.addAttribute("insertFlag","true");
			return MAINMENU + "/" + SUBMENU + "/add";
		}
		// 입력하는 ID를 vo를 setting 후 insert
		vo.setInsertUserid(authUser.getId());
		menu37Service.insertTax(vo);
		
		// 세금게산서의 품목들을 vo list에 setting 후 insert
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
		for (int i = 0; i < purchaseDate.length; i++) {
			menu37Service.insertItem(list.get(i));
		}

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	/* 조회버튼을 눌렀을 때 승인번호를 기준으로 조회 데이터를 가져오는 post 메소드 */
	@RequestMapping(value = "/" + SUBMENU + "/lookUp", method = RequestMethod.POST)
	public String lookUp(Model model, BuyTaxbillVo vo) {

		// 거래처리스트를 뿌리기위해 가져온다.
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);

		// 승인번호와 matching되는 정보들을 가져온다.
		BuyTaxbillVo getAboutNoData = menu37Service.getAboutNoData(vo.getNo());
		if(getAboutNoData == null ) {
			model.addAttribute("searchFlag","true");
			return MAINMENU + "/" + SUBMENU + "/add";
		}
		
		CustomerVo getAboutNoCustomerData = menu37Service.getAboutNoCustomerData(getAboutNoData.getCompanyName());
		BankAccountVo getAboutNoBankData = menu37Service.getAboutNoBankData(getAboutNoCustomerData.getDepositNo());
		List<BuyTaxbillItemsVo> getAboutItmes = menu37Service.getAboutItmes(vo.getNo());
		
		model.addAttribute("flag", "true");
		model.addAttribute("getAboutNoData", getAboutNoData);
		model.addAttribute("getAboutItmesList", getAboutItmes);
		model.addAttribute("getAboutNoCustomerData", getAboutNoCustomerData);
		model.addAttribute("getAboutNoBankData", getAboutNoBankData);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	/* 삭제를 했을때 발생하는 post 메소드 */
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(Model model, BuyTaxbillVo vo) {
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		
		// 세금계산서가 있는지 확인
		if(menu37Service.checkDuplicateNo(vo.getNo()) == null) {
			model.addAttribute("deleteFlag","true");
			return MAINMENU + "/" + SUBMENU + "/add";
		}
		
		menu37Service.taxbillDelete(vo.getNo());
		menu37Service.taxbillItemDelete(vo.getNo());

		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	/* 수정버튼을 클릭했을때 기존의 데이터를 삭제후 다시 재저장하는 post 메소드 */
	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(Model model, BuyTaxbillVo vo, @SessionAttribute("authUser") UserVo authUser,
			String purchaseDate[], String itemName[], Long amount[], String supplyValue[], String taxValue[]) {
		System.out.println(vo.toString());
		// 거래처리스트를 뿌리기위해 가져온다.
		List<CustomerVo> customerList = menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);
		
		// 기존의 세금계산서를 처음 입력한 날짜와 id를 vo setting
		vo.setInsertDay(vo.getInsertDay());
		vo.setInsertUserid(vo.getInsertUserid());

		// 수정하는 아이디를 vo에 setting
		vo.setUpdateUserid(authUser.getId());

		// 세금계산서와 세금계산서의 품목들을 삭제한다.
		menu37Service.taxbillUpdateDelete(vo.getNo());
		menu37Service.taxbillItemsUpdateDelete(vo.getNo());

		// 세금계산서를 재입력한다.
		menu37Service.insertUpdatedTax(vo);

		// 세금계산서의 항목들을 재입력한다.
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
		for (int i = 0; i < purchaseDate.length; i++) {
			menu37Service.insertUpdatedItem(list.get(i));
		}

		return MAINMENU + "/" + SUBMENU + "/add";
	}

}
