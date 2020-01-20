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

	// 메인
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" }, method = RequestMethod.GET)
	public String index(Model model) {
		List<PurchaseitemVo> itemList = menu06Service.getItemList();
		List<CustomerVo> customerList = menu06Service.getCustomerList();
		model.addAttribute("itemList", itemList);
		model.addAttribute("customerList", customerList);
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	// 입력
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/input" }, method = RequestMethod.POST)
	public String input(PurchasemanagementVo purchasemanagementVo, Long number[], int quantity[], String itemCode[],
			String itemName[], Long supplyValue[], Long taxValue[], @AuthUser UserVo authUser, Model model)
			throws ParseException {

		Long[] totalPrice = new Long[itemCode.length];
		purchasemanagementVo.setInsertUserid(authUser.getId());
		System.out.println("입력");
		System.out.println(purchasemanagementVo);
		// 마감 여부 체크
		if (menu19Service.checkClosingDate(authUser, purchasemanagementVo.getPurchaseDate())) {
			if (itemCode.length > 1) {
				for (int i = 0; i < itemCode.length; i++) {
					PurchasemanagementVo vo = new PurchasemanagementVo(purchasemanagementVo);
					vo.setNumber(number[i]);
					vo.setQuantity(quantity[i]);
					vo.setItemCode(itemCode[i]);
					vo.setItemName(itemName[i]);
					vo.setSupplyValue(supplyValue[i]);
					vo.setTaxValue(taxValue[i]);
					totalPrice[i] = (supplyValue[i] + taxValue[i]) * quantity[i];
					vo.setTotalPrice(totalPrice[i]);
					menu06Service.insert(vo);
				}
			} else {
				purchasemanagementVo
						.setTotalPrice((purchasemanagementVo.getSupplyValue() + purchasemanagementVo.getTaxValue())
								* purchasemanagementVo.getQuantity());
				menu06Service.insert(purchasemanagementVo);
			}
			return "redirect:/02/06";
		} else {

			model.addAttribute("closingDate", true);
			List<PurchaseitemVo> itemList = menu06Service.getItemList();
			List<CustomerVo> customerList = menu06Service.getCustomerList();
			model.addAttribute("itemList", itemList);
			model.addAttribute("customerList", customerList);
			return MAINMENU + "/" + SUBMENU + "/list";
		}
	}

//	// 전표등록 + 수정
//	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method = RequestMethod.POST)
//	public String update(Model model, PurchasemanagementVo vo, @AuthUser UserVo authUser) {
//		System.out.println(vo.getCustomerCode());
//		System.out.println(vo.getItemCode());
//		System.out.println(vo);
//		vo.setVoucherNo(menu06Service.getVoucherNo(vo));
//
//		// 매입수정만
//		if (vo.getTaxbillNo() == "" || vo.getTaxbillNo() == null || vo.getTaxbillNo().isEmpty()) { // 세금계산서 입력 전에 수정
//			System.out.println("들어오는지 확인");
//			vo.setTaxbillNo(null);
//			
//			vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue()) * vo.getQuantity());
//			vo.setUpdateUserid(authUser.getId());
//			menu06Service.update(vo);
//
//			List<PurchaseitemVo> itemList = menu06Service.getItemList();
//			List<CustomerVo> customerList = menu06Service.getCustomerList();
//			model.addAttribute("itemList", itemList);
//			model.addAttribute("customerList", customerList);
//
//		} else if ((vo.getTaxbillNo() != "" || vo.getTaxbillNo() != null) || vo.getVoucherNo() == null) { // 매입수정과 전표등록을
//																											// 동시에?!
//
//			// 세금계산서 번호 입력
//			vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue()) * vo.getQuantity());
//			vo.setUpdateUserid(authUser.getId());
//			menu06Service.update(vo);
//			menu06Service.TaxbillUpdate(vo);
//
//			/////////////////////////////////////
//			// 전표등록
//			// 객체 생성
//			VoucherVo voucherVo = new VoucherVo();
//			List<ItemVo> itemVoList = new ArrayList<ItemVo>();
//			MappingVo mappingVo = new MappingVo();
//			List<PurchasemanagementVo> price = menu06Service.getPriceList(vo);
//			Long totalPrice = 0L;
//			for (int i = 0; i < price.size(); i++) {
//				totalPrice += price.get(i).getTotalPrice();
//			}
//
//			PurchasemanagementVo taxbillNo = menu06Service.getList(vo);
//			CustomerVo customerAccount = menu06Service.getAccount(vo);
//			ItemVo itemVo = new ItemVo();
//			ItemVo itemVo2 = new ItemVo();
//			ItemVo itemVo3 = new ItemVo();
//
//			voucherVo.setRegDate(vo.getPurchaseDate()); // 매입일
//			itemVo.setAmount(totalPrice); // 현금
//			itemVo.setAmountFlag("c"); // 대변 - c
//			itemVo.setAccountNo(1110101L); // 계정과목코드
//			itemVoList.add(itemVo);
//
//			itemVo2.setAmount((totalPrice * 10) / 11); // 공급가액
//			itemVo2.setAmountFlag("d"); // 차변 - d
//			itemVo2.setAccountNo(1120101L); // 상품
//			itemVoList.add(itemVo2);
//
//			itemVo3.setAmount((totalPrice * 1) / 11); // 부가세금액
//			itemVo3.setAmountFlag("d"); // 대변
//			itemVo3.setAccountNo(1111201L); // 부가세대급금
//			itemVoList.add(itemVo3);
//
//			mappingVo.setSystemCode(vo.getNo()); // 매입번호
//			mappingVo.setCustomerNo(vo.getCustomerCode()); // 거래처 코드
//			mappingVo.setManageNo(taxbillNo.getTaxbillNo()); // 세금계산서 번호 입력
//			mappingVo.setDepositNo(customerAccount.getDepositNo()); // 계좌번호 입력
//			Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
//			vo.setVoucherNo(no);
//			menu06Service.voucherUpdate(vo);
//			List<PurchaseitemVo> itemList = menu06Service.getItemList();
//			List<CustomerVo> customerList = menu06Service.getCustomerList();
//			model.addAttribute("itemList", itemList);
//			model.addAttribute("customerList", customerList);
//		}
//
//		return MAINMENU + "/" + SUBMENU + "/list";
//	}
	
	
//	// 전표등록 + 수정
//		@RequestMapping(value = { "/" + SUBMENU + "/update" }, method = RequestMethod.POST)
//		public String update(Model model, PurchasemanagementVo vo, @AuthUser UserVo authUser) throws ParseException {
//			vo.setVoucherNo(menu06Service.getVoucherNo(vo)); // 전표번호 등록(전표가 없으면 null이 입력되어 전표등록부분으로 감)
//			
//			// 마감 여부 체크
//			if (menu19Service.checkClosingDate(authUser, vo.getPurchaseDate())) {
//				// 매입수정만
//				if (vo.getTaxbillNo() == "" || vo.getTaxbillNo() == null || vo.getTaxbillNo().isEmpty()) { // 세금계산서 입력 전에 수정
//					vo.setTaxbillNo(null);
//					
//					vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue()) * vo.getQuantity());
//					vo.setUpdateUserid(authUser.getId());
//					menu06Service.update(vo);
//
//					List<PurchaseitemVo> itemList = menu06Service.getItemList();
//					List<CustomerVo> customerList = menu06Service.getCustomerList();
//					model.addAttribute("itemList", itemList);
//					model.addAttribute("customerList", customerList);
//
//				} else if ((vo.getTaxbillNo() != "" || vo.getTaxbillNo() != null) || vo.getVoucherNo() == null) {
//
//					// 세금계산서 번호 입력
//					vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue()) * vo.getQuantity());
//					vo.setUpdateUserid(authUser.getId());
//					menu06Service.update(vo);
//					menu06Service.TaxbillUpdate(vo);
//
//					/////////////////////////////////////
//					// 전표등록
//					// 객체 생성
//					VoucherVo voucherVo = new VoucherVo();
//					List<ItemVo> itemVoList = new ArrayList<ItemVo>();
//					MappingVo mappingVo = new MappingVo();
//					List<PurchasemanagementVo> price = menu06Service.getPriceList(vo);
//					Long totalPrice = 0L;
//					for (int i = 0; i < price.size(); i++) {
//						totalPrice += price.get(i).getTotalPrice();
//					}
//
//					PurchasemanagementVo taxbillNo = menu06Service.getList(vo);
//					CustomerVo customerAccount = menu06Service.getAccount(vo);
//					ItemVo itemVo = new ItemVo();
//					ItemVo itemVo2 = new ItemVo();
//					ItemVo itemVo3 = new ItemVo();
//
//					voucherVo.setRegDate(vo.getPurchaseDate()); // 매입일
//					itemVo.setAmount(totalPrice); // 현금
//					itemVo.setAmountFlag("c"); // 대변 - c
//					itemVo.setAccountNo(1110101L); // 계정과목코드
//					itemVoList.add(itemVo);
//
//					itemVo2.setAmount((totalPrice * 10) / 11); // 공급가액
//					itemVo2.setAmountFlag("d"); // 차변 - d
//					itemVo2.setAccountNo(1120101L); // 상품
//					itemVoList.add(itemVo2);
//
//					itemVo3.setAmount((totalPrice * 1) / 11); // 부가세금액
//					itemVo3.setAmountFlag("d"); // 대변
//					itemVo3.setAccountNo(1111201L); // 부가세대급금
//					itemVoList.add(itemVo3);
//
//					mappingVo.setSystemCode(vo.getNo()); // 매입번호
//					mappingVo.setCustomerNo(vo.getCustomerCode()); // 거래처 코드
//					mappingVo.setManageNo(taxbillNo.getTaxbillNo()); // 세금계산서 번호 입력
//					mappingVo.setDepositNo(customerAccount.getDepositNo()); // 계좌번호 입력
//					Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
//					vo.setVoucherNo(no);
//					menu06Service.voucherUpdate(vo);
//					List<PurchaseitemVo> itemList = menu06Service.getItemList();
//					List<CustomerVo> customerList = menu06Service.getCustomerList();
//					model.addAttribute("itemList", itemList);
//					model.addAttribute("customerList", customerList);
//				}
//				return "redirect:/02/06";
//			} else {
//
//				model.addAttribute("closingDate", true);
//				List<PurchaseitemVo> itemList = menu06Service.getItemList();
//				List<CustomerVo> customerList = menu06Service.getCustomerList();
//				model.addAttribute("itemList", itemList);
//				model.addAttribute("customerList", customerList);
//				return MAINMENU + "/" + SUBMENU + "/list";
//			}
//		}
		
		// 전표등록 + 수정
				@RequestMapping(value = { "/" + SUBMENU + "/update" }, method = RequestMethod.POST)
				public String update(Model model, PurchasemanagementVo vo, Long number[], int quantity[], String itemCode[],
						String itemName[], Long supplyValue[], Long taxValue[], @AuthUser UserVo authUser) throws ParseException {
					vo.setVoucherNo(menu06Service.getVoucherNo(vo)); // 전표번호 등록(전표가 없으면 null이 입력되어 전표등록부분으로 감)
					PurchasemanagementVo purchasemanagementVo = new PurchasemanagementVo(vo);
					// 마감 여부 체크
					if (menu19Service.checkClosingDate(authUser, vo.getPurchaseDate())) {
						// 매입수정만
						if (vo.getTaxbillNo() == "" || vo.getTaxbillNo() == null || vo.getTaxbillNo().isEmpty()) { // 세금계산서 입력 전에 수정
							
							if (itemCode.length > 1) {
								Long[] totalPrice = new Long[itemCode.length];
								for (int i = 0; i < itemCode.length; i++) {
									purchasemanagementVo.setTaxbillNo(null);
									purchasemanagementVo.setNumber(number[i]);
									purchasemanagementVo.setQuantity(quantity[i]);
									purchasemanagementVo.setItemCode(itemCode[i]);
									purchasemanagementVo.setItemName(itemName[i]);
									purchasemanagementVo.setSupplyValue(supplyValue[i]);
									purchasemanagementVo.setTaxValue(taxValue[i]);
									totalPrice[i] = (supplyValue[i] + taxValue[i]) * quantity[i];
									purchasemanagementVo.setTotalPrice(totalPrice[i]);
									purchasemanagementVo.setUpdateUserid(authUser.getId());
									menu06Service.update(purchasemanagementVo);
								}
							} else {
								vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue())* vo.getQuantity());
								menu06Service.update(vo);
							}
							List<PurchaseitemVo> itemList = menu06Service.getItemList();
							List<CustomerVo> customerList = menu06Service.getCustomerList();
							model.addAttribute("itemList", itemList);
							model.addAttribute("customerList", customerList);

						} else if ((vo.getTaxbillNo() != "" || vo.getTaxbillNo() != null) || vo.getVoucherNo() == null) {
							System.out.println(vo);
							//세금계산서번호 입력
							if (itemCode.length > 1) {
								Long[] totalPrice = new Long[itemCode.length];
								for (int i = 0; i < itemCode.length; i++) {
									purchasemanagementVo.setNumber(number[i]);
									purchasemanagementVo.setQuantity(quantity[i]);
									purchasemanagementVo.setItemCode(itemCode[i]);
									purchasemanagementVo.setItemName(itemName[i]);
									purchasemanagementVo.setSupplyValue(supplyValue[i]);
									purchasemanagementVo.setTaxValue(taxValue[i]);
									totalPrice[i] = (supplyValue[i] + taxValue[i]) * quantity[i];
									purchasemanagementVo.setTotalPrice(totalPrice[i]);
									purchasemanagementVo.setUpdateUserid(authUser.getId());
									menu06Service.update(purchasemanagementVo);
									menu06Service.TaxbillUpdate(vo);
								}
							} else {
								vo.setTotalPrice((vo.getSupplyValue() + vo.getTaxValue())* vo.getQuantity());
								menu06Service.update(vo);
								menu06Service.TaxbillUpdate(vo);
							}
							
							/////////////////////////////////////
							// 전표등록
							// 객체 생성
							VoucherVo voucherVo = new VoucherVo();
							List<ItemVo> itemVoList = new ArrayList<ItemVo>();
							MappingVo mappingVo = new MappingVo();
							List<PurchasemanagementVo> price = menu06Service.getPriceList(vo);
							Long totalPrice = 0L;
							for (int i = 0; i < price.size(); i++) {
								totalPrice += price.get(i).getTotalPrice();
							}

							PurchasemanagementVo taxbillNo = menu06Service.getList(vo);
							CustomerVo customerAccount = menu06Service.getAccount(vo);
							ItemVo itemVo = new ItemVo();
							ItemVo itemVo2 = new ItemVo();
							ItemVo itemVo3 = new ItemVo();

							voucherVo.setRegDate(vo.getPurchaseDate()); // 매입일
							itemVo.setAmount(totalPrice); // 현금
							itemVo.setAmountFlag("c"); // 대변 - c
							itemVo.setAccountNo(1110101L); // 계정과목코드
							itemVoList.add(itemVo);

							itemVo2.setAmount((totalPrice * 10) / 11); // 공급가액
							itemVo2.setAmountFlag("d"); // 차변 - d
							itemVo2.setAccountNo(1120101L); // 상품
							itemVoList.add(itemVo2);

							itemVo3.setAmount((totalPrice * 1) / 11); // 부가세금액
							itemVo3.setAmountFlag("d"); // 대변
							itemVo3.setAccountNo(1111201L); // 부가세대급금
							itemVoList.add(itemVo3);

							mappingVo.setSystemCode(vo.getNo()); // 매입번호
							mappingVo.setCustomerNo(vo.getCustomerCode()); // 거래처 코드
							mappingVo.setManageNo(taxbillNo.getTaxbillNo()); // 세금계산서 번호 입력
							mappingVo.setDepositNo(customerAccount.getDepositNo()); // 계좌번호 입력
							System.out.println(voucherVo);
							System.out.println(itemVoList);
							System.out.println(mappingVo);
							Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
							vo.setVoucherNo(no);
							menu06Service.voucherUpdate(vo);
							List<PurchaseitemVo> itemList = menu06Service.getItemList();
							List<CustomerVo> customerList = menu06Service.getCustomerList();
							model.addAttribute("itemList", itemList);
							model.addAttribute("customerList", customerList);
						}
						return "redirect:/02/06";
					} else {

						model.addAttribute("closingDate", true);
						List<PurchaseitemVo> itemList = menu06Service.getItemList();
						List<CustomerVo> customerList = menu06Service.getCustomerList();
						model.addAttribute("itemList", itemList);
						model.addAttribute("customerList", customerList);
						return MAINMENU + "/" + SUBMENU + "/list";
					}
				}

//	// 조회
//	@ResponseBody
//	@RequestMapping(value = { "/" + SUBMENU + "/search" }, method = RequestMethod.POST)
//	public PurchasemanagementVo search(Model model, @RequestBody PurchasemanagementVo vo) {
//		PurchasemanagementVo result = menu06Service.getList(vo);
//		return result;
//	}
	
	// 조회
		@ResponseBody
		@RequestMapping(value = { "/" + SUBMENU + "/search" }, method = RequestMethod.POST)
		public List<PurchasemanagementVo> search(Model model, @RequestBody PurchasemanagementVo vo) {
			List<PurchasemanagementVo> result = menu06Service.getSearchList(vo);
			return result;
		}

	// 전표삭제 + 매입삭제
	@RequestMapping(value = { "/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(PurchasemanagementVo vo, Long number[], int quantity[], String itemCode[],
			String itemName[], Long supplyValue[], Long taxValue[], @AuthUser UserVo authUser) {
		System.out.println(vo);
		PurchasemanagementVo purchasemanagementVo = new PurchasemanagementVo(vo);
		if (vo.getTaxbillNo() == "" || vo.getTaxbillNo() == null || vo.getTaxbillNo().isEmpty()) {
			if (itemCode.length > 1) {
				
				for (int i = 0; i < itemCode.length; i++) {
					
					purchasemanagementVo.setNumber(number[i]);
					menu06Service.delete(purchasemanagementVo);
				}
			} else {
				menu06Service.delete(vo);
			}
		} else {
			menu06Service.delete(vo);
			vo.setVoucherNo(menu06Service.getVoucherNo(vo));
			
			// 세금계산서 삭제
			menu06Service.taxbillDelete(vo);
	
			// 전표삭제
			List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>(); // 여러건 동시삭제 때문에 리스트형식으로 받아옴 근데 난 하나씩만 삭제가 가능해서 그냥
																		// 하나만 넣어 보내주면 됨
			VoucherVo voucherVo = new VoucherVo();
			voucherVo.setNo(vo.getVoucherNo());
			voucherVolist.add(voucherVo);
			menu03Service.deleteVoucher(voucherVolist, authUser);
		}
		return "redirect:/02";
	}

}
