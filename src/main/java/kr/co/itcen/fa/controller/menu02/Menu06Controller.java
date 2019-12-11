package kr.co.itcen.fa.controller.menu02;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu02.Menu06Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
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
	
	@Autowired
	private Menu03Service menu03Service;
	
	@Autowired
	private Menu19Service menu19Service;

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
			System.out.println(result);
		return result;
	}
	
	
	@RequestMapping(value = {"/" + SUBMENU + "/update" }, method = RequestMethod.POST)
	public String update(PurchasemanagementVo vo, @AuthUser UserVo authUser) {
//		System.out.println(menu06Service.getVoucherNo(vo));
//		System.out.println(vo);
		vo.setVoucherNo(menu06Service.getVoucherNo(vo));
		//System.out.println(menu06Service.getVoucherNo(vo));
		if(Integer.parseInt(vo.getTaxbillNo()) == 0 && vo.getVoucherNo() == 0) { // 세금계산서 입력 전에 수정
			System.out.println("세금계산서 입력 전에 수정");
			vo.setTaxbillNo("0");
			vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue())*vo.getQuantity());
			vo.setUpdateUserid(authUser.getId());
			menu06Service.update(vo);
		} else if(Integer.parseInt(vo.getTaxbillNo()) != 0 && vo.getVoucherNo() == 0) { // 세금계산서 번호 품목 일괄 업데이트
			System.out.println("세금계산서 등록");
			menu06Service.TaxbillUpdate(vo);
		} else { // 전표에 등록된 매입건 수정
			System.out.println("전표에 등록된 매입건에 대한 수정");
			vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue())*vo.getQuantity());
			vo.setUpdateUserid(authUser.getId());
			menu06Service.update(vo);
			
			BuyTaxbillVo buyTaxbillVo = new BuyTaxbillVo();
			VoucherVo voucherVo = new VoucherVo();
			List<ItemVo> itemVoList = new ArrayList<ItemVo>();
			MappingVo mappingVo = new MappingVo();
			
			buyTaxbillVo = menu06Service.getTaxbillList(vo);
			CustomerVo customerAccount = menu06Service.getAccount(vo);
//			Long voucherNo = menu06Service.getVoucherNo(vo);
//			System.out.println(menu06Service.getVoucherNo(vo));
//			System.out.println(vo);
//			System.out.println(buyTaxbillVo);
//			System.out.println(customerAccount);
			ItemVo itemVo = new ItemVo();
			ItemVo itemVo2 = new ItemVo();
			ItemVo itemVo3 = new ItemVo();
			
			voucherVo.setNo(menu06Service.getVoucherNo(vo)); // voucherno 꺼내서 넣어줘야함 내 전표에 voucherno가 없어서 수정안됨
			voucherVo.setRegDate(vo.getPurchaseDate());  // 매입일
			itemVo.setAmount(buyTaxbillVo.getTotalSupplyValue() + buyTaxbillVo.getTotalTaxValue()); // 현금
			itemVo.setAmountFlag("c");			// 대변 - c
			itemVo.setAccountNo(1110101L);		// 계정과목코드 
			itemVo.setVoucherNo(vo.getVoucherNo());
			itemVoList.add(itemVo);
			
			itemVo2.setAmount(buyTaxbillVo.getTotalSupplyValue()); 	// 공급가액
			itemVo2.setAmountFlag("d");                                 // 차변 - d
			itemVo2.setAccountNo(1120101L);								// 상품
			itemVo2.setVoucherNo(vo.getVoucherNo());
			itemVoList.add(itemVo2);
			
			itemVo3.setAmount(buyTaxbillVo.getTotalTaxValue()); 		// 부가세금액
			itemVo3.setAmountFlag("d");									// 대변
			itemVo3.setAccountNo(1111201L);								// 부가세대급금
			itemVo3.setVoucherNo(vo.getVoucherNo());
			itemVoList.add(itemVo3);
			
			mappingVo.setSystemCode(vo.getNo());   						   // 매입번호
			mappingVo.setCustomerNo(vo.getCustomerCode());     			   // 거래처 코드
			mappingVo.setManageNo(buyTaxbillVo.getManageNo());	 		   // 세금계산서 번호 입력
			mappingVo.setDepositNo(customerAccount.getDepositNo());	 	   // 계좌번호 입력
			mappingVo.setVoucherNo(vo.getVoucherNo());
			
			//System.out.println(mappingVo);
			Long no = menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, authUser);
			vo.setVoucherNo(no);
			menu06Service.voucherUpdate(vo);
		}
		
		//System.out.println(vo.getTotalPrice());
		//menu06Service.update(vo);
		
		
		return "redirect:/02";
	}
	
	@RequestMapping(value = {"/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(PurchasemanagementVo vo,  @AuthUser UserVo authUser) {
		menu06Service.delete(vo);
		vo.setVoucherNo(menu06Service.getVoucherNo(vo));
		//System.out.println(vo);
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		VoucherVo voucherVo = new VoucherVo();
		voucherVo.setNo(vo.getVoucherNo());
		voucherVolist.add(voucherVo);
		menu03Service.deleteVoucher(voucherVolist, authUser);
		return "redirect:/02";
	}

	@RequestMapping(value = { "", "/" + SUBMENU, "/" + SUBMENU + "/input" }, method = RequestMethod.POST)
	public String input(PurchasemanagementVo purchasemanagementVo, Long number[], int quantity[], String itemCode[],
			String itemName[], Long supplyValue[], Long taxValue[], @AuthUser UserVo authUser, Model model)  throws ParseException  {

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
		purchasemanagementVo.setInsertUserid(authUser.getId());
		
		// 배열로 넘어온 테이블 데이터 리스트에 담기
		

		//마감 여부 체크
				if(menu19Service.checkClosingDate(authUser, purchasemanagementVo.getPurchaseDate())) { 
					System.out.println("마감일자 이전");
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
						purchasemanagementVo.setTotalPrice((purchasemanagementVo.getSupplyValue() + purchasemanagementVo.getTaxValue())*purchasemanagementVo.getQuantity());
						//System.out.println("a : "+purchasemanagementVo);
						menu06Service.insert(purchasemanagementVo);
					}
					return "redirect:/02";
				} else {
					System.out.println("마감일자 이후");
					model.addAttribute("closingDate", true);
					List<PurchaseitemVo> itemList = menu06Service.getItemList();
					List<CustomerVo> customerList = menu06Service.getCustomerList();
					model.addAttribute("itemList", itemList);
					model.addAttribute("customerList", customerList);
					return MAINMENU + "/" + SUBMENU + "/list"; 
				}
	}
	
	@RequestMapping(value="/" + SUBMENU + "/voucher", method=RequestMethod.POST)
	public String voucher(PurchasemanagementVo vo, @AuthUser UserVo authUser, Model model) {
		
		/////////////////////////////////////
		// 전표등록
		
		
		
		// 객체 생성
		BuyTaxbillVo buyTaxbillVo = new BuyTaxbillVo();
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		MappingVo mappingVo = new MappingVo();
		
		buyTaxbillVo = menu06Service.getTaxbillList(vo);
		CustomerVo customerAccount = menu06Service.getAccount(vo);
		System.out.println(vo);
		System.out.println(buyTaxbillVo);
		System.out.println(customerAccount);
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		voucherVo.setRegDate(vo.getPurchaseDate());  // 매입일
		itemVo.setAmount(buyTaxbillVo.getTotalSupplyValue() + buyTaxbillVo.getTotalTaxValue()); // 현금
		itemVo.setAmountFlag("c");			// 대변 - c
		itemVo.setAccountNo(1110101L);		// 계정과목코드 
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(buyTaxbillVo.getTotalSupplyValue()); 	// 공급가액
		itemVo2.setAmountFlag("d");                                 // 차변 - d
		itemVo2.setAccountNo(1120101L);								// 상품
		itemVoList.add(itemVo2);
		
		itemVo3.setAmount(buyTaxbillVo.getTotalTaxValue()); 		// 부가세금액
		itemVo3.setAmountFlag("d");									// 대변
		itemVo3.setAccountNo(1111201L);								// 부가세대급금
		itemVoList.add(itemVo3);
		
		mappingVo.setSystemCode(vo.getNo());   						   // 매입번호
		mappingVo.setCustomerNo(vo.getCustomerCode());     			   // 거래처 코드
		mappingVo.setManageNo(buyTaxbillVo.getManageNo());	 		   // 세금계산서 번호 입력
		mappingVo.setDepositNo(customerAccount.getDepositNo());	 	   // 계좌번호 입력
		//mappingVo.setDepositNo("14278-927129-62");	 	   		   // 계좌번호 입력
		System.out.println(mappingVo);
		Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
		vo.setVoucherNo(no);
		menu06Service.voucherUpdate(vo);
		List<PurchaseitemVo> itemList = menu06Service.getItemList();
		List<CustomerVo> customerList = menu06Service.getCustomerList();
		model.addAttribute("itemList", itemList);
		model.addAttribute("customerList", customerList);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
