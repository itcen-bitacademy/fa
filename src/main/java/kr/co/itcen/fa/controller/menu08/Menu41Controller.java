package kr.co.itcen.fa.controller.menu08;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu08.Menu41Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu08.TaxbillVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 * @author 권영미
 * 
 * 차량관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu41Controller.MAINMENU)
public class Menu41Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "41";

	@Autowired
	private Menu41Service menu41Service;
	
	@Autowired
	private Menu19Service menu19Service;  // 6팀 결산

	@Autowired
	private Menu03Service menu03Service;

	//               /08   /   41     , /08/41/add
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value="id", required = false) String id ) {
		//menu41Service.test();
		/*
		 *   JSP
		 *   08/41/add.jsp
		 * 
		 */
		Map<String, Object> map = new HashMap<>();

		//if 조회기능 else 검색기능
		if(id == null) {			
			map.putAll(menu41Service.selectList());
		}else {
			map.putAll(menu41Service.search(id));
		}
		model.addAllAttributes(map);

		
		//대분류 select box
		map.putAll(menu41Service.getSection());
		model.addAllAttributes(map);

		//직급 select box
		map.putAll(menu41Service.getName());
		model.addAllAttributes(map);
		
		//거래처코드 select box
		map.putAll(menu41Service.getCustomer());
		model.addAllAttributes(map);
		
		

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	
	//등록기능
	@RequestMapping(value = {"/" + SUBMENU + "/insert" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute VehicleVo vehicleVo, @SessionAttribute("authUser") UserVo userVo, Model model) throws ParseException{
		/*
		 * if(vehicleVo.getId() !=null || vehicleVo.getSectionNo() !=null ||
		 * vehicleVo.getClassification() !=null || vehicleVo.getTaxbillNo() !=null ||
		 * vehicleVo.getStaffName() !=null ) {
		 * 
		 * }
		 */
		vehicleVo.setInsertUserId(userVo.getId());
		vehicleVo.setId("e"+vehicleVo.getId());
		
		
		//마감 여부 체크
	    if(!menu19Service.checkClosingDate(userVo, vehicleVo.getPayDate())) { 
    	    model.addAttribute("closingDate", true);
	    	return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
	    } else {
	       menu41Service.insert(vehicleVo);
	       return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add"; 
	    }
	}

	//수정기능
	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method =RequestMethod.POST) 
	public String update(@ModelAttribute VehicleVo vehicleVo, @AuthUser UserVo userVo){
		
		vehicleVo.setUpdateUserId(userVo.getId());
		menu41Service.update(vehicleVo); 	
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add"; 
	}
	
	//삭제기능
	@RequestMapping(value = {"/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(@ModelAttribute VehicleVo vehicleVo, @RequestParam(value="id") String id, @AuthUser UserVo userVo ) {
		
		//삭제한 사람도 남길때 set무엇으로 하는게 적당한지 모르겠음
		vehicleVo.setUpdateUserId(userVo.getId());
		menu41Service.delete(id);
		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
	}
	
	
	//세금 계산서 차량 테이블 수정 기능 + 세금계산서 모달창 세금계산서 삽입기능
	@RequestMapping(value = { "/" + SUBMENU + "/segum" }, method = RequestMethod.POST)
	public String taxbill(@ModelAttribute TaxbillVo taxbillVo, @AuthUser UserVo userVo,
						  @RequestParam(value="gubun" ) String gubun,
						  @RequestParam(value="deposit" ) Long deposit,
						  @RequestParam(value="monthlyFee") Long monthlyFee,
						  @RequestParam(value="cusNo") String customerNo,
						  @RequestParam(value="payDate-1") String maip
						  ) {
		
		
		taxbillVo.setInsertUserid(userVo.getId());
		String taxno = taxbillVo.getTaxbillNo();
		String veno = taxbillVo.getVehicleNo();
		
		// 전표 관련
		CustomerVo cus = menu41Service.getDepositNo(customerNo); // 거래처관련 정보 : 계좌번호, 은행코드, 은행명
		VoucherVo voucherVo = new VoucherVo();  //거래처 객체
		List<ItemVo> itemVoList = new ArrayList<ItemVo>(); //차변대변나누기 위해서 배열선언
		ItemVo itemVo = new ItemVo(); //차변대변나누기 위해서 객체선언
		ItemVo itemVo2 = new ItemVo(); //차변대변나누기 위해서 객체선언
		MappingVo mappingVo = new MappingVo();
		//---
		
		
		
		//왼쪽 : 얻은것(차변) 토지 가격  :::: 오른쪽(대변)  현금   가격 
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String paymentDay = transFormat.format(from);
		
		voucherVo.setRegDate(maip);   //매입일자로 바꾸기
		
		if(gubun.equals("보증금")) {
			//차변
			taxbillVo.setPay(deposit);
			System.out.println("보증금입니다");
			itemVo.setAmount(deposit);   	// landVo.getAcqPrice() : 거래금액 (보증금)
			itemVo.setAmountFlag("d");      //d: 차변 왼쪽
			itemVo.setAccountNo(1220501L);  //계정과목 : 선급금
			itemVoList.add(itemVo);
			
			//대변
			itemVo2.setAmount(deposit);   // landVo.getAcqPrice() : 거래금액 (보증금)
			itemVo2.setAmountFlag("c");   // c: 대변 오른쪽
			itemVo2.setAccountNo(1110101L); //현금
			itemVoList.add(itemVo2);
			mappingVo.setVoucherUse("차량보증금");
			
			
		}else if(gubun.equals("월사용료")) {
			//차변
			taxbillVo.setPay(monthlyFee);
			System.out.println("월사용료입니다");
			itemVo.setAmount(monthlyFee);   // landVo.getAcqPrice() : 거래금액 (월사용료)
			itemVo.setAmountFlag("d");      //d: 차변 왼쪽
			itemVo.setAccountNo(8140104L);  //계정과목 : 미지급금
			itemVoList.add(itemVo);
			
			//대변
			itemVo2.setAmount(deposit);   // landVo.getAcqPrice() : 거래금액 (월사용료)
			itemVo2.setAmountFlag("c");   // c: 대변 오른쪽
			itemVo2.setAccountNo(1110101L); //현금
			itemVoList.add(itemVo2);
			mappingVo.setVoucherUse("차량월사용금");  // 왜 샀는지 적어준다.
		}
		//매핑테이블
		mappingVo.setSystemCode(taxbillVo.getVehicleNo());  // 차량 코드번호
		mappingVo.setDepositNo(cus.getDepositNo());  // 계좌번호
		mappingVo.setCustomerNo(customerNo); //거래처번호
		mappingVo.setManageNo(taxno);//세금계산서번호
		mappingVo.setBankCode(cus.getBankCode()); //은행코드
		mappingVo.setBankName(cus.getBankName()); //은행명
		
		long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo); //전표입력
		
		taxbillVo.setVoucherNo(voucherNo); //전표번호 세팅
		menu41Service.updateTax(taxno, veno, voucherNo, userVo.getId());  //차량 테이블 업데이트
		menu41Service.taxbill(taxbillVo);   //차량세금 인서트
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
	}
	
	
	//세금계산서 정보 조회하기 RequestMethod를 GET메소드로 받아줘야지만 코드가 도는데?
	@ResponseBody
	@RequestMapping(value = {"/" + SUBMENU + "/taxinfo" }, method = RequestMethod.GET)
	public Map<String, Object> taxlist(
			@ModelAttribute TaxbillVo taxbillVo, 
			@RequestParam(value="id", required = false) String id, 
			Model model
			) {

		//조회기능 
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu41Service.selectTaxList(id));
		model.addAllAttributes(map);

		return map;
	}
	
}
