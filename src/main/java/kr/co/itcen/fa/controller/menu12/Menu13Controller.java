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
import kr.co.itcen.fa.service.menu12.Menu13Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
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
	
	@Autowired
	private Menu19Service menu19Service;
	
	// index
	@RequestMapping(value = {"", "/" + SUBMENU}, method=RequestMethod.GET )
	public String index(@SessionAttribute("authUser") UserVo authUser, Model model) {
		System.out.println("index");
		
		List<CustomerVo> customerlist = menu13Service.getCustomerList();
		List<PurchaseitemVo> itemlist = menu13Service.getItemList();
		
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
		
		ArrayList<SalesVo> list = new ArrayList<SalesVo>();
		
		// 배열로 넘어온 테이블 데이터 리스트에 담기
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
		
		//마감 여부 체크
		if(!menu19Service.checkClosingDate(authUser, salesVo.getSalesDate())) { 
			menu13Service.insert(list);
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		} else {
			model.addAttribute("closingDate", true);
			return MAINMENU + "/" + SUBMENU + "/index"; 
		}
		
		
	}
	
	//매출번호로 조회
	@RequestMapping(value= {"/" + SUBMENU + "/{salesNo}"}, method=RequestMethod.GET )
	public String getSales(@PathVariable("salesNo")String salesNo, Model model) {
		System.out.println("매출 조회" + salesNo);
		
		List<CustomerVo> customerlist = menu13Service.getCustomerList();
		List<PurchaseitemVo> itemlist = menu13Service.getItemList();
		List<SalesVo> sales = menu13Service.getSalesNo(salesNo);
		
		model.addAttribute("flag", "true"); // 조회 여부 체크 플래그(조회인 경우)
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("itemlist", itemlist);
		model.addAttribute("saleslist", sales);	
		
		return MAINMENU + "/" + SUBMENU + "/index";
	}
	
	//매출 삭제 (flag 데이터 변경)
	@RequestMapping(value= {"/"+ SUBMENU + "/delete/{salesNo}"}, method=RequestMethod.GET)
	public String deleteData(@PathVariable("salesNo")String salesNo) {
		System.out.println("매출 삭제"+salesNo);
		
		menu13Service.deleteData(salesNo);
		
		return MAINMENU + "/" + SUBMENU + "/index"; 
	}
	
	//매출 수정
	@RequestMapping(value= {"/"+ SUBMENU + "/update/{pathSalesNo}"}, method=RequestMethod.POST)
	public String update(@SessionAttribute("authUser") UserVo authUser, 
						 @PathVariable("pathSalesNo")String pathSalesNo, SalesVo salesVo, 
						 int quantity[], String itemCode[], String itemName[], 
						 Long supplyValue[], Long taxValue[], int number[]) {
		
		System.out.println("매출 수정"+pathSalesNo);
		
		salesVo.setUpdateUserid(authUser.getId());
		
		ArrayList<SalesVo> list = new ArrayList<SalesVo>();
		
		// 배열로 넘어온 테이블 데이터 리스트에 담기
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

		if(salesVo.getSalesNo() != pathSalesNo) { // vo에 세팅된 번호와 pathvariable번호 일치 
			menu13Service.updateDelete(pathSalesNo); // 업데이트위해 데이터 삭제
			menu13Service.updateInsert(list); // 새로운 데이터 insert
		}
		
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/" + pathSalesNo; 
	}
}
