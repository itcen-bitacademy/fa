package kr.co.itcen.fa.controller.menu12;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu12.Menu13Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

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
	
	@Autowired
	private Menu19Service menu19Service;
	
	@Autowired
	private Menu03Service menu03Service;
	
	@Autowired
	private Menu53Controller menu53Controller;
	
	// index
	@RequestMapping(value = {"", "/" + SUBMENU}, method=RequestMethod.GET )
	public String index(@SessionAttribute("authUser") UserVo authUser, Model model) {
		System.out.println("index");
		
		List<CustomerVo> customerlist = menu13Service.getCustomerList();
		List<SalesVo> itemlist = menu13Service.getItemList();
		
		model.addAttribute("customerlist", customerlist); // 거래처 목록 세팅
		model.addAttribute("itemlist", itemlist); // 품목 목록 세팅
		
		return MAINMENU + "/" + SUBMENU + "/index";
	}
	
	//매출 입력
	@RequestMapping(value = {"/" + SUBMENU}, method=RequestMethod.POST)
	public String index(@SessionAttribute("authUser") UserVo authUser, 
							SalesVo salesVo, Model model,
							int quantity[], String itemCode[], String itemName[], 
							Long supplyValue[], Long taxValue[], int number[]) throws ParseException {
		System.out.println("매출 입력" + salesVo);
		
		salesVo.setInsertUserid(authUser.getId()); //세션 ID vo set
		
		ArrayList<SalesVo> list = arrayData(salesVo, quantity, itemCode, itemName, supplyValue, taxValue, number);
		
		//마감 여부 체크
		if(menu19Service.checkClosingDate(authUser, salesVo.getSalesDate())) { 
			menu13Service.insert(list);
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		} else {
			model.addAttribute("closingDate", true); // 마감된 경우
			return MAINMENU + "/" + SUBMENU + "/index"; 
		}
	}
	
	//매출번호로 조회
	@RequestMapping(value= {"/" + SUBMENU + "/{salesNo}"}, method=RequestMethod.GET )
	public String getSales(@PathVariable("salesNo")String salesNo, Model model) {
		System.out.println("매출 조회" + salesNo);
		
		List<CustomerVo> customerlist = menu13Service.getCustomerList(); // 거래처
		List<SalesVo> itemlist = menu13Service.getItemList(); // 품목
		List<SalesVo> sales = menu13Service.getSalesNo(salesNo); // 조회 매출
		
		model.addAttribute("flag", "true"); // 조회 여부 체크 플래그(조회인 경우)
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("itemlist", itemlist);
		model.addAttribute("saleslist", sales);	
		
		return MAINMENU + "/" + SUBMENU + "/index";
	}
	
	//매출 삭제 (flag 데이터 변경)
	@RequestMapping(value= {"/"+ SUBMENU + "/delete/{salesNo}"}, method=RequestMethod.GET)
	public String deleteData(@PathVariable("salesNo")String salesNo, 
							 @SessionAttribute("authUser") UserVo authUser, Model model) {
		System.out.println("매출 삭제"+salesNo);
		menu13Service.deleteData(salesNo); // 매출데이터 flag Y
		Long voucherNo = Long.parseLong(menu13Service.getVoucherNo(salesNo)); // 전표 삭제를 위한 전표번호 get
		menu03Service.deleteVoucher(voucherNo, authUser); // 전표 및 세금계산서 플래그(삭제) 처리
		return MAINMENU + "/" + SUBMENU + "/index"; 
	}
	
	//매출 수정
	@RequestMapping(value= {"/"+ SUBMENU + "/update/{pathSalesNo}"}, method=RequestMethod.POST)
	public String update(@SessionAttribute("authUser") UserVo authUser, Model model,
						 @PathVariable("pathSalesNo")String pathSalesNo, SalesVo salesVo, 
						 int quantity[], String itemCode[], String itemName[], 
						 Long supplyValue[], Long taxValue[], int number[]) throws ParseException {
		
		System.out.println("매출 수정"+pathSalesNo);
		
		salesVo.setUpdateUserid(authUser.getId());
		
		ArrayList<SalesVo> list = arrayData(salesVo, quantity, itemCode, itemName, supplyValue, taxValue, number);
		//마감
		if(menu19Service.checkClosingDate(authUser, salesVo.getSalesDate())) { 
			if(salesVo.getSalesNo() != pathSalesNo) { // vo에 세팅된 번호와 pathvariable번호 일치 
				menu13Service.updateDelete(pathSalesNo); // 업데이트위해 데이터 삭제
				menu13Service.updateInsert(list); // 새로운 데이터 insert
				SellTaxbillVo taxVo = null;
				if(list.get(0).getTaxbillNo().equals("")) { // 세금계산서가 발행되지 않은 데이터 처리
					return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/" + pathSalesNo; 
				} else {
					taxVo = menu13Service.controlTaxbill(pathSalesNo);// 세금계산서 select, delete
					taxVo = menu53Controller.voucher(taxVo, authUser, false);// 전표 업데이트
					System.out.println("수정 세금계산서 :" + taxVo);
					menu13Service.insertTaxvill(taxVo);
				}
			}
			return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/" + pathSalesNo; 
		} else {
			model.addAttribute("closingDate", true);
			return MAINMENU + "/" + SUBMENU + "/index"; 
		}
		
	}
	
	//array데이터 리스트화
	private ArrayList<SalesVo> arrayData(SalesVo salesVo, int quantity[], String itemCode[], String itemName[], 
										Long supplyValue[], Long taxValue[], int number[]){
		ArrayList<SalesVo> list = new ArrayList<SalesVo>();
		for(int i=0; i<itemCode.length; i++) {
			SalesVo vo = new SalesVo(salesVo);
			vo.setQuantity(quantity[i]);
			vo.setItemCode(itemCode[i]);
			vo.setItemName(itemName[i]);
			vo.setSupplyValue(supplyValue[i]);
			vo.setTaxValue(taxValue[i]);
			vo.setNumber(number[i]);
			vo.setSellPrice(supplyValue[i]+taxValue[i]);
			list.add(vo);
		}
		return list;
	}
}
