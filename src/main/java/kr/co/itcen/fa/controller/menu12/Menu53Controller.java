package kr.co.itcen.fa.controller.menu12;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu12.Menu53Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu53Controller.MAINMENU)
public class Menu53Controller {
	
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "53";


	@Autowired
	private Menu53Service menu53Service;
	
	@Autowired
	private Menu03Service menu03Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		//menu53Service.test();
		
		 //* JSP
		 //* 12/15/list.jsp
		 
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 매출일자와 매출번호로 검색한후, 출력되는 기능
	// value="/" + SUBMENU + "/add", method=RequestMethod.GET
	@RequestMapping(value="/" + SUBMENU + "/list", method=RequestMethod.POST)
	public String list(@RequestParam("sales-date")String date, @RequestParam("sales-no")String no, @RequestParam("sales-no")String salesNo,
			Model model) {
		 
			List<SellTaxbillVo> list = menu53Service.getAllList(date, no);
			model.addAttribute("flag", "true");
			model.addAttribute("list", list);
			System.out.println(list.toString());
		
		// model.addAttribute("flag", "true");
		// model.addAttribute("list", list);
		System.out.println("이벤트 발생");
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표등록 메소드
	public SellTaxbillVo voucher(SellTaxbillVo selltaxbillvo, UserVo authUser, boolean flag){
		System.out.println("Test");
			// true / false
			// 1 - 입력 / 2 - update / 3 - delete
	
			selltaxbillvo.setInsertUserid(authUser.getId());
			selltaxbillvo.setDeleteFlag("N");
		
		
			selltaxbillvo.setAccountNo(1110101L);	// 계정코드 - 넣어주고 // 계좌 / 카드 / 거래처 / 계정 !!!! - 이거와 같은 데이터로 입력해야됨
			selltaxbillvo.setAmountFlag("d");		// select * from 
		
			/////////////////////////////////////
			// 전표등록

			// 객체 생성
			VoucherVo voucherVo = new VoucherVo();				// 전표내용
			List<ItemVo> itemVoList = new ArrayList<ItemVo>();	// 세부항목
			MappingVo mappingVo = new MappingVo();				// 전표내용과 세부항목을 매핑!!!

			ItemVo itemVo = new ItemVo();
			ItemVo itemVo2 = new ItemVo();
			ItemVo itemVo3 = new ItemVo();

			voucherVo.setRegDate(selltaxbillvo.getSalesDate());  // 매출일
			itemVo.setAmount(selltaxbillvo.getTotalSupplyValue() + selltaxbillvo.getTotalTaxValue()); // 현금
			itemVo.setAmountFlag("d");							 // 차변 - d
			itemVo.setAccountNo(1110101L);						 // 계정과목코드 
			itemVoList.add(itemVo);

			itemVo2.setAmount(selltaxbillvo.getTotalSupplyValue()); 	// 공급가액
			itemVo2.setAmountFlag("c");                                 // 대변 - c
			itemVo2.setAccountNo(5010101L);								// 상품매출
			itemVoList.add(itemVo2);

			itemVo3.setAmount(selltaxbillvo.getTotalTaxValue()); 		// 부가세금액
			itemVo3.setAmountFlag("c");									// 대변
			itemVo3.setAccountNo(2140101L);								// 부가세예수금
			itemVoList.add(itemVo3);

			mappingVo.setVoucherUse(selltaxbillvo.getVoucherUse());     // 비고
			mappingVo.setSystemCode(selltaxbillvo.getSalesNo());      	// 매출번호
			mappingVo.setDepositNo(selltaxbillvo.getDepositNo());       // 계좌번호
			mappingVo.setCustomerNo(selltaxbillvo.getCustomerCode());   // 거래처 코드
			mappingVo.setManageNo(selltaxbillvo.getTaxbillNo());		// 세금계산서 번호 입력

			System.out.println("----- 세금계산서 번호 출력 :" + selltaxbillvo.getTaxbillNo() + "voucher method-----");
			
			Long voucherNo = Long.parseLong(selltaxbillvo.getVoucherNo()== null? "0" : selltaxbillvo.getVoucherNo());
			System.out.println("-----"+ voucherNo +"-----");
			
			if(flag) {
				voucherNo = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
				System.out.println("53Controller/voucherNo : " + voucherNo);
				selltaxbillvo.setVoucherNo(String.valueOf(voucherNo));
				System.out.println("53Controller/voucherNo2 : " + selltaxbillvo.getVoucherNo());
				
			} else {
				voucherVo.setNo(Long.parseLong(selltaxbillvo.getVoucherNo()));
				
				for(ItemVo list : itemVoList) {
					list.setVoucherNo(Long.parseLong(selltaxbillvo.getVoucherNo()));
				}
				
				mappingVo.setVoucherNo(Long.parseLong(selltaxbillvo.getVoucherNo()));
				
				System.out.println("매출일자  :" + selltaxbillvo.getSalesDate());
				System.out.println("매출일자2  :" + voucherVo.getRegDate());
				System.out.println("전표번호 :" + voucherVo.getNo());
				
				voucherNo = menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, authUser);
				
				selltaxbillvo.setVoucherNo(String.valueOf(voucherNo));
				
				System.out.println("수정이벤트 발생");
				System.out.println(selltaxbillvo.toString());
			}
			
		return selltaxbillvo;
	}
	
	
	
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(SellTaxbillVo selltaxbillvo, @AuthUser UserVo authUser) {
//		@SessionAttribute("authUser") UserVo authUser, 
//		selltaxbillvo.setInsertUserid(authUser.getId());
//		selltaxbillvo.setDeleteFlag("N");
//		selltaxbillvo.setAccountNo(1110101L);	// 계정코드 - 넣어주고 // 계좌 / 카드 / 거래처 / 계정 !!!! - 이거와 같은 데이터로 입력해야됨
//		selltaxbillvo.setAmountFlag("d");		// select * from 
			
/////////////////////////////////////////////
// 		전표등록
//		객체 생성
//		VoucherVo voucherVo = new VoucherVo();				// 전표내용
//		List<ItemVo> itemVoList = new ArrayList<ItemVo>();	// 세부항목
//		MappingVo mappingVo = new MappingVo();				// 전표내용과 세부항목을 매핑!!!
//		
//		ItemVo itemVo = new ItemVo();
//		ItemVo itemVo2 = new ItemVo();
//		ItemVo itemVo3 = new ItemVo();
//		
//		voucherVo.setRegDate(selltaxbillvo.getSalesDate());  // 매출일
//		itemVo.setAmount(selltaxbillvo.getTotalSupplyValue() + selltaxbillvo.getTotalTaxValue()); // 현금
//		itemVo.setAmountFlag("d");							 // 차변 - d
//		itemVo.setAccountNo(1110101L);						 // 계정과목코드 
//		itemVoList.add(itemVo);
//		
//		itemVo2.setAmount(selltaxbillvo.getTotalSupplyValue()); 	// 공급가액
//		itemVo2.setAmountFlag("c");                                 // 대변 - c
//		itemVo2.setAccountNo(5010101L);								// 상품매출
//		itemVoList.add(itemVo2);
//		
//		itemVo3.setAmount(selltaxbillvo.getTotalTaxValue()); 		// 부가세금액
//		itemVo3.setAmountFlag("c");									// 대변
//		itemVo3.setAccountNo(2140101L);								// 부가세예수금
//		itemVoList.add(itemVo3);
//		
//		mappingVo.setVoucherUse(selltaxbillvo.getVoucherUse());     // 비고
//		mappingVo.setSystemCode(selltaxbillvo.getSalesNo());      	// 매출번호
//		mappingVo.setDepositNo(selltaxbillvo.getDepositNo());       // 계좌번호
//		mappingVo.setCustomerNo(selltaxbillvo.getCustomerCode());   // 거래처 코드
//		mappingVo.setManageNo(selltaxbillvo.getTaxbillNo());		// 세금계산서 번호 입력
//		
//		System.out.println(selltaxbillvo.getTaxbillNo());
//		long voucherNo;
//		
//		voucherNo = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
//		
//		selltaxbillvo.setVoucherNo(String.valueOf(voucherNo)); 
/////////////////////////////////////////////
		
		System.out.println("inserVoucherNo1 : " + selltaxbillvo.getVoucherNo());
		SellTaxbillVo resultSelltaxbillvo = voucher(selltaxbillvo, authUser, true);
		menu53Service.insert(resultSelltaxbillvo); // 세금계산서 테이블
		menu53Service.salesUpdate(resultSelltaxbillvo); // 매출테이블
		
		System.out.println("추가 이벤트 발생");
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
	// 수정사항 발생
	@RequestMapping(value= {"/"+ SUBMENU + "/update/{pathSalesNo}"}, method=RequestMethod.POST)
	public String update(@SessionAttribute("authUser") UserVo authUser,
			@PathVariable("pathSalesNo")String pathSalesNO, SellTaxbillVo selltaxbillvo) {
		
		selltaxbillvo.setSalesNo(pathSalesNO);
		
		System.out.println(selltaxbillvo.getVoucherUse());
		
		menu53Service.taxbillupdate(selltaxbillvo);	// 세금계산서
		menu53Service.salesUpdate(selltaxbillvo);	// 매출관리 테이블
		menu53Service.voucherSystem(selltaxbillvo); // 전표관리 테이블
		
		System.out.println("업데이트 이벤트 발생");
		
		return MAINMENU + "/" + SUBMENU + "/list"; 
	}
	
	
	
}
